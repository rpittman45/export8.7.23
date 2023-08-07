<%@ Page Language="C#" masterpagefile="../_catalogs/masterpage/Custom.master" title="Requests - Communications Services Request System" %>
<asp:Content id="Content1" runat="Server" contentplaceholderid="ContentPlaceHolder1">
<div class="container">
<div style="display:none" class="row">
<div class="col-lg-12" >
<h2  style="text-align: left">Request Form</h2>
<p style="text-align: left">At vero eos et accusamus et iusto odio dignissimos 
ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos 
dolores et quas molestias excepturi sint occaecati cupiditate non provident, 
similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et 
dolorum fuga.
</p>
 
   
</div>     
</div>
 
<div class="row" >
<div  class="col-lg-12">

 
<!-- Stepper -->
    <!-- Stepers Wrapper -->
        <ul  style="padding-left: 0px" id="newRquest-stepper" class="stepper stepper-horizontal">

            <!-- First Step -->
            <li id="ProjectDetails-Form-li" onclick="stepChange('ProjectDetails-Form','newRquest-stepper')" style="cursor:pointer"  class="active  waves-effect waves-classic ">
                <a  role="button" href="javascript:stepChange('ProjectDetails-Form').preventDefault()"  >
                    <span style="background-color:#3b5998" class="circle c-icon"><b>
				1</b></span><br>
                    <span class="label"><i class="fa fa-check" style="color:#8bc34a!important;display:none" aria-hidden="true"></i> 
				Request Details</span>
                </a>
            </li>

            <!-- Second Step -->
            <li id="ProductsServcies-Form-li" onclick="stepChange('ProductsServcies-Form','newRquest-stepper')" style="cursor:pointer"  class="in-active waves-effect waves-classic ">
                <a role="button" href="javascript:stepChange('ProductsServcies-Form').preventDefault()"  >
                    <span class="circle c-icon"><b>2</b></span><br>
                    <span class="label"><i class="fa fa-check" style="color:#8bc34a!important;display:none" aria-hidden="true"></i> 
				Products &amp; Services</span>
                </a>
            </li>

            <!-- Third Step -->
            <li id="Attachments-Form-li" style="display:" onclick="stepChange('Attachments-Form','newRquest-stepper')" style="cursor:pointer"  class="in-active  waves-effect waves-classic ">
                <a role="button" href="javascript:stepChange('Attachments-Form').preventDefault()"   >
                    <span style="background-color:#3b5998" class="circle c-icon"><b>
				3</b></span><br>
                    <span class="label"><i class="fa fa-check" style="color:#8bc34a!important;display:none" aria-hidden="true"></i> 
				Finalize</span>
                </a>
            </li>
               <!-- Four Step 
            <li id="SaveRequest-Form-li" onclick="stepChange('SaveRequest-Form','newRquest-stepper')" style="cursor:pointer;display:none"  class="in-active  waves-effect waves-classic ">
                <a role="button" href="javascript:stepChange('SaveRequest-Form')"   >
                    <span style="background-color:#3b5998" class="circle c-icon"><b><i class="fa fa-magic"></i></b></span><br>
                    <span class="label"><i class="fa fa-check" style="color:#8bc34a!important;display:none" aria-hidden="true"></i> Workflow Wizard</span>
                </a>
            </li>-->


        </ul>
        <!-- /.Stepers Wrapper -->
<div id="RequestFormAlerts" >

</div>
<div id="RequestFormValidation" style="display:none" >
<div class="alert alert-danger" role="alert">
   <h4><strong>Request Form Error! <span aria-hidden="true" style="color:red">*</span></strong></h4> 
	Please check the fields listed below.
  <hr>
  <div id="error-wrap" ></div>
 
  
</div></div>

</div>
</div>
<!----- Project Details Form -------------->
<div id="ProjectDetails-Form"  style="padding:30px;display:" class="row step-form  border bordr-light hoverable">
<div class="col-12"><h3 class="form-steptitle" >Request Details</h3></div>
<div class="col-lg-4">
     <div class="alert alert-warning hoverable" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>The Request Form begins your request. Please answer each question as 
completely as possible. If the field is not required (if it does not have a red 
asterisk <b style="color:red">*</b>), you can leave it blank.
</p>
<p>Give your project a title that is descriptive and easy for you to remember. 
Please write a short overview of your project in the Description.  
</p>
</div>
 
</div>
          <!-- Default form login -->
 
<div    class=" border border-light col-lg-8 Request-Form ">
<br>
  <head>
</head>
<form>
   

 <div id="ProductionDetail-wrap" class="alert alert-info hoverable sub-form" style=" margin-bottom:10px;" >

   <h4 style="font-size:24px;font-weight:500; margin-bottom:5px;display:none" >
	Production Details</h4>
   <label for="input-Status"  class="details-label" >Status</label> 
                 <input type="text" id="input-Status" style="border:0px;font-weight:bold; background-color:#bee5eb"  value="Draft"    readonly="readonly"  class="form-control mb-2 " >
   
      <div class="row">
      
      <div  class="col">
       <label class="details-label"for="input-JobNumber">
				Job #</label>
    <input type="text" id="input-JobNumber" style="border:0px;font-weight:" readonly="readonly" placeholder="Enter a Job Number"   class="form-control mb-2 productionControls" >
      </div>
       <!-- Grid row -->
            
                <!-- Grid column -->
                <div class="col">
                 <label class="details-label"  for="input-HSNumber">
					HS #</label>
    <input type="text" id="input-HSNumber" style="border:0px;font-weight:" readonly="readonly"  placeholder="Enter a HS #"    class="form-control mb-2 productionControls" >
                </div>
                <!-- Grid column -->

                <!-- Grid column -->
                               <!-- Grid column -->
              </div>
              <!-- Grid row -->
    
 
   </div>
   <!-- Project Title -->
    <label for="input-ProjectTitle">Project Title <span aria-hidden="true" style="color:red">
	*</span></label>
    <input  type="text" id="input-ProjectTitle"  placeholder="Enter a Project Title" required  class="form-control mb-2 input-required" >
            
 
     <!-- Project Description -->
  <label  for="input-Description">Description <span aria-hidden="true" style="color:red">
	*</span></label>
						    <textarea type="text" id="input-Description"  class="form-control mb-2 textarea-required" required="" placeholder="Enter a Project Description" rows="5" ></textarea>
	
      
					
						 
      <!-- Campaign-->
    <label for="input-Campaign">Campaign</label>
    <select  id="input-Campaign" style="margin-bottom:1px!important" class="browser-default form-control mb-2 " >
    
    </SELECT>
      <div id="campaignrequest-well" style=" overflow-y:auto;max-height:; margin-top:10px" class="well z-depth-1 collapse">
             <h4   style="font-size:24px;font-weight:450;color:#333">Campaign 
				Request Form</h4>
              <!-- Campaign Title -->
    <label class="details-label" style="display:" for="input-CampaignTitle">
				Campaign Title</label>
    <input type="text" id="input-CampaignTitle" placeholder="Enter a Campaign Title"  class="form-control mb-2 " >
       <label style="display:" class="details-label"   for="input-CampaignDescription">
				Description</label>
						    <textarea id="input-CampaignDescription"  class="form-control mb-2 "   placeholder="Enter a Campaign Description" rows="5" ></textarea>
	

     


					
      <button type="button" onclick="cancelCampaignForm()" style="color:black!important" class="btn   ">
		Cancel</button>
    <button type="button"  class="btn btn-light-green">Submit</button>
    


   </div>
     
    <button onclick="showCampaignForm()" id="newCampaign-btn" class="btn  btn-light-green btn-sm" style="margin-left:0px!important;display:none" type="button" ><i class="fa fa-plus" style="color:green" aria-hidden="true"></i> 
	Campaign Request</button>
   
   <label for="input-Email-Spo_TopSpan_EditorInput" >Requestor</label> 
   							  

    <div style="display:none" class="input-group mb-2">
							  <div class="input-group-prepend">
							    <a role="button" data-toggle="tooltip" data-placement="bottom"   data-original-title="Search active directory for users"      href="javascript:searchusers('#input-Email')"
							     class="input-group-text group-btn"  ><i style="padding-right:4px" class="fa fa-address-book" aria-hidden="true"></i></a>
							  </div>
							 <input type="text" style="margin-bottom:0px!important;background-color:white!important;cursor:text" onchange="checkPersonisAvailable('#'+$(this).attr('id'))"  id="input-Email" placeholder="Select a Requestor" class="  form-control  autopeoplepicker"> 
							</div>
 
            <div class="peoplePickerDiv" id="input-Email-Spo"></div>
           
  <!-- Grid row -->
    <div class="row">
        <!-- Grid column -->
        <div class="col"> 
            <!-- Routing Code input -->
            <label for="input-Routing" >Routing Code</label> 
             <select id="input-Routing" style="margin-bottom:1px!important" class="browser-default form-control mb-2">
             <option value="">Select a Routing Code</option>
             </select>        </div>
        <!-- Grid column -->

        <!-- Grid column -->
        <div class="col">
             <!-- Phone input -->
            <label for="input-Phone" >Phone Number</label> 
            <input type="text" id="input-Phone" class="form-control mb-2" placeholder="xxx-xxx-xxxx">
        </div>
        <!-- Grid column -->
        <!-- Grid column -->
        <div class="col">
            <!-- Office Room Number input -->
            <label for="input-Office" >Office Room Number</label> 
            <input  id="input-Office" type="text" class="form-control mb-2" placeholder="Enter Office #">
        </div>
        <!-- Grid column -->
 
    </div>
    <!-- Grid row -->
   	  						

    <div style="margin-bottom:20px; float:right;margin-top:20px">
  
    <button type="button" style="background-color:#3b5998!important" onclick="stepChange('ProductsServcies-Form','newRquest-stepper')" class="btn btn-primary btn">
	Next</button>
    
    </div>
    </form>
    <br>
