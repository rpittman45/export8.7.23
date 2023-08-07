var curUserName = "";
var curUserAccount = "";
var curFullUserName = "";
var curUserName = "";
var curUserEmail = "";
var curUserPhone = "";
var curUserPicture = "";
var curUserOfficeLocation = "";
var curUserRouting = "";
var curUserTitle = "";
var currentUser_PermissionGroups =[];
var currentUser_OCCIAdmin  = false;
var currentUser_OCCIEditor = false;
var currentUser_productionTeam = false;
var currentUser_SA_Access = false;
var currentUser_ArchiveAccess = false;

$(document).ready(function() {
   // Data Picker Initialization
          $('.datepicker').pickadate({
			  // Escape any “rule” characters with an exclamation mark (!).
			  format:  'mm/dd/yyyy',
			  formatSubmit: 'yyyy/mm/dd',
			  hiddenPrefix: 'prefix__',
			  hiddenSuffix: '__suffix'
			 })

   /////////////////get user information   
    var thisUsersValues = $().SPServices.SPGetCurrentUser({
    fieldNames: ["ID", "Name", "Title", "Office","EMail","WorkPhone","Department","FirstName","LastName","Picture","UserName"],
    debug: false
         });
          curUserName = thisUsersValues["FirstName"]+' '+thisUsersValues["LastName"] ;
          curUserUser = thisUsersValues["Name"];
          curUserEmail = thisUsersValues["EMail"] ;
		  curUserPhone = thisUsersValues["WorkPhone"] ;
		  curUserPicture = thisUsersValues["Picture"] ;
		  curUserTitle = thisUsersValues["Title"];
		  curUserOfficeLocation = thisUsersValues["Office"] ;
		  curUserRouting = thisUsersValues["Department"] ;
		  curUserAccount = thisUsersValues["UserName"] ;
    ///////////////////////////////////////////////////////////
//////////Configure Top Navigation
  setTopNav()

//openUploadler('Request Library','RequestTest');

 
    ///set page top Navaigation
       var path = window.location.pathname;
       var page = path.split("/").pop();
       var pageName = page.substring(0,page.indexOf('.'))
         
          ///Activate Top  Nav Link
            $('#navbarSupportedContent').find('.nav-link[href*="'+pageName+'"]').parent('.nav-item').addClass('active')
 
    //////////set custom input attributes
     $('body').on('change','.custom-control-input',function(){
         var inputTypeAttr = $(this).attr('type')
               ///check Radio buttons
                  if(inputTypeAttr == "radio"){
                  var inputRadioName = $(this).attr('name')
                     $('.custom-control-input[name="'+inputRadioName+'"]').attr('Checked',false)
                     $(this).attr('Checked',true)
                  }else if(inputTypeAttr  == "checkbox"){
                      if($(this).is(':checked')){
                        $(this).attr('Checked',true)
                        }else{
                         $(this).attr('Checked',false) 
                        }
                  }
     }) 
      $('body').on('change','select.form-control',function(){
         var inputMutipleAttr = $(this).attr('multiple');
	         if (inputMutipleAttr == "multiple"){   
	           $(this).find('option').attr('Selected',false)
	            $(this).find('option:selected').attr('Selected',true)	
	           
	           }else{
	            $(this).find('option').attr('Selected',false)
	            $(this).find('option:selected').attr('Selected',true)	           
	           }
     })
     ///////////////////////////
   /////reset default date attribute
     $('body').on('change','input.picker__input',function(){
        var newDefaultDate = convertDatePickerValue($(this).val(),'Default'); 
        $(this).attr('data-value','['+newDefaultDate+']')
     })
     /////reset time value
     $('body').on('change','input.timepicker',function(){
        var newDefaultTime =  $(this).val();
        $(this).attr('value',newDefaultTime)
     })
     ///////////////////////////////////
setPermissions()
//////End document ready
});

