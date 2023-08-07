var requestFormValid ;
var requestValidationSkip;
var requestFormStatus = "New"
var thisRequestID;
var errorcount =0;
var defaultWFTEMplateID ="None";
var expediteDefaultWF ="No"
$(document).ready(function() {   
// Tooltips Initialization
			$(function () {
			  $('[data-toggle="tooltip"]').tooltip()
			})
 ///set form dropdowns   
  setDropdown('Campaigns','#input-Campaign');$("#input-Campaign option:contains(None)").attr('selected', 'selected');
  setDropdownProducts('Products & Services Required','#input-Products');
  /////set Routing Codes
	   //setUserRoutingCode()

////preset new request form
 // presetNewForm()

  //toggle submit and save button 
     $('#input-submit').click(function(){
        ///turn on draft button
         if (this.checked) {
               $('#btn-submitrequest').hide();
                  $('#btn-draftrequest').show();

              }else{
              ///turn on submit button
                    $('#btn-submitrequest').show();
                 $('#btn-draftrequest').hide();
                  

              }
        })
/////////////////////////////
 //toggle submit and save button 
     $('#input-Rush').click(function(){
        ///turn on Rush Reasonbutton
         if (this.checked) {
               $('#RushReason-wrap').show();
                   

              }else{
              ///turn off Rush Reason button
                    $('#RushReason-wrap').hide();
                  
                  

              }
        })
/////////////////////////////
////set poc auto complete options
 refreshAvailablePOCs();  
//////////////////////////////////

///intialize form field validation
validateInit();
//////////////////////////////////////
$(document).on('focus','.sp-peoplepicker-topLevel > input',function(){
  $(this).parent().addClass('peoplickerFocus'); 
})
$(document).on('blur','.sp-peoplepicker-topLevel > input',function(){
  $(this).parent().removeClass('peoplickerFocus'); 
})



/////end document ready

});
 
   