</div>

<!--   --> 
</div>
<div id="ProductsServcies-Form" style="display:none;padding:30px" class="row step-form border bordr-light hoverable ">
<div class="col-12"><h3 class="form-steptitle"  >Products and Services</h3></div>

<div class="col-lg-4">
     <div class="alert alert-warning hoverable " role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
  The second step provides the option to choose the products and/or services you 
	need. Please answer each question as completely as possible. If the field is 
	not required (if it does not have a red asterisk <b style="color:red">*</b>), 
	you can leave it blank. 
</p>
<p>
These products and services are the most commonly requested. If you don’t see 
the product or service you need listed in the drop-down menu, click on the blue 
“Other/Custom” button to add what you need. When you have selected the product 
or service you want, click on the green “Add this Product and Service” button.
</p>
</div>
<div class="alert alert-info hoverable " role="alert">
<span><i class="fa fa-list" aria-hidden="true"></i> <b>Selected Products and 
Services</b></span>
 <ul id="selectedtbl-content">
  
 </ul>
</div>
 
<div class="alert alert-primary hoverable " role="alert">
<span><i class="fa fa-folder" aria-hidden="true"></i> <b>Attachments</b></span>
         <div> 
        <ul id="ProductAttachment-List" style="padding-left:5px;list-style:none">
			    
			    
			</ul>        

 </div>      
      
</div>
</div>
          <!--  -->
<div  class=" border border-light col-lg-8 Request-Form  ">
<br>

<!-- Routing Code input -->
            <label for="input-Products" >Product or Service Required <span aria-hidden="true" ></span></label> 
             <select  id="input-Products" style="margin-bottom:5px!important" class="browser-default form-control mb-2 " >
             <option descIndex="-1" value="">Select a Product or Service</option>
             </select>   
                 
<button type="button" onclick="addProductForm('main')" style="margin-bottom:15px!important" class="btn btn-default btn-rounded">
Add this Product and Service</button> 
<button type="button" onclick="addProductForm('other')" style="margin-bottom:15px!important" class="btn btn-info btn-rounded">
Other/Custom</button> 
    
 <br>
<form id="ProductsServcies-well-wrap" style=" overflow-y:auto;max-height:; display:none">
  </form> 
  <div style="margin-bottom:20px; float:right;margin-top:20px">
    
    <button type="button"  onclick="stepChange('ProjectDetails-Form','newRquest-stepper')" style="color:black!important" class="btn   ">
	Previous</button>
    <button type="button" onclick="stepChange('Attachments-Form','newRquest-stepper')" style="background-color:#3b5998!important" class="btn btn-primary btn">
	Next</button>
    
    </div>
</div>

<!--  --> 
</div>
<div id="SaveRequest-Form" style="display:none;padding:30px" class="row step-form z-depth-3 border bordr-light">
<div class="col-12"><h3  class="form-steptitle"  >Workflow Configuration Wizard</h3>
<p style="color:#3b5998!important">Lorem ipsum dolor sit amet, consectetur 
adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna 
aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi 
ut aliquip ex ea commodo consequat.

</p>
 
<div id="accordion">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h5 class="mb-0">
        <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <b><i class="fa fa-chevron-down wizard-Icon-collapse" aria-hidden="true"></i><i class="fa fa-chevron-right wizard-Icon-expand" aria-hidden="true"></i> 
			Assign Points of Contact</b> 
        </button>
      </h5>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
      <div class="card-body">
       <div class="row">
      
       <div class="col-4">
            <div class="alert alert-warning" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
   At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis 
	praesentium voluptatum deleniti atque corrupti. 
</p>
</div>
      </div>
      <div class="col-6">
 
 
 </div>
 </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingTwo">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <b><i class="fa fa-chevron-down wizard-Icon-collapse" aria-hidden="true"></i><i class="fa fa-chevron-right wizard-Icon-expand" aria-hidden="true"></i> 
			Define Approval Process</b>
        </button>
      </h5>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
      <div class="card-body">
           <div class="row">
              <div class="col-4">
                <div class="alert alert-warning" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
   At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis 
	praesentium voluptatum deleniti atque corrupti. 
</p>
</div>
              </div>
              <div class="col-6 Request-Form">Text</div>
           </div>
  </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h5 class="mb-0">
        <button class="btn btn-link collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <b><i class="fa fa-chevron-down wizard-Icon-collapse" aria-hidden="true"></i><i class="fa fa-chevron-right wizard-Icon-expand" aria-hidden="true"></i> 
			Finalize Worklflow</b>
        </button>
      </h5>
    </div>
    <div id="collapseThree" class="collapse"  aria-labelledby="headingThree" data-parent="#accordion">
      <div class="card-body">
      <div class="row"> 
      <div class="col-4">
      <div class="alert alert-warning" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
   At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis 
	praesentium voluptatum deleniti atque corrupti. 
</p>
</div>

</div>
      <div class="col-6 Request-Form">
<br>

 
   
 
 
 
    

  
        </div>
           </div>
      </div>
    </div>
  </div>
    </div>
  
         <!-- Save button -->
      <button style="margin-bottom:5px!important" onclick="saveRequest()" id="btn-submitrequest-wizard" class="btn btn-light-green btn-block my-4" type="button">
		Submit</button>
          <button style="margin-bottom:5px !important;display:none" onclick="saveRequestTest('Draft')"   id="btn-draftrequest-wizard" class="btn btn-primary btn-block my-4" type="button">
			Save Draft</button>
        <button type="button" onclick="stepChange('Attachments-Form','newRquest-stepper')" style="margin-top:10px !important;margin-bottom:5px !important;color:black!important" class="btn  btn-block mb-3 ">
		Previous</button>
    
  

 
   

     
  
    
    
     </div>  <!-------End WOrkflow Wizard--->
 

    
</div>
</div>

<!-- Attachments -->
<div id="Attachments-Form"  style="padding:30px;display:none" class="row step-form border bordr-light hoverable">
<div class="col-12"><h3 class="form-steptitle" >Finalize Request</h3></div>
<div class="col-lg-4">
     <div class="alert alert-warning hoverable" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
  Please provide names as backup points of contact about your project. Please 
	answer each question as completely as possible. If the field is not required 
	(if it does not have a red asterisk <span style="color:red"><b>*</b></span>), 
	you can leave it blank 
</p>
</div>
  <a class="btn btn-lg btn-block" id="opt-Btn"  type="button" style=" color:black!important;display:none " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>
	Request Options</b> <i class="fa fa-bars" aria-hidden="true"></i></a>
	
<div class="dropdown-menu">   
  <a  class="dropdown-item" href="javascript:forceRequestCancel()" id="requestCancelLink">Cancel Request</a>
  <a  class="dropdown-item" style="display:none" href="#" onclick="spItemRedirect()" id="requestSPEditLink">Manage SharePoint List Item (Admin Only)</a>
  
</div>

</div>
          <!-- Default form login -->
 
<div  class=" border border-light col-lg-8 Request-Form ">
<br>
  