////////////////////////////////////////
//////////Configure Top Navigation
function setTopNav(){ 
     ///set user profile dropdown
        $('.SPName').html(' '+curUserName)

};
//////change steps
function stepChange(formStep,stepperUl ){
  ////Collapse all forms
        $('#'+stepperUl+'> li').removeClass('active').addClass('in-active')
         $('.step-form').hide();
         ///show selected form
         $('#'+formStep).show();
         $('#'+formStep+'-li').removeClass('in-active').addClass('active')


}
	//////set dropdown options
    function setDropdown(optionSource,optionReturn){
              
                var  Query ='<Query><OrderBy><FieldRef Name="Title"/></OrderBy></Query>'
                  
                        $().SPServices({
                                 operation: "GetListItems",
                                 async: false,
                                 listName: optionSource,                                  
                                       CAMLViewFields: "<ViewFields>" +
                                                        "<FieldRef Name='ID'/>"+
                                                        "<FieldRef Name='Title'/>"+                                           
                                                           "</ViewFields>",                             
                                       CAMLQuery:Query ,
																	
                                  completefunc: function (xData, Status) {
                                          $(xData.responseXML).SPFilterNode("z:row").each(function() {  
                                              var OptionName = $(this).attr("ows_Title");
                                              var OptionID = $(this).attr("ows_ID");
                                               
                                               $(optionReturn).append('<option  value="'+OptionID +';#'+OptionName+'" >'+OptionName+'</option>')
                                           
                                          
                                          })
                                       }
                                    })  ;
                                    
    

    }
///////////////////////////////////////////////////////////////////////////////

//set upload modal
  function openUploadler(libName,FldrName){
        ///remove modal for reset
    $('#UploaderModal').remove();
    
      
     $('body').append(
			      '<div class="modal fade" id="UploaderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">'+
					 ' <div class="modal-dialog modal-lg" role="document">'+
					   ' <div class="modal-content">'+
					    '  <div class="modal-header">'+
					       ' <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>'+
					     // '  <br><h4 class="modal-title"  >PRMS Uploader</h4>'+
					     ' </div>'+
					     ' <div    class="modal-body">'+
					     
                            '<iframe   style="border:0px;margin:auto" width="100%" height="220px" id="UploaderIframe" src="../SiteAssets/UploadIframe.aspx?libraryname='+libName+'&fname='+FldrName+'"></iframe>'+
					     ' </div>'+
					      '<div class="modal-footer">'+
					        '<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>'+
					       					     ' </div>'+
					   ' </div>'+
					  '</div>'+
					'</div>'     
             );
     	////show upload modal
			   $('#UploaderModal').modal('show') ;
     

    
    
    
 }
//////////////////////////////////////////////////////////// 
 ////delete document
   function deleteDocument(docid,docname,doclib){
       
                       $().SPServices({
                                                      operation: "UpdateListItems",
                                                      listName: doclib,
                                                      updates: "<Batch OnError='Continue'><Method ID='1' Cmd='Delete'><Field Name='ID'>"+docid+"</Field><Field Name='FileRef'>"+docname+"</Field></Method></Batch>",
                                                          completefunc: function(xData, Status) {
                                                          
                                                             if(Status == 'success'){
															                        //successfullDelete('Document');
															                      
															                         getRequestAttachments()
															                       		// GetRequestDocuments(thisRequest)													                         
																				      }else{
																				     //  errorDelete('Document')

																				      }





                                                          }

                                                });


   
   }