/////////////save request form
function saveRequest(saveMode,SaveTrigger,productFolder){
var formStatus = 'Waiting for Approval';
if(saveMode == undefined){
     saveMode = 'New'
}else if(saveMode == 'Draft' ){
     saveMode = 'New'
     formStatus = 'Draft'
}
 
 
 


if(requestValidationSkip != 'Yes'){
validateRequestForm();
} 
///save form if valid
if(requestFormValid == 'Yes' || requestValidationSkip == 'Yes' ){
   //reset validation skip
    requestValidationSkip = 'No'
///set form fields
   var field_ProjectTitle = $('#input-ProjectTitle').val();
   var field_Campaign= $('#input-Campaign').val();
          if( field_Campaign!= undefined){
             field_Campaign = field_Campaign.substring(0,field_Campaign.indexOf(';'));
          }else{
            field_Campaign ='';
          }

   var field_Requestor= getPeoplePickerValue('input-Email-Spo');
   var field_Description = $('#input-Description').val();
   var field_Routing = $('#input-Routing').val();
          if( field_Routing != undefined){
             field_Routing = field_Routing.substring(0,field_Routing.indexOf(';'));
          }else{
            field_Routing ='';
          }
   var field_Phone = $('#input-Phone').val();
   var field_Office =  $('#input-Office').val();
   var field_OD = getPeoplePickerValue('input-OD-spo');
   var field_AA = getPeoplePickerValue('input-AA-spo');
   var field_Due = $('#input-due').val();
   var field_Rush = '';
     if($('#input-Rush').is(':checked')){
       field_Rush = 'true';
     }else{
        field_Rush = 'false';
     }
 
   var field_RushReason = $('#input-RushReason').val();
   var field_Product = $('#input-Products').val();
          if( field_Product != undefined){
             field_Product = field_Product.substring(0,field_Product.indexOf(';'));
          }else{
            field_Product ='';
          }

   var field_ProductDetails = generateProductJSON();
          ///get wf template 
   if(expediteDefaultWF == "No"){
   defaultWFTEMplateID = setRequestDefaultWf("Default");
   }else if(expediteDefaultWF == "Yes"){
   defaultWFTEMplateID = setRequestDefaultWf("Express");
   }
 
  var field_additionalPOCs = generatePocJSON();
                                   
                                  var SavePairs = [["Title",field_ProjectTitle ],
                                                   ["Campaign",field_Campaign],
                                                   ["Description",field_Description],
                                                   ["Requestor",field_Requestor],
                                                   ["Routing_x0020_Code",field_Routing],
                                                   ["Phone_x0020_Number",field_Phone],
                                                   ["Office_x0020_Room_x0020_Number",field_Office ],
                                                   ["Office_x0020_Director_x0028_OD_x",field_OD ],
                                                   ["Associate_x0020_Administrator_x0",field_AA],
                                                   ["Due_x0020_Date",field_Due],
                                                   ["Rush",field_Rush],
                                                   ["Rush_x0020_Reason",field_RushReason],
                                                  // ["Product",field_Product],
                                                   ["Product_x0020_Details",field_ProductDetails],
                                                   ["Status",formStatus ],
                                                   ["DefaultWF",defaultWFTEMplateID],
                                                   ["POCs",field_additionalPOCs],
                                                   ]
                                                                    
                                                             
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															async:false,
															batchCmd: saveMode ,
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															/////get returned new ID
															  var newID = $(xData.responseXML).SPFilterNode("z:row").attr("ows_ID");
															  thisRequestID =newID ;
															 
																				    ////Save Sucessful 
																				   if(Status == 'success'){
																				   ////Request form save alerts
																						   if(formStatus == 'Waiting for Approval'){
																						   requestFormStatus = formStatus 
																	                         RequestAlerts('<strong>Request Form Saved!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'success')
		                                                                                     newToast('success','Request Form Saved!','similique sunt in culpa qui officia deserunt mollitia animi.')   
                                                                                                  }else if(formStatus  == 'Draft' ){
		                                                                                         requestFormStatus = formStatus
		                                                                                           
		                                                                                     RequestAlerts('<strong>Request Form Draft Saved!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'primary')
																						     newToast('info','Request Form Draft Saved!','similique sunt in culpa qui officia deserunt mollitia animi.')   

																						   if(SaveTrigger == "Folder"){
																						       //create new product folder
																						       createFolder('Request'+newID+productFolder,productFolder)
																						   }
																						 
                                                                                          }
																						////////////////////////////////    
																						  ////start Initial workflow
																						     if(saveMode  == "New" && formStatus  != 'Draft' && defaultWFTEMplateID != 'None'){
																						         startDefaultWF( thisRequestID ,defaultWFTEMplateID )
																						     }
                                                                                          
																				      
																				      }else{
																				    //
																				   /////  errorSave('new Procurement Request')
																	                         RequestAlerts('<strong>Save Error!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'danger')
																						     newToast('error','Save Error!','similique sunt in culpa qui officia deserunt mollitia animi.')   

																				     
																				     
																				     }

																				      
															
                                                                            }
												                      });
		 /////////////////////////////
		   }//end form validation
		 }
////////////////////////////////////////////////////












/////preset new request form
function presetNewForm(){ 

////set default current user Requstor fields 
 //$('#input-Email').val(curUserEmail);//Not in Use
 SetUserFieldValue('input-Email-Spo',curUserEmail)
 $('#input-Phone').val(curUserPhone);
 $('#input-Office').val(curUserOfficeLocation);
/////////////////////

//////Get Request documents(not in use)
//getRequestAttachments()

}

///////////////////////////////////////////////////////
//////cancel Campaign form
function cancelCampaignForm(){
 /////////reset Title
$('#input-CampaignTitle').val('')

 ////////reset description
$('#input-CampaignDescription' ).val('')
  

///hide well
 $('#campaignrequest-well').collapse('hide')
///showcampaign btn
  $('#newCampaign-btn').show()

};
/////////////////////////////////////////
//////show Campaign form
function showCampaignForm(){

  ///show well
 $('#campaignrequest-well').collapse('show')
  ///hide campaign btn
  $('#newCampaign-btn').hide()

}