<!-- OD Input -->
   <div class="mb-2">

       <label class="pickerLabel" for="input-OD-spo_TopSpan_EditorInput">Office 
		Director(OD)  <span aria-hidden="true" style="color:red">
		*</span></label>
       <div  style="display:none" class="input-group mb-2">
							  <div class="input-group-prepend">
							    <a  data-toggle="tooltip" data-placement="bottom"   data-original-title="Search active directory for users"  href="javascript:searchusers('#input-OD')"
							    class="input-group-text group-btn" ><i style="padding-right:4px" class="fa fa-address-book" aria-hidden="true"></i> </a>
							  </div>
							 <input type="text" style="margin-bottom:0px!important;background-color:white!important;cursor:text" onchange="checkPersonisAvailable('#'+$(this).attr('id'))"  id="input-OD" placeholder="Select a Office Director(OD)" class="form-control mb-2 autopeoplepicker"> 
							</div>
              
            <div class="peoplePickerDiv requiredPicker" role="OD" id="input-OD-spo"></div>

   </div>
       
      <!-- AA Input -->
      <div class="mb-2">
    <label class="pickerLabel" for="input-AA-spo_TopSpan_EditorInput">Associate 
	Administrator(AA)  <span aria-hidden="true" style="color:red">
	*</span></label>
     <div style="display:none" class="input-group mb-2">
							  <div class="input-group-prepend">
							    <a  data-toggle="tooltip" data-placement="bottom"   data-original-title="Search active directory for users"  href="javascript:searchusers('#input-AA')"
							     class="input-group-text group-btn" ><i style="padding-right:4px" class="fa fa-address-book" aria-hidden="true"></i> </a>
							  </div>
							 <input type="text" style="margin-bottom:0px!important;background-color:white!important;cursor:text" onchange="checkPersonisAvailable('#'+$(this).attr('id'))"  id="input-AA" placeholder="Select a Associate Administrator(AA)" class="form-control mb-2 autopeoplepicker"> 
							</div>
							   <div class="peoplePickerDiv requiredPicker" role="AA" id="input-AA-spo"></div>
		</div>					   
							<div id="addAdditionalPOC-Section"></div>
       <button type="button" style=" background-color:#3b5998!important"  onclick="addAdditionalPOC_SPOTest()" class="btn">
		Additional POCs</button><br><br>
 <!-- Rush? -->
            <div class="custom-control custom-checkbox  mb-2">
                <input type="checkbox" class="custom-control-input"   id="input-Rush">
                <label class="custom-control-label" for="input-Rush">Rush? (If 
				yes please provide justification)</label>
            </div>
   
 <label for="input-due"  >Due Date  <span aria-hidden="true" style="color:red">*</span></label>
				        <div style="width:170px!important" id="dueDate-wrap" class="input-group mb-2">
							  <div class="input-group-prepend">
							    <span class="input-group-text" ><i class="fa fa-calendar" aria-hidden="true"></i></span>
							  </div>
							 <input type="text"  style="margin-bottom:0px!important;background-color:white!important;cursor:text" placeholder="Select a Date" id="input-due"  required   class="form-control mb-2 datepicker "> 
							</div>
          <p  id="dueDate-Text" style="font-size:16px"  class="form-text text-muted mb-2 ">
			This request requires a Due Date of 45+ days.</p>
              <!-- Project Rush Reason-->
              <div class="well" style="display:none" id="RushReason-wrap">
   <label class="details-label" for="input-RushReason">Rush Justification</label>
						    <textarea type="text" id="input-RushReason"  class="form-control mb-2" required  placeholder="Enter Rush Justification" rows="6"></textarea>
	</div>
        
  <!-- Finalize Save buttons -->
      <button style="margin-bottom:5px!important" onclick="saveRequestTest()" id="btn-submitrequest" class="btn btn-light-green btn-block my-4" type="button">
		Submit</button>
          <button style="margin-bottom:5px !important;display:none" onclick="saveRequestTest('Draft')"   id="btn-draftrequest" class="btn btn-primary btn-block my-4" type="button">
			Save Draft</button>
        <button type="button" onclick="stepChange('ProductsServcies-Form','newRquest-stepper')" style="margin-top:10px !important;margin-bottom:5px !important;color:black!important" class="btn  btn-block mb-3 ">
		Previous</button>
   <div id="draftButton">
  <label  for="input-submit">Save as a draft?</label>
   <div class="switch ">
  <label>
    Off
    <input id="input-submit" type="checkbox">
    <span class="lever"></span> On
  </label></div></div>
  </div>
     
    <br>
    <!----Workldow Start Iframe-->
    <div id="wfIFrame-wrap"  ></div>
     
<!--   --> 
</div>

<!--------------   End Attachments     ------------------->
 