///////////////////////////////////////////////////////////////////////////////
 ///convert Html
    function encodeHtml(string){
		 var returnHTML = string
		                  //.replace(/&amp;/g,'&')
                        .replace(/&/g,'!#amp#!')
                        .replace(/</g,'!#less#!')
                        .replace(/>/g,'!#great#!')
                        .replace(/"/g,'!#quote#!')
                        .replace(/'/g,"!#singlequote#!") 
                        .replace(/&nbsp;/g,'')
                        .replace(/,/g,'!#comma#!')
                        //.replace(//g,'/')
                        //.replace(/&#x60;/g,'`')
                       // .replace(/&#x3D;/g,'=')
		  return returnHTML ; 
		 
     }
    ///convert Encoded Html
    function decodeHtml(string){
 
		 var returnHTML = string
		                  //.replace(/&amp;/g,'&')
                        .replace(/!#amp#!/g, '&')
                        .replace(/!#less#!/g,'<')
                        .replace(/!#great#!/g,'>')
                        .replace(/!#quote#!/g,'"')
                        .replace(/!#singlequote#!/g,"'")
                        .replace(/!#comma#!/g, ',')
                        //.replace(/!#fslash#!/g,'/')
                        //.replace(/&#x60;/g,'`')
                       // .replace(/&#x3D;/g,'=')

		  return returnHTML ; 
     }
 ////////////////////////////////////////////////////////
         function convertDatePickerValue(dateValue,returnFormat){
       var dateReturnValue = dateValue;
       var dateReturnValue_Month = dateValue.substring(0,dateValue.indexOf('/'));
       var dateReturnValue_Day = dateValue.substring(dateValue.indexOf('/')+1,dateValue.lastIndexOf('/'));
       var dateReturnValue_Year = dateValue.substring(dateValue.lastIndexOf('/')+1)

		       if(returnFormat == "Default"){
		       dateReturnValue_MonthNumber = parseInt(dateReturnValue_Month) 
		       dateReturnValue_Month =  dateReturnValue_MonthNumber-1;
		       dateReturnValue = dateReturnValue_Year+','+dateReturnValue_Month+','+dateReturnValue_Day;
		       }else if(returnFormat == "Submit"){
		       dateReturnValue = dateReturnValue_Year+'/'+dateReturnValue_Month+'/'+dateReturnValue_Day;		        
		       }

        return dateReturnValue;
    }
/////set new toaster
function newToast(toastType,toastTitle,toastMessage){
if(toastType == 'success'){
 toastr.success(toastMessage,toastTitle , {timeOut: 7000,progressBar:true,"positionClass": "toast-bottom-left"});
 }else if(toastType == 'warning'){
toastr.warning(toastMessage,toastTitle , {timeOut: 7000,progressBar:true,"positionClass": "toast-bottom-left"});
} else if(toastType == 'error'){
toastr.error(toastMessage,toastTitle , {timeOut: 7000,progressBar:true,"positionClass": "toast-bottom-left"});;
}else if(toastType == 'info'){
toastr.info(toastMessage,toastTitle , {timeOut: 7000,progressBar:true,"positionClass": "toast-bottom-left"});;
}




}

////////////////////////////////////////////////
function getOCCIPermissions(){

$().SPServices({
     operation: "GetGroupCollectionFromUser",
     userLoginName: $().SPServices.SPGetCurrentUser(),
     async: false,
     completefunc: function(xData, Status) {
     var permissionGroups =['OCCI-Admins','OCCI-NCO 010','OCCI-NCO 100','OCCI-NCO 200','OCCI-NCO 300','OCCI-NCO 400','OCCI-ServiceAdivisor’s'];
        $.each(permissionGroups , function( index, value ) {
		        ///////if a member of the Admin group
		        if($(xData.responseXML).find("Group[Name$='"+value +"']").length == 1)
		        {
		           currentUser_PermissionGroups.push(value);
		           if(value == 'OCCI-Admins' ){
		           		currentUser_OCCIAdmin  = true;
		           		currentUser_productionTeam = true;
		           }else if(value == 'OCCI-ServiceAdivisor’s'){ 		
		           		currentUser_ArchiveAccess = true;
		           		currentUser_SA_Access = true;
		           		currentUser_productionTeam = true;
                    }else{
                    	currentUser_OCCIEditor = true;
                    }          
		        };
		       //////////////// 
		    })   
         getProdTeamMembers();    
      }
   });
        ///set Nav Permissions
        
    

}
function getProdTeamMembers(){
          var  Query ='<Query>'+
                         '<Where>'+
                         '<Or>'+
                          '<Contains>'+                          
                          '<FieldRef Name="SA"/>'+
                          '<Value Type="Text">'+curUserTitle+'</Value>'+
                          '</Contains>'+
                          '<Contains>'+
						  '<FieldRef Name="ProductionContacts"/>'+
                          '<Value Type="Text">'+curUserTitle+'</Value>'+
                         '</Contains>'+
                         '</Or>'+
                          '</Where>'+
                          '<OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'
                            $().SPServices({
                                operation: "GetListItems",
                                async: false,
                                listName: "Requests",                                
                                CAMLViewFields: "<ViewFields>" +
                                                "<FieldRef Name='ID'/>"+
                                                "<FieldRef Name='ProductionContacts'/>"+ 
                                                "<FieldRef Name='SA'/>"+
                                           "</ViewFields>",                           
                                       CAMLQuery:Query ,
                                       CAMLRowLimit: 1,       
                                  completefunc: function (xData, Status) {                                    
                                          $(xData.responseXML).SPFilterNode("z:row").each(function() { 
                                               currentUser_productionTeam = true;
                                               
                                          })
                                   }
                        })           
       
    


}

function setPermissions(){
      getOCCIPermissions();     
   
   /////set top Nav Permissions
     if(currentUser_OCCIAdmin || currentUser_OCCIEditor || currentUser_productionTeam || currentUser_SA_Access){
        $('.editorNavLink').show();
     }
  

}