///////////////////////////////////////////////////
function RequestAlerts(Alertmsg, AlertmsgClass){  
  

   var requestFormAlertHtml ='<div class="alert system-alert alert-'+AlertmsgClass+' alert-dismissible fade show" role="alert">'+
            Alertmsg+
  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
    '<span aria-hidden="true">&times;</span>'+
  '</button>'+
'</div>' 
  

/////append alert
  $('#RequestFormAlerts').append(requestFormAlertHtml )


}
/////////////////////////////////////////////




////////////////////////////////////////////////////////////////
 function validateInit(){
 
    //// validate Text inputs
    $('body').on('blur','.input-required',function(){
    var currentInput = $(this).attr('id')
    $('#'+currentInput).addClass('validate')
        ///if input is valid
        if($('#'+currentInput ).is(':valid')){
             
            $('#'+currentInput).removeClass('isInValid') 
        }else{
        
            $('#'+currentInput).addClass('isInValid') 
        }
             
    /////////////////////////////////////////////// 
    
    })
//////////////////////////
//// validate text area inputs
    $('body').on('blur','.textarea-required',function(){
    var currentInput = $(this).attr('id')
    $('#'+currentInput).addClass('validate')
        ///if input is valid
        if($('#'+currentInput ).is(':valid')){
             
          $('#'+currentInput).removeClass('isInValid') 
        }else{
        
            $('#'+currentInput).addClass('isInValid') 
          
        }
             
    /////////////////////////////////////////////// 
    
    })
//////////////////////////
//// validate drop-down inputs
    $('body').on('blur','.choice-required',function(){
    var currentInput = $(this).attr('id')
    $('#'+currentInput).addClass('validate')
        ///if input is valid
        if($('#'+currentInput ).is(':valid')){
             
                
          $('#'+currentInput).removeClass('isInValid') 
        }else{
        
            $('#'+currentInput).addClass('isInValid') 
          
          
        }
             
    /////////////////////////////////////////////// 
    
    })
//////////////////////////
//// validate mutiple drop-down inputs
    $('body').on('blur','.multichoice-required',function(){
    var currentInput = $(this).attr('id')
    $('#'+currentInput).addClass('validate')
        ///if input is valid
        if($('#'+currentInput ).is(':valid')){
             
                
          $('#'+currentInput).removeClass('isInValid') 
        }else{
        
            $('#'+currentInput).addClass('isInValid') 
        }
             
    /////////////////////////////////////////////// 
    
    })
//////////////////////////


//// validate radio inputs
    $('body').on('blur','.radio-required',function(){ 
       ///if check box is checked
                   var currentCBX = $(this).attr('id');
                   var currentCBXName = $(this).attr('name');
                  //$("[type='radio'][name='"+currentCBXName+"'] ") 
            if ( $(this).prop('checked')) {  
                     $(this).parents('.cbx-wrap').css("border", "0px solid red").removeClass('isInValid');
                 //  $("[type='radio'][name='"+currentCBXName+"'] ").removeClass('isInValid');
            }  else{
            
                $(this).parents('.cbx-wrap').css("border", "2px solid red")
            }
    
      
    
    })
//////////////////////////

//// validate checkbox inputs
    $('body').on('blur','.cbx-required',function(){ 
       ///if check box is checked
                   var currentCBX = $(this).attr('id');
                   var currentCBXName = $(this).attr('cbxgroup');
                   var cbxCheckedCount = 0;
                   $("input[type=checkbox][cbxgroup='"+currentCBXName+"']").each(function () { 
                           if ($(this).is(':checked')) {
                              cbxCheckedCount += 1;
					            }					
					            	});
						    /////appy validation changes
						      if(cbxCheckedCount < 1){
						         ///// apply validation for checkbox
					                $(this).parents('.cbx-wrap').css("border", "2px solid red").addClass('isInValid');						      
						      }else{
						            $(this).parents('.cbx-wrap').css("border", "0px solid red").removeClass('isInValid');
						      }
			
    //////////////////////////////////////////////
        })
//////////////////////////
 

//// validate date inputs
    $('body').on('change','.input-required.datepicker',function(){
    var currentInput = $(this).attr('id') ;
    
        ///if input is valid
        if($(this).val().length < 10){ 
             $(this).addClass('date-invalid')
               $('#'+currentInput ).addClass('isInValid') ;

        }else{
                     $(this).removeClass('date-invalid')
             $('#'+currentInput ).removeClass('isInValid')
        }
             
    /////////////////////////////////////////////// 
    
    })
//////////////////////////
 
 
 
 
 
 }////////////////////////////////////////////////////////
 ///////////////////////Vaildate Entire request form
    function validatePeoplePickers(){
         $('label.pickerLabel.isInValid').each(function(){
            $(this).removeClass('isInValid');
         })
        ///find each 
            $('.requiredPicker').each(function(){
               var peoplePickerID = $(this).attr('id');               
               var testPickerValue = getPeoplePickerValue(peoplePickerID);
                  if(testPickerValue == "" || testPickerValue == undefined){
                     $('label[for="'+peoplePickerID+'_TopSpan_EditorInput"]').addClass('isInValid');
                  }
            });
            
              
    };
 function validateRequestForm(){ 
 $('#error-wrap').empty();
  requestFormValid ='Yes';
   /////hide validation alert                         
      $('#RequestFormValidation').hide()
  
 ///check all required inputs
  
   $('.input-required').blur();
   $('.input-required.datepicker').change();
   $('.textarea-required').blur();
   $('.choice-required').blur();
   $('.multichoice-required').blur();
   $('.radio-required').blur();
   $('.cbx-required').blur();
   validatePeoplePickers();
   
     errorcount =0;
     setValidationList('ProjectDetails-Form');
 ////set products and servcies validation
     $('.productform').each(function(){
      setValidationList($(this).attr('id'),'Products');
      })
    // setValidationList('SaveRequest-Form');
     setValidationList('Attachments-Form');
 
 
 
 }//////////////////////////////////////////////
 /////////////////////////set validation list
 function setValidationList(formPageID,formType){
 
  var formpage_status = 'valid';
  
   var form_list = '';
   var validationHtml ='';
   var validationFromPage = formPageID;
   var validationhref = "javascript:stepChange('"+validationFromPage+"','newRquest-stepper')";
   var validationOnclick = "stepChange('"+validationFromPage+"','newRquest-stepper')";
       if(formType == 'Products'){
          validationhref = "javascript:stepChange('ProductsServcies-Form','newRquest-stepper')";
          validationOnclick = "stepChange('ProductsServcies-Form','newRquest-stepper')"
          };
   var productFormList = [];
   var productInputList = [];
   var productHeadingList = [];
       formPageID = '#'+formPageID;
       
       ///add form heading
       var ProductName ='<h5>'+$(formPageID+'-Link').text()+'</h5>';
            
       ///check form 1
           $(formPageID+' .input-required.isInValid').each(function(){
               errorcount+=1;
                 formpage_status = 'InValid';
                 var inputID = $(this).attr('id');
                 var inputLabel = $("label[for='"+inputID+"']").html();
                 var validationLI = '<li><a role="button" class="invalid-link" fieldid="'+inputID +'"  href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';
        
                 form_list += validationLI 
                 
           });
            $(formPageID+' .textarea-required.isInValid').each(function(){
            errorcount+=1;
                  formpage_status = 'InValid';
                  var inputID = $(this).attr('id');
                 var inputLabel = $("label[for='"+inputID+"']").html();
                   form_list += '<li><a role="button" class="invalid-link" fieldid="'+inputID +'"  href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';
 
           });
            $(formPageID+' .choice-required.isInValid').each(function(){
            errorcount+=1;
                  formpage_status = 'InValid';
                   var inputID = $(this).attr('id');
                 var inputLabel = $("label[for='"+inputID+"']").html();
                    form_list += '<li><a role="button" class="invalid-link" fieldid="'+inputID +'"  href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';

           });
             $(formPageID+' .multichoice-required.isInValid').each(function(){
             errorcount+=1;
                  formpage_status = 'InValid';
                  var inputID = $(this).attr('id');
                  // var validationLI =
                 var inputLabel = $("label[for='"+inputID+"']").html();
               form_list += '<li><a role="button" class="invalid-link" fieldid="'+inputID +'" href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';


                
           });
             $(formPageID+' .cbx-wrap[radio-name].isInValid').each(function(){
             errorcount+=1;
                 formpage_status = 'InValid';
                   var inputLabel = $(this).attr('radio-name');
                 form_list += '<li><a role="button"  class="invalid-link"  href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';

           });
           $(formPageID+' .cbx-wrap[cbx-name].isInValid').each(function(){
           errorcount+=1;
                 formpage_status = 'InValid';
                  var inputLabel = $(this).attr('cbx-name');
                 form_list += '<li><a role="button"  class="invalid-link"  href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';

                
           });
       ///   $(formPageID+' .input-required.datepicker.isInValid').each(function(){
            // formpage_status = 'InValid';
              //   var inputID = $(this).attr('id');
              //   var inputLabel = $("label[for='"+inputID+"']").html();
            // form_list += '<li><a role="button" class="invalid-link" fieldid="'+inputID +'"  href="'+validationhref+';$('+"'#"+inputID +"'"+').focus()">'+inputLabel +'</a></li>';


                
       //  })
       
           $(formPageID+' .pickerLabel.isInValid').each(function(){
               errorcount+=1;
                 formpage_status = 'InValid';
                 var inputID = $(this).attr('for');
                 var inputLabel = $("label[for='"+inputID+"']").html();
                 var validationLI = '<li><a role="button" class="invalid-link" fieldid="'+inputID +'"  href="'+validationhref+';scrolltoValidation('+"'"+inputID +"'"+')">'+inputLabel +'</a></li>';
        
                 form_list += validationLI 
                 
           });

       
     
        /////////////////////////////////////////////////////////////
           if( formPageID == '#ProjectDetails-Form' && formpage_status == 'InValid'){
           errorcount+=1;
      validationHtml+= '<h5>Request Details</h5>'+
                           '<ul>'+
                              form_list+
                              '</ul>' ;
                              
                              ///validation toast
                     newToast('error','Request Form Error!','One or more fields are invalid please review the Request Details') 
          
     }else if( formPageID == '#Attachments-Form' && formpage_status == 'InValid'){
          // errorcount+=1;
      validationHtml+= '<h5>Finalize Request</h5>'+
                           '<ul>'+
                              form_list+
                              '</ul>' ;
                              
                              ///validation toast
                     newToast('error','Request Form Error!','One or more fields are invalid please review the Request Details') 
          

   }else if(formType == 'Products' && formpage_status == 'InValid'){
       ///add products to validation list
               
                    validationHtml+= ProductName +'<ul>'+form_list+'</ul>';	
                    newToast('error','Request Form Error!','One or more fields are invalid please review Products and Services') 
													
												

   }else if(formPageID == '#SaveRequest-Form' && formpage_status == 'InValid'){
        validationHtml+= '<h5>Save Request</h5>'+
                           '<ul>'+
                              form_list+
                              '</ul>' 
          

                     newToast('error','Request Form Error!','One or more fields are invalid please review Finalize Request')
   };

        
 
          ///set validation field section
            $('#error-wrap').append(
            validationHtml

            )
            
           //////append product fields   
             

           
 
       /////////////////////
     /////show validation alert                         
     if(formpage_status == 'InValid'){
        $('#RequestFormValidation').show();
        requestFormValid ='No';
       }else{
         
       }
     

     

     
       
 
 
 }
 ///////////////////////////////////////////////////
 	     /////set Routing Codes
	     function setUserRoutingCode(){
	     if(curUserRouting == undefined){
	        curUserRouting  ="None";
	     }
	      var SavePairs = [["Title",curUserRouting ], ]
                                                                    
                                                             
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Routing Codes",
															batchCmd: 'New' ,
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															var defaultRouting =" "
																				    ////Save Sucessful 
																				   if(Status == 'success'){
																				         defaultRouting  = curUserRouting ;
																				      }else{
																				      
																				     }
																				     

																				  ///set Request form dropdown    
															               	        //setDropdown('Routing Codes','#input-Routing');
															               	          $("#input-Routing option:contains("+defaultRouting +")").attr('selected', 'selected');

                                                                            }
												                       /////////////////////////////
                                                         });
	     
	     
	     
	     }
	    ////////////////////////////////////////////////// 