</div></div> 

    <script type="text/javascript" src="js/Request.js?rev=31"></script>
    <script type="text/javascript" src="js/ProductsandServices.js?rev=146"></script>
    <script type="text/javascript">
    var queryStringRequestID;
    var formStatus;
    var summaryFilterValue = "New Request";
    
   
  $(document).ready(function(){    
  
//////////////////////////////////
    var queryStringVals = $().SPServices.SPGetQueryString();
        queryStringRequestID = queryStringVals["request"];
          ///set Request form dropdown    
			 setDropdown('Routing Codes','#input-Routing');
    ///set request form view
     if(queryStringRequestID != undefined){
       thisRequestID = queryStringRequestID; 
       //ggleOptBtn(true)
         /////set Routing Codes
	   //setUserRoutingCode() 
       getRequestsItem() ;
       setSubmitButton();
       ///require due date value
	    $('#input-due').addClass("input-required");
          
      }else{
      /////set Routing Codes
	  setUserRoutingCode()
        presetNewForm();
       ///set default due date
       var todaysDate = new Date();
	   todaysDate.setDate(todaysDate.getDate() + 31);
	    var picker = $('#input-due').pickadate('picker');
	    picker.set('select', todaysDate);
	   ///require due date value
	  $('#input-due').addClass("input-required");
        
      }
      
      ///require Office Director
      ///require Associate Administrator
   //  $('#input-AA-spo_TopSpan_HiddenInput').addClass("input-required");///.addClass('input-required')
      
      
    
     ///update field value
     $('body').on('change','.prodfield-wrap > input[type="text"]',function(){
           $(this).attr('value',$(this).val()); 
         });
     ///update number value
     $('body').on('change','.prodfield-wrap > input[type="number"]',function(){
           $(this).attr('value',$(this).val()); 
         })
         
      ///update text area value
     $('body').on('change','.prodfield-wrap > textarea',function(){
          var textAreaVal = $(this).val(); 
           $(this).html(textAreaVal.trim()); 
         })
         
    ///update radio other field value
     $('body').on('change','.prodfield-wrap > .cbx-wrap > .custom-radio > input[type="text"]',function(){
          $(this).attr('value',$(this).val()); 
         });
     ///update check box other field value
     $('body').on('change','.prodfield-wrap > .cbx-wrap > .custom-checkbox  > input[type="text"]',function(){
           $(this).attr('value',$(this).val()); 
         });

   
    ///set rush 
     $('body').on('change','#input-Rush',function(){
          if($(this).is(':checked')){
            $('#dueDate-Text').html('This rushed request requires a Due Date of 15+ days.');
            $('#input-RushReason').addClass("input-required");

         }else{
            $('#dueDate-Text').html('This request requires a Due Date of 45+ days.');
            $('#input-RushReason').removeClass("input-required");

         };
          $('#input-due').val("").datepicker("update");

     })
    ///validate due date 
     $('body').on('change','#input-due',function(){
     if(formStatus == undefined || formStatus == "Saved" ){
		         ///Check if rush is required  if(formStatus != "Saved"){
		         var rushRequest = "No";
		         var rushCheckBox = "#input-Rush";
		         var dueDateRequirement = 45
		          //If the checkbox is checked, display the output text
					  if($(rushCheckBox).is(':checked')){
					    rushRequest = "Yes"; 
					    dueDateRequirement = 14;
					  } else {
					    rushRequest ="No";
					    dueDateRequirement = 45;
					  };
				 ////validate due date
				   var todaysDate = new Date();
				       todaysDate.setDate(todaysDate.getDate()+dueDateRequirement);
				   var dueDateValue ="";
				       if($(this).val() != ""){
				          dueDateValue = new Date($(this).val());
				         };   
 				 
                  if(todaysDate <= dueDateValue ){
                       $('#dueDate-Text').removeClass('text-danger')  
                  }else{ 
                     $('#dueDate-Text').addClass('text-danger')   
                     $('#input-due').val("").datepicker("update");
                     
                  };
	            
			 } 
		  	
       });


setRequestPermissions()

 
 // reGenerateProductHTMLTest()
 // stepChange('Attachments-Form','newRquest-stepper')
    

///////////////////////////////////////////////////////    
    }); 
    function setRequestPermissions(){
    
      ////unloack Job and HS numbers
      if(currentUser_SA_Access || currentUser_OCCIAdmin){
         $('.productionControls').removeAttr('readonly')
      }
    
    
    }
    ///get initial review workflow logics
    function createInitTask(WFActive_Request, wfRole, callbackRole){
    
      var WFActive_AssignedTo = ""; 
      var WFActive_Action = "";
      var WFActive_SystemDate = "";
      var WFActive_Date = "";
      var WFActive_Time = "";
      var WFActive_WFStatus = "In Progress";
      var WFActive_ProductionTask = "No";
      var WFActive_Title = 'Initial Approval - '+wfRole;
      var WFActive_Desc = "The Initial Review and Approval process requires the assigned NHTSA personnel to view a newly submitted Request. Once the review is complete the Assignee will be required to Approve or Reject the request for Production.";
        if(wfRole == 'Office Director'){
           $('.peoplePickerDiv[role="OD"]').each(function(index){
           var pickerID = $(this).attr('id');
                  if(index == 0){
                       WFActive_AssignedTo+=getPeoplePickerValue(pickerID,'Email' );
                       
                   }else{
                       WFActive_AssignedTo+=';'+getPeoplePickerValue(pickerID,'Email'  );

                   }
           })
	      }else if(wfRole == 'Associate Administrator'){
	       $('.peoplePickerDiv[role="AA"]').each(function(index){
           var pickerID = $(this).attr('id');
                  if(index == 0){
                       WFActive_AssignedTo+=getPeoplePickerValue(pickerID,'Email' );
                       
                   }else{
                       WFActive_AssignedTo+=';'+getPeoplePickerValue(pickerID,'Email'  );

                   }
           })
	      
		  }else if(wfRole == 'Communication Services'){
		  WFActive_AssignedTo = 'OCCI-NCO 300'
		  
		  }else if(wfRole == 'Media Services'){
		  WFActive_AssignedTo = 'OCCI-NCO 100'

		  }else if(wfRole == 'Consumer Information'){
		  WFActive_AssignedTo = 'OCCI-NCO 200'

		  }else if(wfRole == 'Digital Strategy'){
		  WFActive_AssignedTo = 'OCCI-NCO 400'
		  
		  }else if(wfRole == 'OCCI Associate Administrators'){
		  WFActive_AssignedTo = 'OCCI-NCO 010'
		  
		  }

		 
      
      var WFActive_Logic ='{"WorkflowSteps":{"title":["'+wfRole+' Review and Approval"]},'+
				          '"WorkflowConditions":{"id":[""],'+
				          '"stepID":[""],'+
				          '"conditonMod":[""],'+
				          '"arg1":[""],'+
				          '"comparison":[""],'+
				          '"arg2":[""]},'+
				          '"WorkflowAction":{"id":["2"],'+
				          '"stepID":["workflowStep1"],'+
							        '"emailTo":["'+WFActive_AssignedTo+'"],'+
							        '"emailBody":["Approval Message Placeholder "],'+
							        '"status":[""],'+
							        '"step":[""]},'+
							          '"ApprovedAction":{"id":["1"],'+
							                            '"ActionWrapID":["approvalActionID1Approval"],'+
							                            '"status":[""],'+
							                            '"emailTo":["'+WFActive_AssignedTo+'"],'+
							                            '"emailBody":["Approved Message Placeholder "],'+
							                            '"step":[""]},'+
							          '"RejectionAction":{"id":["1"],'+
							                             '"ActionWrapID":["approvalActionID1Reject"],'+
							                             '"status":[""],'+
							                             '"emailTo":["'+WFActive_AssignedTo+'"],'+
							                             '"emailBody":["Rejected Message Placeholder "],'+
							                             '"step":[""]}}';
							                             

     var WFActive_Status = '{"currentStatus":{"Steps":["In Progress"],"Actions":["In Progress"],"subActionsApproved":["Not Started"],"subActionsRejected":["Not Started"]}}'
     var WFActive_TaskDetails = '{"Action":{"Date":["Pending"],"Time":[""],"AssignTo":[""],"Comment":[""]},"ApprovalTask":{"Date":["Pending"],"Time":[""],"AssignTo":[""]},"RejectTask":{"Date":["Pending"],"Time":[""],"AssignTo":[""]}}'
     var WFActive_SavePairs =[["Title",WFActive_Title],
			                  ["Description",WFActive_Desc],
			                  ["Logic",WFActive_Logic],  
			                  ["Status",WFActive_Status],
			                  ["Request",WFActive_Request],
			                  ["WorkflowStatus",WFActive_WFStatus], 
			                  ["TaskDetails",WFActive_TaskDetails],  
			                  ["ProductionTask",WFActive_ProductionTask],
			                  ["InitTask","Yes"],   	  									                                                 
			                 ];
	 ///set Workflows Action Variables 
	 var WFAction_Title = WFActive_Title;
	 var WFAction_Request = WFActive_Request;
	 var WFAction_Action = "Approval Request";
	 var WFAction_Comments = "";
	 var WFAction_EmailTo =  WFActive_AssignedTo;
	 var WFAction_HTML = 'Approval Message Placeholder';
	 var WFAction_Status = "In Progress";
	 var WFAction_Subject = 'Approval Test';
	 var WFAction_PrimaryAction = "Yes";
	 var WFAction_SavedActiveID = "";
	 var WFAction_SavePairs = [["Title",WFAction_Title],
		                       ["Index","0"],
		                       ["Email_x0020_Recipients",WFAction_EmailTo],
		                       ["Email_x0020_Subject", WFAction_Subject],
		                       ["Email_x0020_HTML",WFAction_HTML ],
		                       ["Workflow_x0020_Action",WFAction_Action],
		                       ["Step_x0020_Status",WFAction_Status],
		                       ["Request",WFAction_Request],
		                     //["Comments",WFAction_Comments],
		                       ["Primary_x0020_Action",WFAction_PrimaryAction],
		                       ["Sub_x002d_Index","0" ],
		                       ["Workflow_x0020_Template","3" ],

	                            ];
	                            
   //////Save to Workflow Active
                     ////////////////////////////////////////////////////////////////
                     $().SPServices({
						operation: "UpdateListItems",
						listName: "Workflows Active",
						batchCmd: "New",
						valuepairs: WFActive_SavePairs,
						async: false,
						completefunc: function(xData, Status) {						
						    ////Save Sucessful 
						    WFAction_SavedActiveID = $(xData.responseXML).SPFilterNode("z:row").attr("ows_ID");
						    if(Status == 'success'){			    
 
						      //////Save to Workflow Active
                              ////////////////////////////////////////////////////////////////
                              $().SPServices({
									operation: "UpdateListItems",
									listName: "Workflow Actions",
									batchCmd: "New",
									valuepairs: WFAction_SavePairs,
									async: false,
									completefunc: function(xData, Status) {	
										////Save Sucessful
										 WFActive_Action = $(xData.responseXML).SPFilterNode("z:row").attr("ows_ID"); 
										  
							            if(Status == 'success'){
							            
						                   //////Update to Workflow Active
						                     ////////////////////////////////////////////////////////////////
						                     $().SPServices({
												operation: "UpdateListItems",
												listName: "Workflows Active",
												ID: WFAction_SavedActiveID,
												batchCmd: "Update",
												valuepairs: [["Current_x0020_Step",WFActive_Action]],
												async: false,
												completefunc: function(xData, Status) {	
												////Save Sucessful 
							                      if(Status == 'success'){
							                           //Workflow Started
                                                        // RequestAlerts('The workflow <strong>'+WFAction_Title+'</strong> was started successfully! Click <a href="WorkflowWizard.aspx?request='+WFActive_Request+'&activeWF='+WFAction_SavedActiveID+'">here</a> to view the status of this workflow.', 'success')
	                                                        if(callbackRole == "NCO"){
	                                                       // createInitTask(thisRequestID, 'Associate Administrator' );
	                                                        }else if(callbackRole  == "Associate Administrator"){
															 createInitTask(thisRequestID, callbackRole ,'Communication Services');
															}else if(callbackRole  == "Communication Services"){
															 createInitTask(thisRequestID, callbackRole ,'Media Directorate');
															}else if(callbackRole  == "Media Directorate"){
															 createInitTask(thisRequestID, callbackRole ,'Consumer Information');
															}else if(callbackRole  == "Consumer Information"){
															 createInitTask(thisRequestID, callbackRole ,'Digital Strategy');
															}else if(callbackRole  == "Digital Strategy"){
															 createInitTask(thisRequestID, callbackRole ,'OCCI Associate Administrators');
															}else if(callbackRole  == "OCCI Associate Administrators"){
															 createInitTask(thisRequestID, callbackRole );
															}                                                                
							                     
							                      }else{
											      /////Error
												    }
												 }
											  })	    
			                              ///////////////////////////////////////////////////////////////// 

						                }else{
									      /////Error
									    }
									 }
								  })	    
                              /////////////////////////////////////////////////////////////////
						    }else{
						      /////Error
						    }
						 }
					  })	                        
        /////////////////////////////////////////////////////////////////



   
					    }
 
  //////request RequestEmails
  function requestEmailAlerts(alertType,alertTypeTo){
 
    var emailListTitle = "";
    var emailWorkflowAction = "";
    var emailListRequest;
    var emailTO = "" ;
    var emailSubject = "" ;
    var emailText = "" ;
    var emailWorkflowTemplate = "" ;
    
   if(alertType == "Draft"){
        emailListTitle = "Send Email";
        emailWorkflowAction = "Send Email";
        emailListRequest = thisRequestID ;
        emailTO = curUserTitle  ;
        emailSubject = "New Draft Saved" ;
        emailText = "Draft Text";
        emailWorkflowTemplate = 1;  
   }else if(alertType == "Submitted"){
        emailListTitle = "Send Email";
        emailWorkflowAction = "Send Email";
        emailListRequest = thisRequestID ;
        emailTO = curUserTitle  ;
        emailSubject = "Request Submitted" ;
        emailText = "Request Submitted";
        emailWorkflowTemplate = 2;
   }else if(alertType == "Submitted-Approval"){
        emailListTitle = "Send Email";
        emailWorkflowAction = "Send Email";
        emailListRequest = thisRequestID ;
        emailTO = curUserTitle  ;
        emailSubject = "Request Submitted" ;
        emailText = "Request Submitted";
        emailWorkflowTemplate = 3;

   }else{
        emailListTitle = "Send Email";
        emailWorkflowAction = "Send Email";
        emailListRequest = thisRequestID ;
        emailTO = curUserTitle  ;
        emailSubject = "Request Updated" ;
        emailText = "Request Updated";
   }
        
  if(emailListRequest != undefined){
       var SavePairs = [["Title",emailListTitle],
                       // ["Workflow_x0020_Action",emailWorkflowAction],
                        ["Workflow_x0020_Template",emailWorkflowTemplate ],
                        ["Request",emailListRequest],
                        ["Email_x0020_Recipients",emailTO],
                        ["Email_x0020_Subject",emailSubject],
                        ["Email_x0020_HTML",emailText ],
                        ]
                                                                                         
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Workflow Actions",
															batchCmd: "New" ,
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															//alert(Status)
															
															     }
												             });
        };//end if
  
  };  
    
  /////set submit button to update
    function setSubmitButton(){
       $('#btn-submitrequest').attr('onclick',"saveRequestTest('update')");
        $('#btn-draftrequest').attr('onclick',"saveRequestTest('update-draft')")
    }
  ///////////setDueDateCal
  function setDueDateCal(){
  // var 
  //requestValue_DueDateDefault = convertDatePickerValue(requestValue_DueDate,"Default");
  }  
  /////////////////////////////////  
  function getRequestsItem(){
   
  
         var QueryListName = "Requests";
       var Query ='<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+thisRequestID+'</Value></Eq></Where></Query>';
        var QueryFields = "<ViewFields>" +
	                    '<FieldRef Name="ID"/>'+
						'<FieldRef Name="Title"/>'+
						'<FieldRef Name="Campaign"/>'+
						'<FieldRef Name="Requestor"/>'+
						'<FieldRef Name="Routing_x0020_Code"/>'+
						'<FieldRef Name="Phone_x0020_Number"/>'+
						'<FieldRef Name="Office_x0020_Room_x0020_Number"/>'+
						'<FieldRef Name="Office_x0020_Director_x0028_OD_x"/>'+
						'<FieldRef Name="Associate_x0020_Administrator_x0"/>'+
						'<FieldRef Name="Due_x0020_Date"/>'+
						'<FieldRef Name="Rush"/>'+
						'<FieldRef Name="Rush_x0020_Reason"/>'+
						'<FieldRef Name="Description"/>'+
						'<FieldRef Name="Product_x0020_Details"/>'+
						'<FieldRef Name="Status"/>'+
						'<FieldRef Name="Job_x0020_Number"/>'+
						'<FieldRef Name="POCs"/>'+
						'<FieldRef Name="Product"/>'+
						'<FieldRef Name="DefaultWF"/>'+
						'<FieldRef Name="DefaultWF_x003a_Title"/>'+
						'<FieldRef Name="RequestDate"/>'+
						'<FieldRef Name="HS"/>'+
						'<FieldRef Name="SA"/>'+
						'<FieldRef Name="SummaryFilter"/>'+
						'<FieldRef Name="reGenMode"/>'+
	                       "</ViewFields>"
 

                  
                        $().SPServices({
                                 operation: "GetListItems",
                                 async: false,
                                 listName:QueryListName ,                                  
                                       CAMLViewFields:QueryFields,                             
                                       CAMLQuery:Query ,
																	
                                  completefunc: function (xData, Status) {
                                          $(xData.responseXML).SPFilterNode("z:row").each(function() {  
                                           var requestValue_ID =  $(this).attr("ows_ID");
                                           var requestValue_Title =  $(this).attr("ows_Title");
                                           var requestValue_Description =  $(this).attr("ows_Description");
                                           var requestValue_Campaign =  $(this).attr("ows_Campaign");
                                           if(requestValue_Campaign != undefined){
                                              var campaignID  = $(this).attr("ows_Campaign").substring(0,$(this).attr("ows_Campaign").indexOf(';'));
                                              var campaignValue  = $(this).attr("ows_Campaign").substring($(this).attr("ows_Campaign").indexOf('#')+1)
                                                if(campaignID == "archive" ){
                                                   $('#input-Campaign').append('<option value="'+requestValue_Campaign+'">'+campaignValue+'</option>');
                                                }
                                           }
                                           var requestValue_Requestor =  $(this).attr("ows_Requestor")
										   var requestValue_RoutingCode =  $(this).attr("ows_Routing_x0020_Code");
										   var requestValue_PhoneNumber =  $(this).attr("ows_Phone_x0020_Number");
										   var requestValue_OfficeNumber =  $(this).attr("ows_Office_x0020_Room_x0020_Number");
										   var requestValue_JobNumber =  $(this).attr("ows_Job_x0020_Number");
										   var requestValue_HSNumber =  $(this).attr("ows_HS");
										   var requestValue_Status =  $(this).attr("ows_Status");
										   	   summaryFilterValue = $(this).attr("ows_SummaryFilter");								   
										   var requestValue_Products =  $(this).attr("ows_Product_x0020_Details");
										   var requestValue_OD =  $(this).attr("ows_Office_x0020_Director_x0028_OD_x");
										   var requestValue_AA =  $(this).attr("ows_Associate_x0020_Administrator_x0");
										   var requestValue_POCJSON =  $(this).attr("ows_POCs");
										   var requestValue_DueDate =  $(this).attr("ows_Due_x0020_Date");
										 
										   var requestValue_DueDateDefault = "";
										       if(requestValue_DueDate != undefined && requestValue_DueDate != ""){
										          ///not in use
                                                   ////requestValue_DueDateDefault = convertDatePickerValue(requestValue_DueDate,"Default");
										         //requestValue_DueDateDefault = new Date(requestValue_DueDateDefault);
										         requestValue_DueDateDefault = new Date(requestValue_DueDate );
										         
										       }else{
										         requestValue_DueDate = ""; 
										       }
										   var requestValue_Rush =  $(this).attr("ows_Rush");
										   var requestValue_RushReason =  $(this).attr("ows_Rush_x0020_Reason");

                                          
 

                                          //// set request fields  
                                           $('#input-ProjectTitle').val(requestValue_Title);
                                           $('#input-Description').val(requestValue_Description );
                                           $('#input-Campaign').val(requestValue_Campaign );
                                           SetUserFieldValue('input-Email-Spo',requestValue_Requestor)
                                            $('#input-Routing').val(requestValue_RoutingCode );
                                           $('#input-Phone').val(requestValue_PhoneNumber );
                                           $('#input-Office').val(requestValue_OfficeNumber ); 
                                            $('#input-JobNumber').val(requestValue_JobNumber ); 
                                            $('#input-HSNumber').val(requestValue_HSNumber ); 
                                            $('#input-Status').val(requestValue_Status ); 
                                             formStatus = requestValue_Status ;
                                             requestFormStatus  = requestValue_Status ;
                                              
                                              if(formStatus != "Saved"){
                                                $('#draftButton').hide();
                                                $('#btn-submitrequest').html('Save Updates');
                                              }

                                            //// set Products and Services fields   
                                          reGenerateProductHTML(requestValue_Products);                                       
                                        
                                         //// set Finaslize fields   
                                          SetUserFieldValue('input-OD-spo',requestValue_OD);
                                          SetUserFieldValue('input-AA-spo',requestValue_AA);
                                          
                                          if(requestValue_POCJSON != undefined){ 
                                            reGenerateRequestPOCs(requestValue_POCJSON);
                                            };
                                           
                                          
                                           var picker = $('#input-due').pickadate('picker');
	                                                    picker.set('select', requestValue_DueDateDefault );                                           

                                          if(requestValue_Rush == '1'){
                                          $('#input-Rush').prop('checked',true);
                                          $('#input-RushReason').val(requestValue_RushReason );
                                          $('#RushReason-wrap').show();

                                          }
                                          
                                         //////set top Nav Link
                                         
                                           ////set legacy attachments
                                           if($(this).attr("ows_reGenMode") == 'Legacy'){
                                             $('.legacyHTML').each(function(){
                                                // $(this).append('end');
                                                // var currentHTML = $(this).html();
                                                  //   currentHTML = currentHTML.replace('Attachments end','');
                                                  //    $(this).html(currentHTML)
                                             })
                                           }
                                           ////////////////////////////////////////    
  
                                             
                                          })
                                       }
                                    })  ;
                                    
   
            $('#ProductionDetail-wrap').show();
            //hide draft button
             
			  if(formStatus != "Saved"){
			    $('#draftButton').hide();
			  }
     ///enable legacy fields
      $('.legacyHTML').each(function(){
         $(this).find('input').prop('readonly',false);
         $(this).find('input').prop('disabled',false);
         $(this).find('textarea').prop('readonly',false);

      
      })
     ///update legacy checkbox custom-checkbox
      $('.legacyHTML').find('.custom-checkbox > label').each(function(){
       var labelValue = $(this).text();
       if(labelValue == " " || labelValue == ""){
          $(this).html('&nbsp;')
          }
      })

        ////remove old change function from previous form version
       // $('#ProductsServcies-well-wrap > .productform').each(function(){
        // var productIDNumber = $(this).attr('id');
         //remove onchange
        // $('#'+productIDNumber+'-DetailsDF0').attr('onchange','')
         
          toggleOptBtn(true)
       // })       
          
  
  } 
/////change reuqest views
function displayView_Draft(viewMode){


}
/////////////////////////////////////
  //////////////////////////////////////////

/////////////save request form
function saveRequestTest(saveMode,SaveTrigger,productFolder){

// return;
  //ID: itemToDelete,
var saveID = "";
var startInitWorklow= "No";
var teststatus = "";

if(saveMode == undefined){
     saveMode = 'New';
     formStatus = 'Waiting for Production Approval';
     summaryFilterValue = "Approval Queue";
     startInitWorklow="Yes";
}else if(saveMode == 'Draft' ){
     saveMode = 'New'
     formStatus = 'Saved';
      requestValidationSkip = "Yes";
}else if(saveMode == 'New Product' ){
   saveMode = 'New';
   formStatus = 'Saved';
   requestValidationSkip = "Yes";
}else if(saveMode == 'update New Product draft'){
     saveMode = 'Update';
     saveID = thisRequestID ;
     requestValidationSkip = "Yes";
   
}else if(saveMode == 'update' ){
     saveMode = 'Update';
     saveID = thisRequestID ;
     if(formStatus == "Saved"){
     requestFormStatus = 'Waiting for Pro duction Approval';
     formStatus = 'Waiting for Production Approval';
     summaryFilterValue = "Approval Queue";
     startInitWorklow="Yes";
     }
}else if(saveMode == 'update-draft' ){
     saveMode = 'Update';
     saveID = thisRequestID ;
      requestValidationSkip = "Yes";
      
}else if(saveMode == 'Update Product' ){
   saveMode = 'Update';
     saveID = thisRequestID ;
     requestValidationSkip = "Yes";
   
   
}

if(requestValidationSkip != 'Yes'){
validateRequestForm();
}else{
    ///set Draft title is un-named
      if($('#input-ProjectTitle').val() == "" ){
      var todaysDate = new Date();
      var todaysMonth = todaysDate.getMonth()+1; 
      var todaysDay  = todaysDate.getDate(); 
      var todaysYear  = todaysDate.getFullYear();
      var todaysFullDate = todaysMonth +'/'+todaysDay +'/'+todaysYear  ;
      var newPjTitle = "New Project Draft "+todaysFullDate;
           $('#input-ProjectTitle').val(newPjTitle)     
      }
      
      

} 


///save form if valid
if(requestFormValid == 'Yes' || requestValidationSkip == 'Yes' ){
   //reset validation skip
    requestValidationSkip = 'No'
///set form fields
   var field_ProjectTitle = $('#input-ProjectTitle').val();
   var field_Campaign= $('#input-Campaign').val();
          if( field_Campaign == ""){
                 field_Campaign ='None';
          }
     
   var field_Requestor= getPeoplePickerValue('input-Email-Spo');
   var field_Description = $('#input-Description').val();
   var field_Routing = $('#input-Routing').val();
   var field_RoutingNCO = false; 
          if( field_Routing != undefined){
          var field_RoutingText = field_Routing.substring(field_Routing.indexOf('#')+1);
             field_Routing = field_Routing.substring(0,field_Routing.indexOf(';'));
            if(field_RoutingText.indexOf('NCO') > -1 || field_RoutingText.indexOf('nco') > -1 ){
              field_RoutingNCO = true;
            }
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


   var field_ProductDetails = generateProductJSON()
  
  
          ///get wf template 
   if(expediteDefaultWF == "No"){
   defaultWFTEMplateID = setRequestDefaultWf("Default");
   }else if(expediteDefaultWF == "Yes"){
   defaultWFTEMplateID = setRequestDefaultWf("Express");
   }
 
  var field_additionalPOCs = generatePocJSON();
  //hide draft button
  if(formStatus != "Saved"){
    $('#draftButton').hide();
  }

  var manualJOBNumber = $('#input-JobNumber').val();
  var manualHSNumber = $('#input-HSNumber').val();
  
   
         
     $('#input-Status').val(formStatus);
     var field_ProductDetailsx=     '{"ID":22,'+
          '"Type":"Legacy Product or Service:",'+
          '"Name":"Test Product12345",'+
          '"Description":"Desc0","AttachmentButton":"!#less#!button type=!#quote#!button!#quote#! id=!#quote#!productForm-0-AttachmentsBTN!#quote#! onclick=!#quote#!openAttachmentUploadler(!#singlequote#!Request Library!#singlequote#!,!#singlequote#!22;#Legacy Product or Service:!#singlequote#!,!#singlequote#!productForm-0!#singlequote#!)!#quote#! class=!#quote#!btn btn-md upload-btn btn-rounded mb-3 primary-color !#quote#! uploadfolder=!#quote#!undefined!#quote#! foldercreated=!#quote#!undefined!#quote#!!#great#!!#less#!i class=!#quote#!fa fa-paperclip!#quote#! aria-hidden=!#quote#!true!#quote#!!#great#!!#less#!/i!#great#! Attach A file!#less#!/button!#great#!",'+
          '"FieldType":["Single line of text"],'+
          '"HTML":["!#less#!div class=!#quote#!prodfield-wrap!#quote#! fieldtype=!#quote#!Single line of text!#quote#!!#great#!!#less#!label class=!#quote#!details-label!#quote#! for=!#quote#!productForm-0-DetailsDF0!#quote#!!#great#!Name of Test Product12345 !#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/label!#great#!!#less#!input type=!#quote#!text!#quote#! id=!#quote#!productForm-0-DetailsDF0!#quote#! formlocation=!#quote#!productForm-0-Link!#quote#! style=!#quote#!width:100%!#quote#! onchange=!#quote#!if(!$(this).val()||$(this).val().trim().length === 0 ){$(this).val(!#singlequote#!!#singlequote#!);$(!#singlequote#!#productForm-0-AttachLI !#great#! .prodTitle!#singlequote#!).html(!#singlequote#!Test Product12345!#singlequote#!);}else{$(!#singlequote#!#productForm-0-Link!#singlequote#!).html($(this).val());$(!#singlequote#!#productForm-0-AttachLI !#great#! .prodTitle!#singlequote#!).html($(this).val());}!#quote#! class=!#quote#!form-control input-required mb-2 validate valid!#quote#! required=!#quote#!!#quote#! value=!#quote#!Test Product12345!#quote#!!#great#!!#less#!/div!#great#!"],'+
          '"JavaScript":"None"},'+
          '{"ID":22,"Type":"Legacy Product or Service:",'+
          '"Name":"Test Product75","Description":"Desc2","AttachmentButton":"!#less#!button type=!#quote#!button!#quote#! id=!#quote#!productForm-1-AttachmentsBTN!#quote#! onclick=!#quote#!openAttachmentUploadler(!#singlequote#!Request Library!#singlequote#!,!#singlequote#!22;#Legacy Product or Service:!#singlequote#!,!#singlequote#!productForm-1!#singlequote#!)!#quote#! class=!#quote#!btn btn-md upload-btn btn-rounded mb-3 primary-color !#quote#! uploadfolder=!#quote#!undefined!#quote#! foldercreated=!#quote#!undefined!#quote#!!#great#!!#less#!i class=!#quote#!fa fa-paperclip!#quote#! aria-hidden=!#quote#!true!#quote#!!#great#!!#less#!/i!#great#! Attach A file!#less#!/button!#great#!","FieldType":["Single line of text","legacyHTML"],'+
          '"HTML":["!#less#!div class=!#quote#!prodfield-wrap!#quote#! fieldtype=!#quote#!Single line of text!#quote#!!#great#!!#less#!label class=!#quote#!details-label!#quote#! for=!#quote#!productForm-1-DetailsDF0!#quote#!!#great#!Name of Test Product73 !#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/label!#great#!!#less#!input type=!#quote#!text!#quote#! id=!#quote#!productForm-1-DetailsDF0!#quote#! formlocation=!#quote#!productForm-1-Link!#quote#! style=!#quote#!width:100%!#quote#! onchange=!#quote#!if(!$(this).val()||$(this).val().trim().length === 0 ){$(this).val(!#singlequote#!!#singlequote#!);$(!#singlequote#!#productForm-1-AttachLI !#great#! .prodTitle!#singlequote#!).html(!#singlequote#!Test Product73!#singlequote#!);}else{$(!#singlequote#!#productForm-1-Link!#singlequote#!).html($(this).val());$(!#singlequote#!#productForm-1-AttachLI !#great#! .prodTitle!#singlequote#!).html($(this).val());}!#quote#! class=!#quote#!form-control input-required mb-2 validate valid!#quote#! required=!#quote#!!#quote#! value=!#quote#!Test Product73!#quote#!!#great#!!#less#!/div!#great#!","!#less#!div fieldtype=!#quote#!legacyHTML!#quote#! class=!#quote#!legacyHTML prodfield-wrap!#quote#!!#great#!!#less#!p!#great#!!#less#!/p!#great#!!#less#!p!#great#!!#less#!/p!#great#!!#less#!h4!#great#!Description:!#less#!/h4!#great#!!#less#!textarea class=!#quote#!form-control mb-2!#quote#! rows=!#quote#!10!#quote#!!#great#!Cherian Varghese is the author of this fact sheet Abstract: This fact sheet provides the most current FARS/CRSS data on pedestrians. In 2019 there were 6,205 pedestrians killed (Table 1) in traffic crashes in the United States. That is 17 pedestrians a day and 119 pedestrians a week. On average, a pedestrian was killed every 85 minutes in a traffic crash. !#less#!/textarea!#great#! !#less#!p!#great#!!#less#!/p!#great#!!#less#!h4!#great#!Implications for Highway Traffic Safety:!#less#!/h4!#great#!!#less#!textarea class=!#quote#!form-control mb-2!#quote#!'+
          'rows=!#quote#!10!#quote#!!#great#!!#less#!/textarea!#great#!!#less#!p!#great#!!#less#!/p!#great#!!#less#!div class=!#quote#!custom-control custom-checkbox materialized-cbx!#quote#! style=!#quote#!padding-bottom:10px!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#!'+
          ' value=!#quote#!Borrow!#quote#! id=!#quote#!Borrow8-materialized!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!Borrow8-materialized!#quote#! class=!#quote#!custom-control-label mb-2!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#!!#less#!input id=!#quote#!Borrow8!#quote#! type=!#quote#!checkbox!#quote#! value=!#quote#!Borrow!#quote#!!#great#! !#less#!label for=!#quote#!Borrow8!#quote#! style=!#quote#!display: none;!#quote#! class=!#quote#!!#quote#!!#great#!Borrow Artwork from Previous Job #!#less#!/label!#great#! !#less#!input id=!#quote#!BorrowFrom8!#quote#! type=!#quote#!text!#quote#! class=!#quote#!browser-default form-control mb-2!#quote#!!#great#! !#less#!p!#great#!!#less#!/p!#great#!Document Size: !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX1-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! checked=!#quote#!!#quote#! id=!#quote#!productCBX1!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX1!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! 81/2 x 11 !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX2-wrap!#quote#!!#great#!!#less#!input'+
          ' type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX2!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX2!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! 11 x 17 !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX3-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX3!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX3!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! 5-1/2 x 8-1/2 !#less#!p!#great#!!#less#!/p!#great#!'+
          'Colors: !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX4-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX4!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX4!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! B & W !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX5-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! checked=!#quote#!!#quote#! id=!#quote#!productCBX5!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX5!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! Two-Color !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX6-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX6!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!'+
          '!#less#!label for=!#quote#!productCBX6!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! Four-Color!#less#!p!#great#!!#less#!/p!#great#!Number of pages: !#less#!input id=!#quote#!Numberofpages!#quote#! type=!#quote#!text!#quote#! class=!#quote#!browser-default form-control mb-2!#quote#!!#great#!!#less#!p!#great#!!#less#!/p!#great#!Required Logo/s: !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX7-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX7!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX7!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! NHTSA !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX8-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX8!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX8!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#!'+
          ' SaferCar !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX9-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX9!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX9!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! DOT Mark and Signature !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX10-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX10!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX10!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! CIOT !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX11-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX11!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX11!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! DSOGPO !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX12-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX12!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX12!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#! Heatstroke !#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX13-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX13!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX13!#quote#! class=!#quote#!custom-control-label mb-2!#quote#!'+
          ' style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#!EMS!#less#!p!#great#!!#less#!/p!#great#!!#less#!div class=!#quote#!custom-control custom-checkbox custom-control-inline materialized-cbx!#quote#! style=!#quote#!margin-right:0px!#quote#! id=!#quote#!productCBX14-wrap!#quote#!!#great#!!#less#!input type=!#quote#!checkbox!#quote#! id=!#quote#!productCBX14!#quote#! class=!#quote#!custom-control-input!#quote#!!#great#!!#less#!label for=!#quote#!productCBX14!#quote#! class=!#quote#!custom-control-label mb-2!#quote#! style=!#quote#!font-weight:bold;padding-left:14px!#quote#!!#great#! !#less#!/label!#great#!!#less#!/div!#great#!Other !#less#!input id=!#quote#!Other /s8!#quote#! type=!#quote#!text!#quote#! class=!#quote#!browser-default form-control mb-2!#quote#!!#great#!!#less#!/div!#great#!"],'+
          '"JavaScript":"None"}'

       // alert()
         //return;

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
                                                   ["SummaryFilter",summaryFilterValue ],
                                                  // ["Product",field_Product],
                                                   ["Product_x0020_Details",field_ProductDetails],
                                                   ["Status",formStatus ],
                                                   ["DefaultWF",defaultWFTEMplateID],
                                                   ["POCs",field_additionalPOCs],
                                                   ["HS",manualHSNumber],
                                                   ["Job_x0020_Number",manualJOBNumber],

                                                   ]
                                                                    
                                                             
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															batchCmd: saveMode ,
															valuepairs: SavePairs,
															 async: false,
															ID:saveID ,
															completefunc: function(xData, Status) {
															/////get returned new ID
															  var newID = $(xData.responseXML).SPFilterNode("z:row").attr("ows_ID");
															  thisRequestID =newID ;
															  toggleOptBtn(true);
														
																				    ////Save Sucessful 
																				   if(Status == 'success'){
																				   ////Request form save alerts
																						   if(formStatus == 'Waiting for Production Approval'){
																						   requestFormStatus = formStatus 
																	                        // RequestAlerts('<strong>Request Form Saved!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'success')
		                                                                                     newToast('success','Request Form Saved!','')   
                                                                                            // requestEmailAlerts('Submitted');
                                                                                            // requestEmailAlerts('Submitted-Approval')
   
                                                                                               }else if(formStatus  == 'Saved' ){
		                                                                                         requestFormStatus = formStatus
		                                                                                           
		                                                                                    // RequestAlerts('<strong>Request Form Draft Saved!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'primary')
																						     newToast('info','Request Form Draft Saved!','')   

																						   if(SaveTrigger == "Folder"){
																						       //create new product folder
																						       createFolder('Request'+newID+productFolder,productFolder)
																						   }
																						    
																						      requestEmailAlerts('Draft')
                                                                                          }else{
                                                                                            // RequestAlerts('<strong>Request Form Saved!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'success')
		                                                                                     newToast('success','Request Form Saved!','')  
                                                                                          
                                                                                          }
																						////////////////////////////////    
																						  ////start Initial workflow
																						     //if(saveMode  == "New" && formStatus  != 'Saved' && defaultWFTEMplateID != 'None'){
																						    // if(startInitWorklow =="Yes" && defaultWFTEMplateID != 'None'){
																						          //startDefaultWF( thisRequestID ,defaultWFTEMplateID )
 																						           
                                                                                                   // }
                                                                                                    
                                                                                               if(startInitWorklow =="Yes"){
                                                                                                       if(field_RoutingNCO){
																								         initApprovalProcess('NCO')
																								        }else{
																								         initApprovalProcess()
																								        }
                                                                                                  // createInitTask(thisRequestID, 'Office Director' );
                                                                                                  //  createInitTask(thisRequestID, 'Associate Administrator' );
																						         // createInitTask(thisRequestID, 'Communication Services' );
																						           // createInitTask(thisRequestID, 'Media Directorate' );
																						         ////  createInitTask(thisRequestID, 'Consumer Information' );
																						          //// createInitTask(thisRequestID, 'Digital Strategy' );
																						          // createInitTask(thisRequestID, 'OCCI Associate Administrators' );
																						            //newToast('success','Workflow Started!','The Initial Approval workflow was started successfully!')
 																						           
                                                                                                    }

                                                                                          
																				      setSubmitButton();
																				      }else{
																				    //
																				   /////  errorSave('new Procurement Request')
																	                         ///RequestAlerts('<strong>Save Error!</strong>  similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.', 'danger')
																						     newToast('error','Save Error!','')   

																				     
																				     
																				     }

																				      
															
                                                                            }
												                      });
		 /////////////////////////////
		   }//end form validation
		 }