////////////////////Get Request documents
function getRequestAttachments(){
/////empty table body
   $('#RequestAttachmenT-TBL').empty()

     DocumentQuery = '<Query><OrderBy><FieldRef Name="Created" Ascending="False" /></OrderBy></Query>'
                
    ////////////////SPServices Get List Items
                               $().SPServices({
								    operation: "GetListItems",
								    async: false,
								    listName: 'Request Library',
								    CAMLViewFields: "<ViewFields><FieldRef Name='ID' /><FieldRef Name='LastMod' /><FieldRef Name='FileDirRef' /><FieldRef Name='Created' /><FieldRef Name='_SourceUrl' /><FieldRef Name='_SourceUrl' /><FieldRef Name='FileLeafRef' /><FieldRef Name='ID' /><FieldRef Name='Author' /><FieldRef Name='FileDirRef' /><FieldRef Name='DocIcon' /><FieldRef Name='FileRef' /></ViewFields>",
								    CAMLQuery:DocumentQuery ,
								    CAMLQueryOptions: '<QueryOptions><ViewAttributes Scope="Recursive"/></QueryOptions>',
								    completefunc: function (xData, Status) {
								      $(xData.responseXML).SPFilterNode("z:row").each(function() {
								      //remove placeholder
								     // $('.Document-placeholderRow').remove();
								     
								      var Document_ID = $(this).attr("ows_ID");
								      
								      var Document_Name =$(this).attr("ows_FileLeafRef").substring( $(this).attr("ows_FileLeafRef").indexOf('#')+1);
								      var Document_URL = window.location.protocol + "//" + window.location.host + "/" + $(this).attr("ows_FileDirRef").substring($(this).attr("ows_FileDirRef").indexOf('#')+1)+"/"+Document_Name;
								      var DocumentLink = $(this).attr("ows_FileRef").substring( $(this).attr("ows_FileRef").indexOf('#')+1);
								      var LastModifiedDate = $(this).attr("ows_LastMod").substring( $(this).attr("ows_LastMod").indexOf('#')+1);
								      var Document_Deletefunc ="'"+$(this).attr("ows_ID")+"'"+","+"'"+DocumentLink+"'"+","+"'Request Library'";

 
								      
 
                                     ///set document icon
                    				var docicon = $(this).attr("ows_DocIcon")  
								     if(docicon.indexOf('do') > -1){//Word Document
								           docicon='fa-file-word-o'								          
								     }else if(docicon.indexOf('pdf') > -1){
								            docicon='fa-file-pdf-o'								     
								     }else if(docicon.indexOf('xl') > -1){
								              docicon='fa-file-excel-o'		
								     }else if(docicon.indexOf('ppt') > -1){
								              docicon='fa-file-powerpoint-o'		
								     }else{
                                              docicon = 'fa-file-o'
                                           }
                                          //////////////////
                                          ///set PDF Link
                                          if($(this).attr("ows_DocIcon").indexOf('pdf') > -1 ){
                                           // Document_URL = 'http://our.dot.gov/sites/prms/Form%20Storage/Forms/PDF%20View.aspx?pdf='+Document_ID
                                          }
                                          ////////////////////////////////////////////////
                                          ///set Table row
                                          var tableRow ='<tr>'+
													       
													      '<th  scope="row"><a  class="ReLink" href="'+ Document_URL+'"><i class="fa '+docicon+'" aria-hidden="true"></i> '+Document_Name+'</a></th>'+
													      '<td>'+LastModifiedDate +'</td>'+
													      '<td style="padding:2px!important;padding-top:4px!important"><a class="btn-floating " onclick="deleteDocument('+Document_Deletefunc+');" ><i style="color:red"   class="fa fa-trash "></i> </a></td>'+
													   ' </tr>'
													   
										///append to table
										     $('#RequestAttachmenT-TBL').append(tableRow)			   

                                          
                                          ////////////////////////////////////////////////
                                                                                    

                                                });
									                 
									                 
									            }
									   		 });
                                         ////////////////SPServices Get List Items



}
/////////////////////////////////////////////////////////////////////////////
///functions for getting and setting default workflows
function setRequestDefaultWf(DefaultWFOption){
   var returnValue ="None";
    if(DefaultWFOption  == "Default" || DefaultWFOption  == "Express"){
       var  Query ='<Query>'+
                   '<OrderBy><FieldRef Name="Created_x0020_Date" Ascending="False"/></OrderBy>'+
				   '<Where><Eq><FieldRef Name="DefaultWFOption"/><Value Type="Text">'+DefaultWFOption +'</Value></Eq></Where>'+
				   '</Query>'

                        $().SPServices({
                                 operation: "GetListItems",
                                 async: false,
                                 listName: "Workflow Templates",                                  
                                       CAMLViewFields: "<ViewFields>" +
                                                        "<FieldRef Name='ID'/>"+
                                                        "<FieldRef Name='Title'/>"+ 
                                                           "</ViewFields>",                             
                                       CAMLQuery:Query ,
										CAMLRowLimit: 1,							
                                  completefunc: function (xData, Status) {
                                          $(xData.responseXML).SPFilterNode("z:row").each(function() { 
                                             var found_WorkflowID = $(this).attr("ows_ID"); 
                                             var found_WorkflowTitle = $(this).attr("ows_Title");
 
                                              returnValue = found_WorkflowID   

                                             
                                          })
                                       }
                                    })  
             }
 
   return returnValue 
}
function startDefaultWF(assignedRequestID,wfStartID){
 $('#wfIFrame-wrap').empty();
       if(assignedRequestID != undefined && wfStartID!=undefined){ 
         $('#wfIFrame-wrap').html('<iframe id="wfIFrame" style="display:none" src="WorkflowWizard.aspx?request='+assignedRequestID+'&startWF='+wfStartID+'"></iframe>');

       }
  
}
//////////////////////////////////////////////////////////////
 function updateWFStatus(newActiveWFID,newActiveWFTitle){
 
     if(newActiveWFID != undefined){
       //Workflow Started
       RequestAlerts('The workflow <strong>'+newActiveWFTitle+'</strong> was started successfully! Click <a href="WorkflowWizard.aspx?request='+thisRequestID+'&activeWF='+newActiveWFID+'">here</a> to view the status of this workflow.', 'success')
	    newToast('success','Workflow Started!', newActiveWFTitle+' was started successfully!')   

     }else if(newActiveWFID == undefined){
       //Workflow Not Started
       RequestAlerts('<strong>Error Starting Workflow!</strong>  There was an error while trying to start a workflow for this Request. Please contact a SharePoint Administrator for more information.', 'danger')
	  newToast('error','Error Starting Workflow!','There was an error while trying start a workflow for this Request.')

     }
 
 }