////////////////////////////////////////////////////
function initApprovalProcess(initMode){
  if(initMode == "NCO"){  
    createInitTask(thisRequestID, 'Office Director' ,'NCO');
    newToast('success','Workflow Started!','The Initial Approval workflow was started successfully!');
                                                                                                
    }else{
           createInitTask(thisRequestID, 'Office Director','Associate Administrator' );
         newToast('success','Workflow Started!','The Initial Approval workflow was started successfully!')

    }
       
}   
////add additional SPO pocs
function addAdditionalPOC_SPOTest(regenerateMode){
additionalPOCCOunt +=1;
var addtionalInputID= 'input-Aditional-spo'+additionalPOCCOunt; 
   var POCHTML = '<div id="'+addtionalInputID+'-wrap" class="mb-2" >'+
              '<label for="'+addtionalInputID+'_TopSpan_EditorInput"><span class="'+addtionalInputID+'-role">Acting Associate Administrator(AA)</span>'+
              '<div class="btn-group">'+
						  '<!-- Basic dropdown -->'+
						 ' <button class="btn btn-flat btn-md dropdown-toggle" style="color:blue!important;padding-top:2px!important;padding-bottom:0px!important;margin-bottom:5px!important" type="button" data-toggle="dropdown" aria-haspopup="true"'+
						   ' aria-expanded="false">Change POC Role</button>'+
						
						  '<div class="dropdown-menu">'+
						  '<a class="dropdown-item" href="javascript:changePOCRoleTest('+"'AA'"+','+"'"+addtionalInputID+"'"+')">Associate Administrator</a>'+
						  '<a class="dropdown-item"href="javascript:changePOCRoleTest('+"'CC'"+','+"'"+addtionalInputID+"'"+')">Contract Coordinator</a>'+
						   ' <a class="dropdown-item" href="javascript:changePOCRoleTest('+"'COR'"+','+"'"+addtionalInputID+"'"+')">Contract Office Representative</a>'+
						   '<a class="dropdown-item" href="javascript:changePOCRoleTest('+"'OD'"+','+"'"+addtionalInputID+"'"+')">Office Director</a>'+
						   ' <a class="dropdown-item" href="javascript:changePOCRoleTest('+"'DC'"+','+"'"+addtionalInputID+"'"+')">Division Chief</a>'+
						   ' <a class="dropdown-item" href="javascript:changePOCRoleTest('+"'PM'"+','+"'"+addtionalInputID+"'"+')">Project Manager</a>'+
						   ' <a class="dropdown-item" href="javascript:changePOCRole('+"'Other'"+','+"'"+addtionalInputID+"'"+')">Other</a>'+
						  
						  '</div> <button  type="button" style="color:red!important;padding-top:2px!important;padding-bottom:0px!important;margin-bottom:5px!important"   onclick="removePOCRole('+"'#"+addtionalInputID+"'"+')"'+
											    ' class="btn  btn-md  btn-link" ><i style="padding-right:4px;font-weight:bold!important"   class="fa fa-times" aria-hidden="true"></i> Remove POC</button>'+
                            '</div></label>'+ 
                    
				       '<div class="peoplePickerDiv additionalPOCPicker" role="AA" id="'+addtionalInputID+'"></div>'

    /////add poc selector
    $('#addAdditionalPOC-Section').append(POCHTML);
   ///initialize people picker 
  initializePeoplePicker(addtionalInputID);

       ///return regenerate ID
     if(regenerateMode == 'Yes'){
        return addtionalInputID ;
     }
////////////////////////////////


};

/////////////////////////////////////////////////////////////////////////////////
///////change additional POC role
function changePOCRoleTest(POCRole,POCInputID){
      ///////set Role labels
      var roleLabel = "";
        if(POCRole == 'AA'){
               roleLabel = 'Acting Associate Administrator(AA)'
        }else if(POCRole == 'CC'){
               roleLabel = 'Contract Coordinator(CC)'
        }else if(POCRole == 'COR'){
               roleLabel = 'Contract Office Representative(COR)'
        }else if(POCRole == 'OD'){
               roleLabel = 'Acting Office Director(OD)'
        }else if(POCRole == 'DC'){
               roleLabel = 'Division Chief(DC)'
        }else if(POCRole == 'PM'){
               roleLabel = 'Project Manager'
        }else if(POCRole == 'Other'){
               roleLabel = 'Other'
        }

        ///update input html
           ///label
           $('.'+POCInputID+'-role').html(roleLabel);
           ///placeholder
           $('#'+POCInputID).attr('placeholder','Select a '+roleLabel);
           ///role attribute
           $('#'+POCInputID).attr('role',POCRole)


}
///////////////////////////////////////////////////////////////////////////
function addProductForm(productButton){
 var selectedID='#input-Products';
 var selectedProductValue =$(selectedID).val();
    

 
if(productButton == "main"){ 
   //////cancel function if no Product selected
  if(selectedProductValue == "" || selectedProductValue == undefined ){
   return;
  }

   getDetailsForm('#ProductsServcies-well',$(selectedID).val(),$(selectedID+' option:selected').attr('descIndex'),$(selectedID).val());
   $(selectedID).val('');
   saveProducts(); 
   }else if(productButton == "other"){
   
       $(selectedID).val('22;#Other');
       getDetailsForm('#ProductsServcies-well',$(selectedID).val(),$(selectedID+' option:selected').attr('descIndex'),$(selectedID).val());$(selectedID).val('')
       saveProducts(); 
   }
  ////Trigger submit or draft save button
      
}
function scrolltoValidation(inputFocus){
if(inputFocus != undefined){
		if(inputFocus.indexOf("productForm") >= 0){
		var switchViewID = $('#'+inputFocus).attr('formlocation');
		switchViewID = switchViewID.substring(0,switchViewID.indexOf('-Link')); 
		  switchProductView('#'+switchViewID )
		 }
		  var element = document.getElementById(inputFocus);
          var headerOffset = 45;
          var elementPosition = element.getBoundingClientRect().top;
          var offsetPosition = elementPosition + headerOffset;
			    window.scrollTo({
			         top: offsetPosition,
			         behavior: "smooth"
			    });
                
		   $('#'+inputFocus).focus();
		   void(0);
		   
   }
} 