///////////////////////////////////////////////////////////////
function peoplepickerFocus(){

alert()

}
/////Re generate additional pocs
function reGenerateRequestPOCs(pocJSON){ 
	 if(pocJSON != undefined || pocJSON != ""  ){ 
		   var newRequesterJSON = JSON.parse("["+pocJSON+"]");
		   //alert(newRequesterJSON[0].Name)
		   $.each( newRequesterJSON , function( index, value ) {
				   ///set POC data
				   var pocName = value.Name;
				   var pocRole = value.Role;
				   ///add new poc and return ID
				     var pocFieldID = addAdditionalPOC_SPO("Yes");
				     //set POC Name
				      SetUserFieldValue(pocFieldID,pocName)
				     //set POC Role 
				      changePOCRole(pocRole,pocFieldID)
				}) ;
	   }		    
};
///generate  POC JSON
    function generatePocJSON(){
        ///generate Produect Object
        var POCArray =[];
      $('.additionalPOCPicker').each(function(){
          var pocID = $(this).attr('id');
          var pocName = getPeoplePickerValue(pocID);
          var pocRole = $(this).attr('role');
           POCArray.push('{'+
                              '"Name":"'+pocName+'",'+
                              '"Role":"'+pocRole+'"'+
                              '}')
			
      });
      var newPOCJSONString  = POCArray.toString();
            return newPOCJSONString  
    }
  //////////////////////////////////////////