function scrolltoTop_Products(){
  var element = document.getElementById("ProductsServcies-Form");
  element.scrollIntoView({behavior: "smooth"});
  $('#input-Products').focus().void(0);
} 
function saveProducts(){   
 
   	   ///save draft  	
		 if(summaryFilterValue  == "New Request" ){
		    if(formStatus != "Saved"){
		      saveRequestTest('New Product');
		    }else{
		      saveRequestTest('update New Product draft');
		    };		    
		      
		 }else{
		  ///save form updates
		      saveRequestTest('Update Product');
		 }


}
function genLegacyProduct(prodName,prodFormNumber,prodFormDesc,prodFormHtml){
var  newProductJSONString = '{'+
                              '"ID":22,'+
                              '"Type":"Legacy Product or Service:",'+
					          '"Name":"'+prodName+'",'+
					          '"Description":"'+prodFormDesc+'",'+
					          '"AttachmentButton":"!#less#!button type=!#quote#!button!#quote#! id=!#quote#!productForm-'+prodFormNumber+'-AttachmentsBTN!#quote#! onclick=!#quote#!openAttachmentUploadler(!#singlequote#!Request Library!#singlequote#!,!#singlequote#!22;#Other!#singlequote#!,!#singlequote#!productForm-'+prodFormNumber+'!#singlequote#!)!#quote#! class=!#quote#!btn btn-md upload-btn btn-rounded mb-3 primary-color !#quote#! uploadfolder=!#quote#!undefined!#quote#! foldercreated=!#quote#!undefined!#quote#!!#great#!!#less#!i class=!#quote#!fa fa-paperclip!#quote#! aria-hidden=!#quote#!true!#quote#!!#great#!!#less#!/i!#great#! Attach A file!#less#!/button!#great#!",'+
					          '"FieldType":["Single line of text"],'+
					          '"HTML":'+
					           '['+
					             '"!#less#!div class=!#quote#!prodfield-wrap!#quote#! fieldtype=!#quote#!Single line of text!#quote#!!#great#!'+
					             '!#less#!label class=!#quote#!details-label active!#quote#! for=!#quote#!productForm-'+prodFormNumber+'-DetailsDF0!#quote#! !#great#!!#less#!h4 style=!#quote#!color:#262626;margin-bottom: 0px;!#quote#! !#great#!Name!#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/h4!#great#!!#less#!/label!#great#!!#less#!input type=!#quote#!text!#quote#! id=!#quote#!productForm-'+prodFormNumber+'-DetailsDF0!#quote#! formlocation=!#quote#!productForm-'+prodFormNumber+'-Link!#quote#! style=!#quote#!width:100%!#quote#! onchange=!#quote#!if(!$(this).val()||$(this).val().trim().length === 0 ){$(this).val(!#singlequote#!!#singlequote#!);$(!#singlequote#!#productForm-'+prodFormNumber+'-AttachLI !#great#! .prodTitle!#singlequote#!).html(!#singlequote#!Test1!#singlequote#!);}else{$(!#singlequote#!#productForm-'+prodFormNumber+'-Link!#singlequote#!).html($(this).val());$(!#singlequote#!#productForm-'+prodFormNumber+'-AttachLI !#great#! .prodTitle!#singlequote#!).html($(this).val());}!#quote#! class=!#quote#!form-control input-required mb-2 validate valid!#quote#! required=!#quote#!!#quote#! !#great#!!#less#!/div!#great#!",'+
					             '"'+prodFormHtml+'"'+
					             //'"!#less#!div class=!#quote#!form-group prodfield-wrap!#quote#! fieldtype=!#quote#!Multiple lines of text!#quote#!!#great#!!#less#!label class=!#quote#!details-label active!#quote#! for=!#quote#!DetailsproductForm-'+prodFormNumber+'DF12!#quote#!!#great#!Description !#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/label!#great#!!#less#!textarea type=!#quote#!text!#quote#! formlocation=!#quote#!productForm-'+prodFormNumber+'-Link!#quote#! id=!#quote#!DetailsproductForm-'+prodFormNumber+'DF12!#quote#! class=!#quote#!form-control mb-2 textarea-required validate valid!#quote#! placeholder=!#quote#!!#quote#! rows=!#quote#!3!#quote#! required=!#quote#!!#quote#!!#great#!Desc1!#less#!/textarea!#great#!!#less#!/div!#great#!"'+
					            '],'+
					          '"JavaScript":"None"'+
					        '}';  



   return newProductJSONString ;



}
function spItemRedirect(){
 var currentSummaryLink = window.location.href.substring(0,window.location.href.indexOf('SiteAssets'));
 var currentRequesteditLink = currentSummaryLink+'Lists/Requests/AllItems.aspx?FilterField1=ID&FilterValue1='+thisRequestID +'&FilterType1=Counter' ;
 window.location.href = currentRequesteditLink;
}
function forceRequestCancel(){
 
      //////////////////////////////////////////////////////////                  
                            var SavePairs = [["Status","Canceled" ],
                                              ["SummaryFilter","Canceled" ],
                                                   ]
                                                    
                          
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: thisRequestID ,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															   if(Status == "success"){
															      newToast('success','Request Cancelled!','')   
															        
															   }else{
															      newToast('danger','this Request was not Cancelled','')   

															   }
															}
														   })	


}

function toggleOptBtn(showBtn){
	$('#opt-Btn').hide();
	$('#requestSPEditLink').hide();
	
	////Hide non Draft Options from Requestor
 if(formStatus == "Draft" || formStatus == "Saved" ){
		 if(!currentUser_OCCIAdmin){
		  if(showBtn){
		     $('#opt-Btn').show();
		    }

		   return;
		   }
 }
  
		 if(showBtn){
		if( formStatus == "Closed" || formStatus == "Canceled"){
		    $('#requestCancelLink').hide();
		}
		$('#opt-Btn').show();
		
		if(currentUser_OCCIAdmin){
		$('#requestSPEditLink').show();
		}

     }
}

 </script>
  
<style type="text/css">
#Secondary-cover {
	display: block!important;
	height: 400px;
	background: linear-gradient( rgba(0, 0, 1,.5),rgba(0, 0, 1,.2)), url('img/Picture1.jpg') no-repeat;
	background-size: cover;
	background-position: center center;
}
.sp-peoplepicker-topLevel {
	height: 40px!important;
	width: 100%;;
}
.ms-dlgContent {
	position: fixed! important;
}
.sp-peoplepicker-topLevel, .sp-peoplepicker-topLevelDisabled, .sp-peoplepicker-autoFillContainer, .ms-inputBox {
	width: 100%!important;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
.sp-peoplepicker-autoFillContainer {
	z-index: 100!important;
}
.system-alert b, .system-alert strong {
	font-weight: bold!important;
}
.invalid-link.btn-link{
 padding-left:0px;
  color:#0275d8!important	;
  text-transform: capitalize;
  font-size:16px;
  margin-left:0px;
  
}
</style>

</asp:Content>
