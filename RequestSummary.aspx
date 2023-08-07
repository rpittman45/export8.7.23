 <%@ Page Language="C#" masterpagefile="../_catalogs/masterpage/custom.master" title="Request Summary - Communications Services Request System" %>
 
<asp:Content id="Content1" runat="Server" contentplaceholderid="ContentPlaceHolder1">

 
<div class="style1">
<div class="container">



<div class="row" >

<div  class="col-12">

<div id="SummaryAlerts" >

</div>

<div id="RequestFormValidation" style="display:none"  >

<div class="alert alert-danger" role="alert">

   <h4><strong>Request Form Error! <span aria-hidden="true" style="color:red">*</span></strong></h4> 

                Please check the fields listed below.

  <hr>

  <div id="error-wrap" ></div>



  

</div></div>

</div>

</div>
 
<div   id="requestDetailsWrap"  style=" padding:10px ; display:none;padding:30px" class="row step-form   border bordr-light hoverable ">

<div class="col-12 "  >
<div class="row">
   <div class="col-12">
    <div class="float-right">
    <a class="btn btn-lg  " id="opt-Btn"  type="button" style=" color:black!important " data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><b>
	Request Options</b> <i class="fa fa-bars" aria-hidden="true"></i></a>
	
<div class="dropdown-menu">
  <a class="dropdown-item" id="requestStstauUpdateLink"  href="javascript:$('#statusForm').show();void(0)">
	Update Status</a>
  <a style="display:none"  class="dropdown-item" href="javascript:alert('Not in Use')">
	Archive Request</a>
   
  <a class="dropdown-item" id="requestEditLink" >Update Request</a>
  <a  class="dropdown-item" href="javascript:forceRequestCancel()"  style="display:none" id="requestCancelLink">Cancel Request</a>
  <a  class="dropdown-item" href="#" onclick="spItemRedirect()" style="display:none" id="requestSPEditLink">Manage SharePoint List Item (Admin Only)</a>
  
</div>
<button type="button" id="reGen-LegacyBtn" style="display:none" class="btn  btn-primary" onclick="reGenerateRequest('Legacy')" ><i class="fa fa-refresh" aria-hidden="true"></i> 
	Re-Generate Request</button>
</div>
<button type="button" id="reOpen-LegacyBtn" style="display:none" class="btn  btn-primary" onclick="updateStatus()" ><i class="fa fa-refresh" aria-hidden="true"></i> 
	Re-Open</button>
  </div>
  	<br>
  </br>
 
 </div>

   <div class="card-body "   style=" background-color:white; margin-bottom:10px">
   
   
    
     <div style="" >
     <span id="reuestJobNo_Disp" style="font-size:27px;font-weight:bold"></span>
   <h2 id="requestTitle-Display"  data-toggle="tooltip" data-placement="left" title="Click the follwing link to view or edit this request" class="RequestDetailTip" style="font-weight:400;text-transform:; white-space:normal;font-weight:bold;color:#2e72c9"> 

 </h2>

   <p class="requestDesc-Display" style="font-weight:200"></p>
	
	</div>
	<div id="statusDraftBadge"><span class="badge badge-pill badge-info" style="font-size:22px;font-weight:bold;margin-bottom:10px;color:white">
		Draft - Not Submitted for Review</span></div>
	<div  id="requestWell-wrap" class="card hoverable">
	<div id="requestWell" style="margin-bottom:0px!important" class="alert   card-up " >
		 <div id="statusBadge"></div>
		 
	
	 </div>
 <div  class="card-body" >
 <div id="clock-alert" style="text-align:center" role="alert">
  <div id="clock"></div>
  
  </div>
  <div id="statusForm"style="display:none">


<head>
</head>
<form>

<hr>

 <h3 style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important;padding-left:0px"  >
	Status Updates</h3>
  <!-- Grid row -->
  <div class="row mb-3">
 
    <!-- Grid column -->
    <div class="col">
      <!-- Default input -->
      <label for="RequestStatusInput">Request Status</label>
      <select id="RequestStatusInput" class="browser-default custom-select">
        <option style="display:none" value="Saved" >Draft</option>
		<option>Waiting for Production Approval</option>
		<option>Production Approved</option>
		<option>Rejected</option>
		<option>Complete</option>
		<option>Canceled</option>
		<option style="display:none" >Closed</option>

</select>
    </div>
    <!-- Grid column -->

    <!-- Grid column -->
    <div class="col">
      <!-- Default input -->
     <label for="ProductionStageInput">Production Stage</label>
      <select id="ProductionStageInput"  disabled=""  class="browser-default custom-select">
  <option value="">Select a Production Stage</option>
 

</select>

    </div>
    <!-- Grid column -->
    <!-- Grid column -->
    <div class="col">
      <!-- Default input -->
      <label for="PublicationStatusInput">Production Status</label>
      <select id="PublicationStatusInput" disabled=""  class="browser-default custom-select">
  <option value="" selected>Select a Production Stage</option>
  
</select>

    </div>
    <!-- Grid column -->

  </div>
  <!-- Grid row -->
   
  
  
    <div>
<button class="btn btn-light btn-md" onclick="$('#statusForm').hide()" style="color:black!important" type="button" ><b>

               Close</b></button>
<button type="button" class="btn btn-md btn-primary" onclick="saveStatusUpdates()"><b>
Update Status</b></button>
 </div>

</form>
</div>

</div>
  <div class="card-footer" style="padding-left:20px" >
  <div class="text-muted" style=" font-size:18px" id="requestTitle-SubDisplay"></div>
  
  </div>
  </div>
 <div style="padding-bottom:5px;margin-top:15px" id="requestOptions">
 
 </div>


	 
	
 


<div id="queue-SA" style="display:none">
<div class="hoverable border bordr-light" style="padding:30px; "  >
<div style="text-align:left;padding-bottom:20px">
<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
Production Approval</h3>
</div>
                      <div class="row mb-3">
                      <div class="alert alert-warning hoverable" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
   Please verify that all Production Approval Tasks are completed. Once this Request is Production ready, please assigned a new Service Advisor to complete the Production Approval process</p>	
	</div>
	</div>
	<div class="row mb-3">
	<div   class="col col-9">
	<span class="badge badge-pill badge-primary" style="font-size:22px;font-weight:bold;margin-bottom:10px;color:white">
	Production Approval Tasks</span>
	<div class="list-group" id="approvalWFList">
 
   </div>
 </div>
</div>
 <div class="row mb-3">
    <!-- Grid column -->
    <!-- Grid column --> 
    <div id="prod-UserSelectWrap1" class="col col-7">
    <!-- Default input -->
    <label for="prod-SA_TopSpan_EditorInput" >Service Advisor:</label>
	<div class="peoplePickerDiv"   id="prod-SA"></div>
     
    </div>
    
  

    <!-- Grid column -->

  </div>
      <div>
 

<button type="button" class="btn btn-lg  btn-block btn-success" id="saveSA-BTN" onclick="saveProdContacts('Service Advisor','prod-SA');completeAllApprovalTasks()"><b>
Approve for Production</b></button>
<button type="button" style="display:none" onclick="completeAllApprovalTasks()">
Test</button>
 </div>

                   </div>
                 

                   </div>
                  
<div id="prod-TaskandRole-wrap" class="hoverable border bordr-light" style="padding:30px;display:none;margin-bottom:20px;padding-bottom:20px;border: 1px solid rgba(0, 0, 0, 0.1); margin-top:10px
">
<div id="prodTasks-wrap">
<div style="text-align:left;padding-bottom:20px">
<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
Production Tasks</h3>
</div>
<div class="card card-noShadow lighten-4">

  
       
      <table class="table table-hover">						
						          <thead>						
						            <tr>						
						              <th scope="col">Tasks</th>												
						              <th scope="col">Assigned to</th>	
						              <th scope="col">Product or Service</th>	

						              <th scope="col">Status</th>	
						              <th scope="col">Completion Date</th>					
						              <th scope="col"><span class="sr-only">
										Options</span></th>						
						            </tr>						
						          </thead>						
						          <tbody class="productionWorkflowTasks-TBody">
						           <tr>
						           <td style="text-align:center" colspan="5">No 
									Tasks Found</td>
						           </tr>
						          </tbody>
					          </table>
 
                </div>
                <div  style="padding:20px;padding-bottom:0px" id="prod-ContactButtons">
                     <div class="row mb-3">
						 
						<button type="button"  class="btn btn-md   mb-3 primary-color " onclick="$('#prodTasks-wrap').hide();$('#prod-ContactEditor').show()"><b>
						Update Production Team</b></button>
						<button type="button"  class="btn btn-md  mb-3 success-color " onclick="$('#prodTasks-wrap').hide();$('#assignTask-form').show()"><b>
						Add New Tasks</b></button>
					</div>
                  </div>
                </div>
                  <div id="assignTask-form" style="display:none"><div style="text-align:left;padding-bottom:20px">
                  <h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
					Create a Production Task</h3>
                  </div>
                  <div class="row  "> 
                <div class="alert alert-warning hoverable" role="alert">
            <span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>
			Instructions</b></span>
     <p>To assign a Production Task select one or more Production Team Members to assign a new Task to. Once a team member is selected please provide a Task Name and Task Instructions, and then select a Product or Service that the Task is associated with..</div>
		<div class="col-12" id="TaskFormValidation"   >
		
		</div>
		</div>

		 <div class="row ">
	   <div class="col col-4">
	      <div class="well" style="background-color:rgba(0,0,0,.03)">
	   
	   <h4 style="color:rgb(59, 89, 152);font-size:20px">Production Team Members</h4>

	        
      <!-- Default input -->
     <label for="ProductionTaskRole" >Role:</label>
      <select id="ProductionTaskRole"      class="browser-default custom-select">
              <option value="">Select a Prodution Role</option>
			  <option  >Editor</option>
			  <option  >Designer</option>
			  <option  >Proof Reader</option>
			  <option  >QC</option>
			  <option >Writer</option>
			  <option >Project Coordinator</option>
			  <option  >Service Advisor</option>
			  </select>
			 
			  <hr>
			  <div style=" overflow-y:auto;height:150px" id="taskUserWrap">

            </div>
            <hr>
            <a role="button" onclick="$('#assignTask-form').hide();$('#prod-ContactEditor').show()" style="color:#4285f4!important" ><i style=" color:#00e25b" class="fa fa-plus" aria-hidden="true"></i> Update Production Team</a> 
         </div>
    </div>
  <div class="col col-7">
  <label for="ProductionTaskInput">Task Name</label>
  <input id="ProductionTaskInput" type="text"  class="form-control rounded-0 mb-2"  />
  
 
  
   <label for="ProductionTaskDesc"  >Task Instructions</label><textarea  rows="5" class="form-control rounded-0 mb-2"  id="ProductionTaskDesc"></textarea>  
   <div class="mb-2">
	    <label>Which Product or Service is this Task Associated with?</label>
	    <div id="productRadio-Options">
            <div  class="custom-control custom-radio "> 
	         <input type="radio" value="None" class="custom-control-input ProductionTask-RadionBtn" id="ProductionTask-Radios-none" name="ProductionTask-Radios" > 
             <label class="custom-control-label"  for="ProductionTask-Radios-none">
				None</label> 
            </div> 
        </div>
        </div>
              
      </div>     
              </div>
                 <div>
                 
                 <br>
<button class="btn btn-light btn-md" onclick="resetTaskConfigurationForm()" style="color:black!important" type="button" ><b> 
Cancel</b></button>
<button type="button" class="btn btn-md btn-success" onclick="createNewProductionTask()"><b>
Assign Task</b></button>
 </div>
                 

                 </div> 

                <!---production Tsks-->
                <div id="approvalTask-form"  style="display:none"><div style="text-align:left;padding-bottom:20px">
                 
                <h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
				Complete Approval Task</h3>

                </div><div class="row mb-3"> 
                <div class="alert alert-warning hoverable" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>
   At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis 
	praesentium voluptatum deleniti atque corrupti quos dolores et quas 
	molestias excepturi sint.</p></div>
                <div class="form-group"><h3>Task:</h3><p> At vero eos et 
					accusamus et iusto odio dignissimos ducimus qui blanditiis 
					praesentium voluptatum deleniti atque corrupti quos dolores 
					et quas molestias excepturi sint</p><label>Task Response</label> <div class="custom-control custom-radio"> <input type="radio" class="custom-control-input" onclick="$('.approve-btn').show();$('.reject-btn').hide()" id="Approve-RadioBtn" name="approvalRadios" checked="Checked"> <label class="custom-control-label" for="Approve-RadioBtn">
						Approve</label> </div><div class="custom-control custom-radio"><input type="radio" class="custom-control-input" onclick="$('.approve-btn').hide();$('.reject-btn').show()" id="Reject-RadioBtn" name="approvalRadios"> <label class="custom-control-label" for="Reject-RadioBtn">
						Reject</label> </div>
	<br><label class="sr-only" for="EmailComments">Comments</label><textarea class="form-control rounded-0" rows="5" placeholder="Comments" id="EmailComments"></textarea></div></div>
	<div class="modal-footer" style="display: block;">
	<button type="button" class="btn btn-light btn-md" style="color:black!important" onclick="clearProdApprovalTaskForm()" ><b>
	Cancel</b></button>
	<button type="button" style="margin-bottom: 10px;" onclick="taskUpdate(undefined,undefined,'Approved')" class="btn btn-success btn-md approve-btn"><i class="fa fa-check" aria-hidden="true" style=""></i> <b>
	Approve</b></button><button type="button" style="margin-bottom: 10px; background-color: rgb(255, 68, 68) !important; display: none;" onclick="taskUpdate(undefined,undefined,'Rejected')" class="btn btn-success btn-md reject-btn"><i class="fa fa-exclamation" aria-hidden="true" style=""></i> <b>
	Reject</b></button></div></div>
  
  
  
  <div  style="display:none;" id="prod-ContactEditor">
  <div style="text-align:left;padding-bottom:20px">
<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
Assign a new Production Team Member</h3>
</div>
       
                      <div class="row mb-3">
                     <div  class="col col-12">
                      <div class="alert alert-warning hoverable" role="alert">
<span><i class="fa fa-info-circle" aria-hidden="true"></i> <b>Instructions</b></span>
<p>Select a Role and User to be assigned to the Production Team for this Job.</p></div>
 </div>
        
    <!-- Grid column -->

    <!-- Grid column -->
    <div class="col col-3">
      <!-- Default input -->
     <label for="ProductionPOCRole">Role</label>
      <select id="ProductionPOCRole"      class="browser-default custom-select">
			  <option  >Editor</option>
			  <option  >Designer</option>
			  <option  >Proof Reader</option>
			  <option  >QC</option>
			  <option >Writer</option>
			  <option >Project Coordinator</option>
			  <option  >Service Advisor</option>
			  </select>

    </div>
    <!-- Grid column -->
    <!-- Grid column --> 
    <div id="prod-UserSelectWrap2" class="col col-7">
    <!-- Default input -->
    <label for="prod-UserSelect_TopSpan_EditorInput" >User:</label>
	<div class="peoplePickerDiv" prod-role="Editor" id="prod-UserSelect"></div>
     
    </div>
    
  

    <!-- Grid column -->

  </div>
      <div>
<button class="btn btn-light btn-md" onclick="clearProdRoleForm()" style="color:black!important" type="button" ><b> 
Cancel</b></button>
<button type="button" class="btn btn-md btn-success" onclick="saveProdContacts()"><b>
Assign Role</b></button>
 </div>

                   </div>
 

                   </div>
                
                  
 <div class="card hoverable " style="margin-top:10px" >
   <ul class="nav nav-tabs text-dark" id="details-tabs" role="tablist" style="margin-right: 0px; margin-left: 0px; box-shadow: none;"> 

   <li class="nav-item">

    <a class="nav-link " id="RequestDetail-tab0" role="tab" aria-selected="false" aria-controls="RequestDetail-0" href="#RequestDetail-0" data-toggle="tab">

               Request Details</a>

    </li>

    <li class="nav-item">

    <a class="nav-link " id="RequestDetail-tab5" role="tab" aria-selected="false" aria-controls="RequestDetail-5" href="#RequestDetail-5" data-toggle="tab">

               Products and Services</a>

    </li>
<li class="nav-item">

    <a class="nav-link" id="RequestDetail-tab6" role="tab" aria-selected="false" aria-controls="RequestDetail-6" href="#RequestDetail-6" data-toggle="tab">

               Job Content</a>

    </li>

   <li class="nav-item">

    <a class="nav-link" id="RequestDetail-tab1" role="tab" aria-selected="false" aria-controls="RequestDetail-1" href="#RequestDetail-1" data-toggle="tab">

               Workflows</a>

    </li>
     <li id="RequestDetail-tabPCWrap" style="display:none"  class="nav-item">

    <a class="nav-link" id="RequestDetail-tabPC"  role="tab" aria-selected="false" aria-controls="RequestDetail-PC" href="#RequestDetail-PC" data-toggle="tab">

              Production </a>

    </li>



    <li class="nav-item" style="display:none">

    <a class="nav-link" id="RequestDetail-tab2" role="tab" aria-selected="false" aria-controls="RequestDetail-2" href="#RequestDetail-2" data-toggle="tab">

               Production Documents</a>

    </li>

    <li class="nav-item"  style="display:none" >

    <a class="nav-link" id="RequestDetail-tab3" role="tab" aria-selected="false" aria-controls="RequestDetail-3" href="#RequestDetail-3" data-toggle="tab">

               Production Notes</a>

    </li>

        <li class="nav-item">

    <a class="nav-link" id="RequestDetail-tab4" role="tab" aria-selected="false" aria-controls="RequestDetail-4" href="#RequestDetail-4" data-toggle="tab">

               Shared Notes</a>

    </li>

 

    </ul>



   <div class=" tab-content" style=" padding:0px">  

   <div class="tab-pane fade" id="RequestDetail-0" role="tabpanel" aria-labelledby="RequestDetail-tab0" >

   <div  style="padding:10px" class="white lighten-4 ">

        <!--Accordion wrapper-->

        <div class="accordion md-accordion" id="accordionDetails" role="tablist" aria-multiselectable="false">

          <!-- Accordion card -->

          <div class="card">

              

 

          </div>

        

        </div>

        <!-- Accordion wrapper -->

          

       </div>

  </div>

  <div class="tab-pane fade" id="RequestDetail-5" role="tabpanel" aria-labelledby="RequestDetail-tab5" >

   <div  style="padding:10px" class="card card-noShadow white lighten-4 ">

     <div class="accordion md-accordion" id="accordionServices" role="tablist" aria-multiselectable="false">

          <!-- Accordion card -->

          <div class="card">

               

 

          </div>

        

        </div>     

       </div>

  </div>
<div class="tab-pane fade" id="RequestDetail-6" role="tabpanel" aria-labelledby="RequestDetail-tab6 " >

   <div  style="padding:10px" class="card card-noShadow white lighten-4 ">

     <div class="accordion md-accordion" id="legacy-Files" role="tablist" aria-multiselectable="false">

          <!-- Accordion card -->
   
          <div class="card">

          
 

 

          </div>

        

        </div>     

       </div>

  </div>
  
  <div class="tab-pane fade" id="RequestDetail-PC" role="tabpanel" aria-labelledby="RequestDetail-tabPC " >
  
  

   <div  style="padding:10px;" class="card card-noShadow white lighten-4 ">
  

      <div class="accordion md-accordion"  id="accordionProduction"  role="tablist" aria-multiselectable="false">
           <!-- Accordion card -->   
          <div class="card">
               <!-- Accordion Header -->
          <div class="card-header" role="tab">

                         <a data-toggle="collapse" data-parent="#accordionProduction" href="#ProductonSection0" aria-expanded="false" class="collapsed" aria-controls="ProductonSection0">

                           <h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
							Production Tasks<i class="fas fa-angle-down rotate-icon"></i></h3>

                         </a>

                       </div>
                  <!-- Card body -->
             

                <div id="ProductonSection0" class="collapse " role="tabpanel" data-parent="#accordionProduction">
                 <div style="padding-top:0px" class="card-body">
                   <div class="card card-noShadow lighten-4">

  
      <table class="table table-hover">						
						          <thead>						
						            <tr>						
						              <th scope="col">Tasks</th>												
						              <th scope="col">Assigned to</th>	
						              <th scope="col">Product or Service</th>	

						              <th scope="col">Status</th>	
						              <th scope="col">Completion Date</th>					
						              <th scope="col"><span class="sr-only">
										Options</span></th>						
						            </tr>						
						          </thead>						
						          <tbody class="productionWorkflowTasks-TBody">
						           <tr>
						           <td style="text-align:center" colspan="5">No 
									Tasks Found</td>
						           </tr>
						          </tbody>
					          </table>
 
                </div>
                </div>
                </div>
      

                </div>
          <!-- Accordion card -->   
          <div class="card">
 
          <!-- Accordion Header -->
          <div class="card-header" role="tab">

                         <a data-toggle="collapse" data-parent="#accordionProduction" href="#ProductonSection1"  class="collapsed"  aria-expanded="false" aria-controls="ProductonSection1">

                           <h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">
							Production Team<i class="fas fa-angle-down rotate-icon"></i></h3>

                         </a>

                       </div>
             <!-- Card body -->
             

                <div id="ProductonSection1" class="collapse " role="tabpanel" data-parent="#accordionProduction">
                  <ul id="ProductonSectionList" class="list-group list-group-flush">
                 
                  </ul>
               
                  
                  
                   
                  

                </div>           

           </div>
           
            <!-- Accordion card -->   
          <div class="card">
          <!-- Accordion Header -->
          <div class="card-header" role="tab">

                         <a data-toggle="collapse" data-parent="#accordionProduction" href="#ProductonSection2" class="collapsed"  aria-expanded="true" aria-controls="ProductonSection2">

                           <h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0"> 
							Documents  <i class="fas fa-angle-down rotate-icon"></i></h3>

                         </a>

                       </div>
             <!-- Card body -->

                <div id="ProductonSection2" class="collapse" role="tabpanel" data-parent="#accordionProduction">

                  <div style="padding-top:0px" class="card-body">
                   <div class="card card-noShadow white lighten-4">

						          <div class="card-body">
						
						          <table class="table table-hover">
						
						          <thead>
						
						            <tr>
						
						              <th scope="col">File</th>
						
						              <th scope="col">Last Modified</th>
						
						              <th scope="col">Created By</th>
						
						              <th scope="col"><span class="sr-only">
										Delete Option</span></th>
						
						            </tr>
						
						          </thead>
						
						          <tbody id="currentProductionDocs-TBody">
						
						            
						
						           
						
						          </tbody>
						
						        </table>
						
						        <button tabindex="48" class="btn btn-md  btn-rounded mb-3 primary-color " id="ProductionDocumentsUpload-Btn" style="color: white !important; margin-top: 10px !important; margin-bottom: 5px !important;" onclick="newAttachmentUploadler('Production Documents','currentProductionDocs-TBody',$(this).attr('id'))" type="button" foldercreated="Yes" uploadfolder="Request41productForm-1"><i class="fa fa-paperclip" aria-hidden="true"></i> 
						
						                                Attach A file</button>
						
						           </div>
						
						       </div>
                   </div>

                </div>           

           </div>
     <!-- Accordion card -->   
          <div class="card">
          <!-- Accordion Header -->
          <div class="card-header" role="tab">

                         <a data-toggle="collapse" data-parent="#accordionProduction" href="#ProductonSection3" class="collapsed"  aria-expanded="true" aria-controls="ProductonSection3">

                           <h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0"> 
							Notes<i class="fas fa-angle-down rotate-icon"></i></h3>

                         </a>

                       </div>
             <!-- Card body -->

                <div id="ProductonSection3" class="collapse" role="tabpanel" data-parent="#accordionProduction">

                  <div style="padding-top:0px" class="card-body">
			                    <div class="card card-noShadow grey lighten-4 chat-room">
			          <div class="card-body">
			            <!-- Grid row -->
			            <div class="row ">
			              <!-- Grid column -->
			              <div class="col-md-12">
			                <div style="padding:30px; height:400px;overflow-y:scroll; " class="chat-message chat-scroll ">
			                  <ul class="list-unstyled chat" id="ProdNotes-Wrap">
			
			                  </ul>
			                  </div>
			              </div>
			              <!-- Grid column -->
			            </div>
			            <!-- Grid row -->
			            <ul style=" margin-top:10px"  class="list-unstyled chat">
			                    <li class="white">
			                      <div class="form-group basic-textarea">
			                        <textarea class="form-control pl-2 my-0" id="ProdNote" rows="7" placeholder="Type your message here..."></textarea>
			                      </div>
			                    </li>
			                    <button type="button"   onclick="postNewNote('Production Notes','#ProdNote')" class="btn btn-info waves-effect waves-light float-right postNewNote-btn"><b>
								Post</b></button>
			                  </ul>
			          </div>
			        </div>                   
			    
			    </div>

                </div>           

           </div>

           
           
           
           
           
          </div>             
           

        
   

       </div>

  </div>


   <div class="tab-pane fade " id="RequestDetail-1" role="tabpanel" aria-labelledby="RequestDetail-tab1">

      <div class="card card-noShadow white lighten-4">

          <div class="card-body">


       </div>

      </div>

   </div>

   <div class="tab-pane fade" id="RequestDetail-2" role="tabpanel" aria-labelledby="RequestDetail-tab2" >

   

  </div>

    <div class="tab-pane fade" id="RequestDetail-3" role="tabpanel" aria-labelledby="RequestDetail-tab3" >

   

             `

 

        

      

   

 </div>

<div class="tab-pane fade" id="RequestDetail-4" role="tabpanel" aria-labelledby="RequestDetail-tab4" >


        <div class="card card-noShadow grey lighten-4 chat-room">
          <div class="card-body">
            <!-- Grid row -->
            <div class="row ">
             <!-- Grid column -->
              <div class="col-md-12">
                <div style="padding:30px; height:400px;overflow-y:scroll; " class="chat-message chat-scroll ">
                  <ul class="list-unstyled chat" id="SharedNotes-Wrap">
                  </ul>
                </div>
              </div>
              <!-- Grid column -->
            </div>
            <!-- Grid row -->
            <ul style=" margin-top:10px"  class="list-unstyled chat">
                    <li class="white">
                      <div class="form-group basic-textarea">
                        <textarea class="form-control pl-2 my-0" id="SharedNote" rows="7" placeholder="Type your message here..."></textarea>
                      </div>
                    </li>
                    <button type="button" onclick="postNewNote('Shared Notes','#SharedNote')" class="btn btn-info waves-effect waves-light float-right postNewNote-btn">
                    <b>Post</b></button>
            </ul>
          </div>
        </div>

      

   

 </div>

  </div>
</div>
    <br>

   <button class="btn btn-light btn-block" onclick="cloaseDetailsCard()" style="color:black!important" type="button" ><b>

               Close</b></button>

  

  </div>

  <hr>



</div>

</div>
 
   <br>
 

<div  id="summary-view-Wrap" style=" padding:10px ; display:;padding:30px" class="row step-form   border bordr-light hoverable ">

<div style=" text-align:left">

<h2  id="summary-view" class="form-steptitle"></h2>

<p id="summary-viewInstructions" style="text-align: left"></p>

</div>

<div class="col-12 "   style=" padding-bottom:10px; ">

   <div id="mainError" style="display:none">

   <h2 style="font-weight:400;text-transform:; white-space:normal;color:#3b5998;font-size:22px">

                Error !</h2>

   <P>No Request Summary data found</P>

   </div>

   

<div id="JobRequests-TBLWrap" class="" >

     <span style="display:none" class="loading-slert">Loading...</span>

   </div>



</div>

 

 

 

 

 

</div> 
<div id="wfIFrame-wrap"></div>
</div>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.flash.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.4/js/buttons.print.min.js"></script>

<script type="text/javascript">
 

</script>





<script type="text/javascript">

var userSelectedRequest = "";
var userSelectedStatus = ""; 
var requestProdPOCList = "";
var newProductCount = 0;
var archiveJobsiteFolders =[];
var requestDataArray =[];
var requestDataPOCs =[];
var requestDataProducts =[];
    //for project detail
    var array_category = [];         //from service category lsit
	var array_category_detail = [];  //from service
	var project_workflow =[]
	var newProductCount = 0;
	//var legacySourceURL ="https://usdot.sharepoint.com/teams/dev-nhtsa-occiwf/subsite2"
    ///alert Options
    var tempAlertBody;
    var tempAlertButton;
    var queryStringID;
   
 $(document).ready(function() {

   var queryStringVals = $().SPServices.SPGetQueryString();

    var queryStringView = queryStringVals["view"];
     
        queryStringID = queryStringVals["RID"]; 
         

    /////Generate New Request Table
 
     if(queryStringView == "1"){

       generateRequestTable("My Requests","My Requests");
        
        
     }else if(queryStringView == "2"){

       generateRequestTable("Queue","Approval");

     }else if(queryStringView == "3"){

       generateRequestTable("Production","Production");

     }else if(queryStringView == "4"){

       generateRequestTable("Closed","Closed");

     }else if(queryStringView == "5"){

      // generateRequestTable("Archive","Archives");

      setRequestDetails_Legacy("Archive","Archives")

     }else if(queryStringView == "6"){

       generateRequestTable("Canceled","Canceled");

     }else{

       $('#mainError').show()

     }

 


    /////Toggle request details

  
  $('body').on('click','.requestDetail-btn',function(){ 

      $('.requestDetail-btn').parents('tr').removeClass('selected')
        resetRequestDisplay();
       var newWFTableHTML ='<table class="table table-hover">'+

          '<thead>'+

            '<tr>'+

              '<th scope="col">Worflow ID#</th>'+

              '<th scope="col">Workflow</th>'+

              '<th scope="col">Last Modified</th>'+

              '<th scope="col">Status</th>'+

           ' </tr>'+

          '</thead>'+

         ' <tbody id="currentWorkflows-TBody">'+

         ' </tbody>'+
        '</table>'+
                '<a tabindex="48" class="btn btn-md   btn-rounded mb-3  btn-success "  id="addWFButton" style=" margin-top: 10px !important; margin-bottom: 5px !important;" ><i class="fa fa-plus" aria-hidden="true"></i> '+
                 'Add a new Worklfow'+
				'</a>'
        if ($(this).is(':checked')) { 
  
           var selectedRequestCBXID = $(this).attr('id');
           var selectedRequestIDNumber = selectedRequestCBXID.replace("myRequests","")
                
            var selectedRequestTitle = $('#'+selectedRequestCBXID+'-Request').html();
            var selectedRequestJobNumber = $('#'+selectedRequestCBXID+'-JobNumber').html();
                selectedRequestJobNumber = getJobNumber(selectedRequestJobNumber);
              
            var selectedRequestHSNumber = $('#'+selectedRequestCBXID+'-HS').html();
                selectedRequestHSNumber = getHSNumber(selectedRequestHSNumber );
                
                userSelectedStatus =  $('#'+selectedRequestCBXID+'-Status').html();

 
            var productionStatusValue = $('#'+selectedRequestCBXID+'-Stage').html();
            var productionStageValue = $('#'+selectedRequestCBXID+'-prodStat').html();
            var publicationStatus ='<span style="font-weight:bold" id="prodStatStageLabel" > | Production Stage: </span>'+'<span style="color:#3b5998;" id="prodStatStage"  >'+productionStatusValue +'</span><span  style="font-weight:bold" id="prodStatLabel" > | Production Status: </span>'+'<span id="prodStat" style="color:#3b5998;" >'+productionStageValue +'</span>';
             
            userSelectedRequest = $(this).attr('requestID')
            $('#RequestDetail-1 > .card > .card-body').empty();
            $('#RequestDetail-1 > .card > .card-body').append(newWFTableHTML) 
           ///set workflow link
           var requestWorkflowLink = "WorkflowWizard.aspx?request="+userSelectedRequest ;
           $('#addWFButton').attr('href',requestWorkflowLink)
           /////////////////////
          
            getCurrrentlyAssignedWorkflows(userSelectedRequest) 
            
            $('#RequestDetail-tab6').hide()
            $('#RequestDetail-tab1').show()
			$('#RequestDetail-tab2').show()
			$('#RequestDetail-tab3').show()
			$('#RequestDetail-tab4').show()
      
      getProdNotes('Production Notes')
      
      getProdNotes('Shared Notes');

      getRequestDocuments('Production Documents')
        
      setRequestDetails()
        
      displayRequestStatus();
      
 
       //trigger Workflow history Tab
       ///set request options
           $('#requestEditLink').attr('href',"Requests.aspx?request="+userSelectedRequest )
       /////
        $("#RequestDetail-tab0").trigger('click')

          $(".requestDetail-btn").not(this).prop("checked", false);

            $('#requestTitle-Display').html('<a style="color:#2e72c9" href="Requests.aspx?request='+userSelectedRequest+'">'+selectedRequestTitle+'</a>');
            if(selectedRequestJobNumber != undefined){
            $('#requestTitle-SubDisplay').html(selectedRequestJobNumber+selectedRequestHSNumber+publicationStatus )
             }

             $('#requestDetailsWrap').show();
             $('#summary-view-Wrap').hide();

             $(this).parents('tr').addClass('selected')

              if(queryStringView == "1"){

                

              }

             

             

             

              }else{

               $('#requestDetailsWrap').hide()  

              }     
               

              ///hide undefined production statuses
              $('#requestWell').show();
              $('#requestWell-wrap').show();
              $('#statusDraftBadge').hide();
               $('#opt-Btn').show();
               $('#clock-alert').show()
                 

              if($('#statusBadge > span').html() == "Production Approved"){ 
                  $('#prodStatStageLabel').show();
                  $('#prodStatStage').show();
                  $('#prodStatLabel').show();
                  $('#prodStat').show();
                  
                  ////show production tab, tasks, and roles if current user is a part of the production team
	                  if(currentUser_productionTeam){  
		                   $('#RequestDetail-tabPCWrap').show();                 
		                   $('#prod-TaskandRole-wrap').show();	                   

	                  }
                  $('#requestTitle-SubDisplay').show();
               
              }else if($('#statusBadge > span').html() == "Waiting for Production Approval"){
                   $('#queue-SA').show();
                   $('#requestTitle-SubDisplay').hide();
              }else if($('#statusBadge > span').html() == "Draft"){
                 $('#opt-Btn').hide();
                 $('#requestWell').hide();
                  $('#requestWell-wrap').hide();
                  $('#statusDraftBadge').show();

                
              }else{
              //$('#requestWell').hide();
                   if($('#statusBadge > span').html() == "Complete" || $('#statusBadge > span').html() == "Canceled"){
		                   var selectedRequestJobNumber = $('#'+selectedRequestCBXID+'-JobNumber').html();
			                   if(selectedRequestJobNumber == "" || selectedRequestJobNumber == undefined){ 
			                       $('#jobNumberStatus').html('None');
			                   }
		                   var selectedRequestHSNumber = $('#'+selectedRequestCBXID+'-HS').html();
		                   if(selectedRequestHSNumber == "" || selectedRequestHSNumber == undefined || selectedRequestHSNumber == "None"){
			                       $('#HSStatus').html('None');
			                   }

		                       $('#requestWell').show();
		                        
		                       $('#requestTitle-SubDisplay').show();
		                        ////show production tab, tasks, and roles if current user is a part of the production team
						                  if(currentUser_productionTeam){  
							                   $('#RequestDetail-tabPCWrap').show(); 
							                    //remove add new workflow button 
							                   $('#addWFButton').remove();
							                   //update request options
							                     //remove update status button
							                     $('#requestStstauUpdateLink').remove(); 
							                     //update edit request button 
							                     $('#requestEditLink').html('View Request')   
							                   //remove attach file button
							                   $('#ProductionDocumentsUpload-Btn').remove();
							                   //remove production and Shared notes buttons
							                   $('.postNewNote-btn').remove();
							                   $('.postNewNote-Option-btn').remove();
							                   
						                  }

		                        
                     }else{
                     $('#requestTitle-SubDisplay').hide();
                       
                     }
 
                $('#prodStatStageLabel').hide();
                  $('#prodStatStage').hide();
                  $('#prodStatLabel').hide();
                 $('#prodStat').hide();
              }
 
              ////show Request ToolTip
               $('.RequestDetailTip[data-toggle="tooltip"]').tooltip();  
                ////hide status update button
                if(userSelectedStatus =='Waiting for Production Approval'){
                   $('#requestStstauUpdateLink').hide();
                }
                
                
  })

   ////////////////////////////////////////////////
 /////Toggle legacy request details

  
  $('body').on('click','.legacyRequestDetail-btn',function(){
  
  ////////disaplay legacy Option Buttons
   $('#reGen-LegacyBtn').show();
      //$('#reGen-LegacyBtn').click()
   $('#opt-Btn').hide();
  $('#requestWell-wrap').hide();
     
      $('.legacyRequestDetail-btn').parents('tr').removeClass('selected')

        if ($(this).is(':checked')) { 

           var selectedRequestCBXID = $(this).attr('id')
           var selectedJobNumber = $('#'+selectedRequestCBXID+'-JobNumber').html()
          // var selectedHSNumber = "";
            var selectedRequestTitle = $('#'+selectedRequestCBXID+'-Request').html();
             var selectedRequestJobNumber = $('#'+selectedRequestCBXID+'-JobNumber').html();
                if(selectedRequestJobNumber != undefined){selectedRequestJobNumber = '<span style="font-weight:bold">Job# </span>'+$('#'+selectedRequestCBXID+'-JobNumber').html()};
            var selectedRequestHSNumber = $('#'+selectedRequestCBXID+'-HS').html();
                if(selectedRequestHSNumber != undefined && selectedRequestJobNumber != undefined){selectedRequestHSNumber = ' | <span style="font-weight:bold">HS# </span>'+$('#'+selectedRequestCBXID+'-HS').html();}


            userSelectedRequest = $(this).attr('requestID')
            var querylist = $(this).attr('querylist')
            var queryurl = $(this).attr('queryurl')

            //getCurrrentlyAssignedWorkflows(userSelectedRequest)

     // getProdNotes('Production Notes')

     // getProdNotes('Shared Notes');

     // getRequestDocuments('Production Documents')
 $('#accordionServices > .card').empty();
     $('#RequestDetail-1 > .card > .card-body').empty()
        setLegacyDetails(querylist, queryurl );
         loadProjectWorkflow(queryurl );
        
  ///load when in legacy mode  
   loadCategory(queryurl )  
   
     reGenerateProductLegacyHTML(queryurl );
      
        $('#RequestDetail-tab6').show()
		$('#RequestDetail-tab2').hide();
		$('#RequestDetail-tab3').hide();
		$('#RequestDetail-tab4').hide();
  ///set job subsite data
  if(selectedJobNumber != "" || selectedJobNumber != undefined){
  var QueryJobDataURL ="https://usdot.sharepoint.com/teams/nhtsa-occiwf/Jobs";
   //selectedJobNumber ="21-0015101"
   getLegacySubsiteData('Subsite Data',selectedJobNumber,QueryJobDataURL ) 
  }
  
       //trigger Workflow history Tab
       $("#RequestDetail-tab0").trigger('click')
    //  $("#RequestDetail-tab5").trigger('click')

          $(".legacyRequestDetail-btn").not(this).prop("checked", false);
           $('#requestTitle-Display').html(selectedRequestTitle);
          
               if(selectedRequestJobNumber != undefined){
            $('#requestTitle-SubDisplay').html(selectedRequestJobNumber+selectedRequestHSNumber )
             }

          


             $('#requestDetailsWrap').show()

             $(this).parents('tr').addClass('selected')

              if(queryStringView == "1"){

                

              }

             
  
             //  alert(selectedJobNumber );
               $('#requestWell').hide();;
               $('#summary-view-Wrap').hide()

              }else{

               $('#requestDetailsWrap').hide()  

              }    
                                                                                               

  

  })

   ////////////////////////////////////////////////


     ////testing

   // userSelectedRequest = "42";

            // getCurrrentlyAssignedWorkflows(userSelectedRequest)

     // getProdNotes('Production Notes')

      // getProdNotes('Shared Notes');

     //  getRequestDocuments('Production Documents')

      // setRequestDetails()

       //trigger Workflow history Tab

    // $("#RequestDetail-tab0").trigger('click')

              //   $('#requestDetailsWrap').show()

      ////Trigger filter production stage
      $('body').on('change','#RequestStatusInput',function(){
        var optionValue = $(this).val();
        var badgeClass = "";
        var badgeColor = "white";
       
            if(optionValue == "Saved"){
               badgeClass ="badge-info";
               optionValue ="Draft";
             }else if(optionValue == "Waiting for Production Approval"){
               badgeClass ="badge-warning"
             }else if(optionValue == "Production Approved"){
               badgeClass ="badge-primary"
             }else if(optionValue == "Rejected"){
               badgeClass ="badge-danger"
             }else if(optionValue == "Complete"){
                badgeClass ="badge-success"
             }else if(optionValue == "Canceled"){
                badgeClass ="badge-dark";
                // badgeColor = "#ff4444!important";   
             }else if(optionValue == "Closed"){
                badgeClass ="badge-dark" ;
                        
             };
             
                  
            $('#statusBadge').html('<span  class="badge badge-pill '+badgeClass+'"  style="font-size:32px;font-weight:bold;margin-bottom:10px;color:'+badgeColor +'">'+optionValue+'</span>')
            
               if(optionValue == 'Production Approved'){
                  $('#ProductionStageInput').prop('disabled', false); 
                  setProductionStage(optionValue);
                  

             }else{
                  $('#ProductionStageInput').val('').change();
                  $('#ProductionStageInput').prop('disabled', true);
                  
                  
             }
             
          

          
     
        })
     ///////////////////////////////////

     /////////////////////////////////////////////////
     ///Trigger filter production status
       $('body').on('change','#ProductionStageInput',function(){
            var optionValueID = $(this).val();
            var selectdOptionValue = $(this).find('option:selected').text();
            if(optionValueID != "" ){
                 $('#prodStatStage').html(selectdOptionValue);
               //  $('.peoplepickerRow').collapse('show'); 
                 }else{
                // $('.peoplepickerRow').collapse('hide');
                 }
                 filterProductionStatus(optionValueID );
              
 
   
            
       })
      $('body').on('change','#PublicationStatusInput',function(){
            var optionValueID = $(this).val();
            var selectdOptionValue = $(this).find('option:selected').text();
            if(optionValueID != "" ){
                 $('#prodStat').html(selectdOptionValue );
                 }
                 
 				   if(optionValueID == "71"){///71 Assign Editor
                     // addStatusPeoplePicker('#statusForm > form > .peoplepickerRow','prodEditor','Assigned Editor');  
				     }else if(optionValueID == "86"){///86 Assign Designer
				     // addStatusPeoplePicker('#statusForm > form > .peoplepickerRow','prodDesigner','Assigned Designer');  
				     }
                
            
       })
    /////////select user role
  $('body').on('change','#ProductionTaskRole',function(){
  var selectedValue = $(this).val();
  $('#taskUserWrap').empty();
  var returnedCheckBoxes = getRole(selectedValue )
   
   ///append selections
      $('#taskUserWrap').append(returnedCheckBoxes)
  })
 
   ///Open Request View
 if(queryStringID != undefined){
          generateRequestTable("My Requests","My Requests");
        }

    /////Generate New Request Table
 
      
        

 
     ///demo
       //$('#production730').trigger('click');
       //$('#statusForm').show();
    
 ///Open Task Form
       //$('#prodTasks-wrap').hide();$('#assignTask-form').show()
     
     
     
 
  /////legacy
  //
  // $('#Legacy5117').trigger('click');
  // $('#Legacy5172').trigger('click'); 
  
  ///////

}); 
/////////Re-Generate Request
function reGenerateRequest(requestMode){ 
var field_ProjectTitle = requestDataArray[0];
var field_Campaign = requestDataArray[1];
var field_Description = requestDataArray[2];
var field_OD = requestDataArray[3];
var field_AA = requestDataArray[4];
var field_Rush = requestDataArray[5];
    if(field_Rush == "Yes"){
      field_Rush = 1;
    }else{
      field_Rush = 0
    }
var field_RushReason = requestDataArray[6];
var field_formStatus  ="Saved";

  ///convert legacy servcies to SPO Request 
  ///genLegacyProduct
        requestDataProducts =[];
    var legacyItemCount = -1;
     ///for each legacy service
         $('.legacyHTML ').each(function(){
               legacyItemCount+=1;
           var legacyService = $(this).attr('legactservicetitle');
           var legacyDesc = "This is a Product or Service generated from the legacy SharePoint 2010 Communication Services Request system";
           var legacyfieldHtml =  encodeHtml($(this)[0].outerHTML);
           var requestDataProductItems =  genLegacyProduct(legacyService ,legacyItemCount,legacyDesc ,legacyfieldHtml );
           requestDataProducts.push(requestDataProductItems);
                 
         })
      
     ////Join Array
var field_ProductDetails =  requestDataProducts.join();
//////////////////////////////////////////
var field_additionalPOCs = "";//Use if site needs to preset POCs ===> requestDataPOCs;

     

var field_ProductDetails =  requestDataProducts.join();
var field_additionalPOCs = "";//Use if site needs to preset POCs ===> requestDataPOCs;
//////////////////////////////////////////

 
 //$('body').append(field_ProductDetails)
  //  return;
			 var SavePairs = [["Title",field_ProjectTitle ],
	                          ["Campaign",field_Campaign],
	                          ["Description",field_Description],
	                          ["Office_x0020_Director_x0028_OD_x",field_OD ],
	                          ["Associate_x0020_Administrator_x0",field_AA],
	                          ["Requestor",curUserTitle ],
	                          ["Rush",field_Rush],
	                          ["Rush_x0020_Reason",field_RushReason],
	                          ["Product_x0020_Details",field_ProductDetails],
	                          ["Status",field_formStatus ],
	                          ["POCs",field_additionalPOCs],
	                          ["reGenMode",requestMode],
	                           ]
  
                       //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															batchCmd: "New" ,
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															var newID = $(xData.responseXML).SPFilterNode("z:row").attr("ows_ID");
															   ////Save Sucessful 
																 if(Status == 'success'){
																   alert(Status );
																   window.open("Requests.aspx?request="+newID, "_blank");

																 }
															   /////////////////////////////////////////
															}
														})	

                      ///////////////////////////////////////////////////////////////////////////////
}
//////////////////////////////////////////////////////////////////
////Clear SA Form
function clearSAForm(){
    $('#prod-UserSelectWrap1').empty();
   $('#prod-UserSelectWrap1').append(
     '<!-- Default input -->'+
     '<label for="prod-SA_TopSpan_EditorInput" >Service Advisor:</label>'+
     '<div class="prodpeoplePickerDiv" prod-role="Editor" id="prod-SA"></div>')
   ///generate people picker
     initializePeoplePicker('prod-SA');


   $('#queue-SA').hide();
   //$('#prodTasks-wrap').show()
}

////clear prod role form
function clearProdApprovalTaskForm(){
   $('#approvalTask-form').hide();
   $('#prodTasks-wrap').show()
   
}
////reset request forms
function resetRequestDisplay(){
  clearProdApprovalTaskForm();
  clearProdRoleForm();
  clearSAForm();
  resteclockClass('due');
  //hide production tasks
  $('#prod-TaskandRole-wrap').hide();
  //hide status form
  $('#statusForm').hide();
  //hide job # and HS #
  $('#requestOptions').empty();

} 
///////////////////////
function clearProdRoleForm(){
   //clear form
   $('#ProductionPOCRole').val('Editor');
   $('#prod-UserSelectWrap2').empty();
   $('#prod-UserSelectWrap2').append(
     '<!-- Default input -->'+
     '<label for="prod-UserSelect_TopSpan_EditorInput" >Assign to:</label>'+
     '<div class="prodpeoplePickerDiv" prod-role="Editor" id="prod-UserSelect"></div>')
   ///generate people picker
     initializePeoplePicker('prod-UserSelect');
   //close form
   resetTaskRoleForm();
  // $('#prod-ContactEditor').hide();
 //   $('#prodTasks-wrap').show();
}

///reset production task cards
function getRole(taskRole){
    var prodPOCJSON = "";
    var selectableRole ="";
    if(taskRole != ""){
    $().SPServices({
                                 operation: "GetListItems",
                                 async: false,
                                 listName: "Requests",                                  
	                             CAMLViewFields: "<ViewFields>" +
	                                                "<FieldRef Name='ID'/>"+
	                                                "<FieldRef Name='ProductionContacts'/>"+ 
	                                   "</ViewFields>",                             
	                             CAMLQuery:'<Query><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+userSelectedRequest+'</Value></Eq></Where></Query>',
	                            // CAMLRowLimit: 1,       
                                 completefunc: function (xData, Status) {                                     
                                          $(xData.responseXML).SPFilterNode("z:row").each(function() { 
                                             prodPOCJSON =  $(this).attr("ows_ProductionContacts");
                                                   if(prodPOCJSON != undefined && prodPOCJSON != ""  ){ 
										               prodPOCJSON = JSON.parse("["+prodPOCJSON +"]");
            
										                             
										             }
                                          })
                                         }
                                        })  
                                          
       var pocCount = 0;
        $.each( prodPOCJSON , function( index, value ) {
                ///set POC data                
                var pocName = value.Name;
                var pocRole = value.Role;
                if(pocName != undefined && pocName !="" ){
              if(pocRole == taskRole ){             
                pocCount +=1;
                  selectableRole += '<div class="custom-control custom-checkbox  mb-2">'+
											                 '<input type="checkbox" class="custom-control-input taskConfigPoc" value="'+pocName+'"   id="task-poc'+pocCount+'">'+
											                 '<label class="custom-control-label" for="task-poc'+pocCount+'">'+pocName+'</label>'+
											                 '</div>';
											                 }
											             }
											                 
                })
               if(pocCount == 0){ 
                 selectableRole ="<h4>No Options Available</h4>"
               }
               
            }else{
            
                 selectableRole ="<h4>No Options Available</h4>"

            }   
                return selectableRole ;
             

}
function resetTaskConfigurationForm(){
  
 $('#ProductionTaskRole').val('').change();
 $('#ProductionTaskDesc').val('');
 $('#assignTask-form').hide();$('#prodTasks-wrap').show();
 $('#ProductionTaskInput').val("");
 $('#ProductionTaskDesc').val("");
 $('.isInValid').removeClass('isInValid');
 $('#TaskFormValidation').empty();
 $('.ProductionTask-RadionBtn:checked').prop('checked',false)
 

};
function resetTaskRoleForm(){
  
 $('#prod-ContactEditor').hide();
 $('#assignTask-form').hide();
 $('#prodTasks-wrap').show();

;}

/////reset alert class
function resteclockClass(classSwitch){
$('#requestWell').removeClass('alert-secondary');
$('#requestWell').removeClass('alert-danger');
$('#requestWell').removeClass('alert-dark');
$('#requestWell').removeClass('alert-RequestWaiting');
$('#requestWell').removeClass('alert-RequestProduction');
$('#requestWell').removeClass('alert-RequestRejected');
$('#requestWell').removeClass('alert-RequestCompleted');
var currentRequestIndicator_Status = $('#statusBadge > span').html();
 $('#requestWellTest').remove();
  //  $('#requestWell').append('<span id="requestWellTest">'+currentRequestIndicator_Status+'</span>')
  
// $('#clock').css('color','rgb(0, 200, 81)');
 // alert(classSwitch )
		if(classSwitch == "due"){	 
			/////set Status Theme 
			 if(currentRequestIndicator_Status == "Waiting for Production Approval" ){
			     $('#requestWell').addClass('alert-RequestWaiting');
			 }else if(currentRequestIndicator_Status == "Production Approved"){
			     $('#requestWell').addClass('alert-RequestProduction');
			 }else if(currentRequestIndicator_Status == "Rejected"){
			     $('#requestWell').addClass('alert-RequestRejected');
			 }else if(currentRequestIndicator_Status == "Complete"){
			     $('#requestWell').addClass('alert-RequestCompleted');
			 }else{
			     //$('#requestWell').addClass('alert-dark');
			 } 	
		}else if(classSwitch == "past"){
		     if(currentRequestIndicator_Status == "Waiting for Production Approval" ){
			     $('#requestWell').addClass('alert-RequestWaiting');
			 }else if(currentRequestIndicator_Status == "Production Approved"){
			     $('#requestWell').addClass('alert-RequestProduction');
			 }else if(currentRequestIndicator_Status == "Rejected"){
			     $('#requestWell').addClass('alert-RequestRejected');
			 }else if(currentRequestIndicator_Status == "Complete"){
			     $('#requestWell').addClass('alert-RequestCompleted');
			 }
		}else if(classSwitch == "closed"){
		  /////set Status Theme 
			 if(currentRequestIndicator_Status == "Waiting for Production Approval" ){
			     $('#requestWell').addClass('alert-RequestWaiting');
			 }else if(currentRequestIndicator_Status == "Production Approved"){
			     $('#requestWell').addClass('alert-RequestProduction');
			 }else if(currentRequestIndicator_Status == "Rejected"){
			     $('#requestWell').addClass('alert-RequestRejected');
			 }else if(currentRequestIndicator_Status == "Complete"){
			     $('#requestWell').addClass('alert-RequestCompleted');
			 }else{
			     //$('#requestWell').addClass('alert-dark');
			 } 	


		  
		}

}
////

//////set due date clock
function resetDueDateClock(dueDateParam,isDue, thisrequestStatus ){ 
var fiveSeconds = new Date().getTime() + 5000;
var todaysDate = new Date();
var dispayDueDate;
 
if(dueDateParam != undefined){
	//var dueMonth = dueDateParam.substring(dueDateParam.lastIndexOf('/')+1);
	//var dueDay = dueDateParam.substring(dueDateParam.indexOf('/')+1,dueDateParam.lastIndexOf('/'));
	//var dueYear = dueDateParam.substring(0,dueDateParam.indexOf('/'));
	   // dispayDueDate = dueMonth +'/'+dueDay+'/'+dueYear;
         $('#requestDueDisplay').remove();
	    dispayDueDate = dueDateParam
		 if(isDue == true){	
			$('#clock').countdown(dueDateParam  , {elapse: true})
			.on('update.countdown', function(event) {
			  var $this = $(this);
			  if (event.elapsed) {
			  ////update class
			    resteclockClass('past');
			    $this.html(event.strftime('<span style="color:red">%D Days and %H:%M:%S Hours Past Due</span>'));
			  } else {
			  resteclockClass('due');
			    $this.html(event.strftime('<span style="color:rgb(0, 200, 81)" >%D Days and %H:%M:%S Hours Remaining</span>'));
			  }
			  
		     });
		       $('#clock-alert').prepend('<span id="requestDueDisplay" style="font-size:20px;"><b style="font-weight:bold!important">Due Date:</b> '+dispayDueDate+'</span>')

		     }else{
		       $('#clock-alert').prepend('<span id="requestDueDisplay" class="text-muted" style="font-size:28px"><b style="font-weight:bold!important">'+thisrequestStatus+' Date:</b>'+dispayDueDate+'</span>')
		       resteclockClass('closed');
		     }
}else{
    
      
     dispayDueDate = "No Due Date";
     $('#clock-alert').hide();

     
}
///display due date
 if(thisrequestStatus == "Complete" ){
  //  alert(thisrequestStatus );
    $('#clock').hide();
   
 }else{
 
   $('#clock').show();
 }            


};
/////close details card

function cloaseDetailsCard(closeButton){

      $(".requestDetail-btn").prop("checked", false);
      $(".requestDetail-btn").parents('tr').removeClass('selected')
      $(".legacyRequestDetail-btn").prop("checked", false);
      $(".legacyRequestDetail-btn").parents('tr').removeClass('selected')
      $('#requestDetailsWrap').hide();
      $('#summary-view-Wrap').show();

      
 
}

 

/// generate request table

function generateRequestTable(requestView,requestFilter,yearFilters  ){

 
     var noteArray =[];
 


   $('.loading-slert').show()

  var tableName ="";

  var tableEmpty = "Yes";

  var tableRows ="";
  
  var tableRowClass ="";
  var duedateStyle ="";
   var todaysDate = new Date();
   var todaysMonth = todaysDate.getMonth()+1; 
   var todaysDay  = todaysDate.getDate(); 
   var todaysYear  = todaysDate.getFullYear();
   var todaysFullDate = todaysMonth +''+todaysDay +''+todaysYear  ;
   todaysFullDate = parseInt(todaysFullDate)
   
 

  var  Query ='<Query><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'

  var summaryViewTitle = "Unknown Table";

  var summaryViewInstruction ="";
         var hideyearFileters =""
          if(yearFilters == undefined){
              //hideyearFileters ="display:none"
            var d = new Date(); 
	        var requestYearCurrent = parseInt(d.getFullYear());
            var requestYear3 = requestYearCurrent  - 1;
            var requestYear2 = requestYearCurrent  - 2;
            var requestYear1 = requestYearCurrent  - 3;
                yearFilters  = [requestYearCurrent,requestYear3] 
                }   
            ///reset Year Filter
            if(queryStringID != undefined){
               yearFilters  = [requestYearCurrent];
            };
            
        var yearFilterButtons = "" 
       
          $.each(yearFilters , function( index, value ) {
      var filteredYear = value;
          yearFilterButtons += '<a href="javascript:removeYearFilter('+value+')" style="margin-right:15px" class="badge '+value+'YearBadge badge-light"><span class="yearBadge" >'+value +'</span> <i  class="fa fa-times" aria-hidden="true"></i></a>'
          
          if(requestView == "My Requests" || requestView == undefined){

             requestView = "My Requests";

              tableID ="myRequests";

              Query ='<Query><Where>'+

                  '<And>'+
					'<Eq>'+
						//'<FieldRef Name="Author"/>'+
						//'<Value Type="Integer">'+
							//'<UserID/>'+
						//'</Value>'+
						'<FieldRef Name="Requestor"/>'+
                         '<Value Type="Text">'+curUserTitle +'</Value>'+

					'</Eq>'+
					'<Eq>'+
						'<FieldRef Name="requestYear"/>'+
						'<Value Type="Text">'+filteredYear+'</Value>'+
					'</Eq>'+
				'</And>'+
   '</Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'

          }else if(requestView == "Production"){

             tableID ="production";

             var resultFilter = "";

 
                      Query ='<Query><Where>'+
                      '<And>'+
                     '<Eq>'+

         '<FieldRef Name="SummaryFilter"/>'+

                  '<Value Type="Text">Production</Value>'+

       '</Eq>'+
       '<Eq>'+
						'<FieldRef Name="requestYear"/>'+
						'<Value Type="Text">'+filteredYear+'</Value>'+
					'</Eq>'+
				'</And>'+


      '</Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'                 

                 

                   

          }else if(requestView == "Queue"){

             tableID ="queue";

             var resultFilter = "";

                 

                      Query ='<Query><Where>'+
                      '<And>'+
                     '<Eq>'+

         '<FieldRef Name="SummaryFilter"/>'+

                  '<Value Type="Text">Approval Queue</Value>'+

       '</Eq>'+
       '<Eq>'+
						'<FieldRef Name="requestYear"/>'+
						'<Value Type="Text">'+filteredYear+'</Value>'+
					'</Eq>'+
				'</And>'+


      '</Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'                 

                

          }else if(requestView == "Closed"){ 

            tableID ="Closed";

             var resultFilter = "";

                  

                      Query ='<Query><Where>'+
                      '<And>'+
                     '<Eq>'+

         '<FieldRef Name="SummaryFilter"/>'+

                  '<Value Type="Text">Closed</Value>'+

       '</Eq>'+
       '<Eq>'+
						'<FieldRef Name="requestYear"/>'+
						'<Value Type="Text">'+filteredYear+'</Value>'+
					'</Eq>'+
				'</And>'+


      '</Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'                 

                  

          

          

          }else if(requestView == "Canceled"){ alert()

            tableID ="Closed";

             var resultFilter = "";

                  

                      Query ='<Query><Where>'+
                     '<And>'+
                     '<Eq>'+

         '<FieldRef Name="SummaryFilter"/>'+

                  '<Value Type="Text">Canceled</Value>'+

       '</Eq>'+
       '<Eq>'+
						'<FieldRef Name="requestYear"/>'+
						'<Value Type="Text">'+filteredYear+'</Value>'+
					'</Eq>'+
				'</And>'+


      '</Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'   

                    

      }else if(requestView == "Archive"){ 

            tableID ="Closed";

             var resultFilter = "";

                  

                      Query ='<Query><Where>'+
                     '<And>'+
                     '<Eq>'+

         '<FieldRef Name="SummaryFilter"/>'+

                  '<Value Type="Text">Archives</Value>'+

       '</Eq>'+
       '<Eq>'+
						'<FieldRef Name="requestYear"/>'+
						'<Value Type="Text">'+filteredYear+'</Value>'+
					'</Eq>'+
				'</And>'+


      '</Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'                 

                  

              

          

          }
          if(queryStringID != undefined){
          Query ='<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Text">908</Value></Eq></Where><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'                 
          }
        

        if(requestFilter == "My Requests"){

         summaryViewTitle = "My Requests";
         summaryViewInstruction ="Customize and sort views based on specific roles and access rights. To sort the information below in different ways, click on the text at the top of each column. To filter by year, click on the drop-down menu.";

        }else if(requestFilter == "Approval"){

         summaryViewTitle = "Approval Queue";

         summaryViewInstruction ="These are jobs approved by OCCI to move into production. To sort the information below in different ways, click on the text at the top of each column. To filter by year, click on the drop-down menu."

        }else if(requestFilter == "Production"){

         summaryViewTitle = "In Production";
         summaryViewInstruction ="This is a list of your jobs in production, and where in the production process each job is. This is also where you will interact with your jobs, providing content, corrections, and approvals. To sort the information below in different ways, click on the text at the top of each column. To filter by year, click on the drop-down menu.";
        }else if(requestFilter == "Closed"){

        // summaryViewTitle = "Closed Jobs";
           summaryViewTitle = "Completed Jobs";
           summaryViewInstruction ="This is a list of jobs that have been completed. Since many of our jobs repeat year after year, this is a resource for you to refer to a previous job. To sort the information below in different ways, click on the text at the top of each column. To filter by year, click on the drop-down menu.";



        

        }else if(requestFilter == "Archives"){

         summaryViewTitle = "Archives";
         summaryViewInstruction ="This list includes any cancelled or jobs that were never completed, in addition to completed jobs. To sort the information below in different ways, click on the text at the top of each column. To filter by year, click on the drop-down menu.";


        

        }else if(requestFilter == "Canceled"){

         summaryViewTitle = "Canceled Requests & Jobs";
         summaryViewInstruction ="This is a list of your canceled requests and jobs. To sort the information below in different ways, click on the text at the top of each column. To filter by year, click on the drop-down menu.";


        } 

 

    var requestYearItems =  getRequestYear();
    var filterDropID = "dropdownMenuRequests";
    var requestYearFilter = '<div class="dropdown">'+
								  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="'+filterDropID+'" data-toggle="dropdown"'+
								    'aria-haspopup="true" aria-expanded="false">'+
								   'Year Filters'+
								  '</button>'+
								  '<div class="dropdown-menu" aria-labelledby="'+filterDropID+'">'+
								    requestYearItems+
								  '</div>'+
								'</div>'+
								'<div style="'+hideyearFileters+'"  requestFilter="'+requestFilter+'" requestView="'+requestView+'" id="yearFilterWrap">'+
								'<div style="padding-left:10px;padding-right:10px;padding-top:5px">'+
								'<b style="padding-right:5px"><i class="fa fa-filter" aria-hidden="true"></i> Year Filters:</b> '+
								 yearFilterButtons +
								'</div>'+
								'</div>'
								

       ///set summary title
   
           $('#summary-view').html(summaryViewTitle)

           $('#summary-viewInstructions').html('<div class="alert alert-warning hoverable" style="padding-bottom:10px">'+summaryViewInstruction+'</div>'+requestYearFilter )

         

                        $().SPServices({

                                 operation: "GetListItems",

                                 async: false,

                                 listName: "Requests",                                  

                                       CAMLViewFields: "<ViewFields>" +

                                                        "<FieldRef Name='ID'/>"+

                                                        "<FieldRef Name='Title'/>"+ 

                                                         "<FieldRef Name='Status'/>"+ 

                                                          "<FieldRef Name='RequestDate'/>"+ 

                                                          "<FieldRef Name='Campaign'/>"+ 

	                                                       "<FieldRef Name='Author'/>"+ 
	                                                       "<FieldRef Name='Requestor'/>"+
	
	                                                       "<FieldRef Name='Due_x0020_Date'/>"+
	                                                        "<FieldRef Name='Routing_x0020_Code'/>"+
	
	                                                       "<FieldRef Name='HS'/>"+ 
	
	                                                       "<FieldRef Name='SA'/>"+ 
	
	                                                       "<FieldRef Name='Created'/>"+ 
	                                                       
	                                                       '<FieldRef Name="Production_x0020_Stage"/>'+
	                                                       "<FieldRef Name='Job_x0020_Number'/>"+
                                              
                                               '<FieldRef Name="Production_x0020_Status"/>'+
                                               '<FieldRef Name="ProductionNotes"/>'+
                                               '<FieldRef Name="SharedNotes"/>'+


                                           "</ViewFields>",                             

                                       CAMLQuery:Query ,
                                      //CAMLRowLimit: 1,       

                                  completefunc: function (xData, Status) {                                       

                                          $(xData.responseXML).SPFilterNode("z:row").each(function() { 
                                         

                                            tableEmpty ="No";                                            

                                             var requestValue_ID = $(this).attr("ows_ID"); 
                                                 noteArray.push(requestValue_ID);
                                             var requestValue_Title = $(this).attr("ows_Title");

                                             var requestValue_RequestDate = $(this).attr("ows_RequestDate").substring( $(this).attr("ows_RequestDate").indexOf('#')+1);

                                             var requestValue_SpCreatedDate = $(this).attr("ows_Created");
                                           
                                             var requestValue_Status = $(this).attr("ows_Status");
                                             var requestValue_ProdStatus = $(this).attr("ows_Production_x0020_Status")//.substring($(this).attr("ows_Production_x0020_Status").indexOf('#')+1);
                                                 if(requestValue_ProdStatus != undefined){
                                                   requestValue_ProdStatus = requestValue_ProdStatus.substring( requestValue_ProdStatus.indexOf('#')+1);
                                                 }
                                             var requestValue_ProdStage = $(this).attr("ows_Production_x0020_Stage");
                                             
                                             if(requestValue_ProdStage != undefined){
                                                   requestValue_ProdStage = requestValue_ProdStage.substring( requestValue_ProdStage.indexOf('#')+1);
                                                 }


                                             var requestValue_JobNumber = $(this).attr("ows_Job_x0020_Number");
                                             var JobNumberValue = $(this).attr("ows_Job_x0020_Number");
                                             if(requestValue_JobNumber!= undefined){requestValue_JobNumber = '<span style="font-weight:bold"></span><b  id="'+tableID+requestValue_ID+'-JobNumber" style="font-weight:bold">'+requestValue_JobNumber+'</b><br>'
                                             }else{
                                             requestValue_JobNumber="";
                                             JobNumberValue = "None";
                                              requestValue_JobNumber = '<b  id="'+tableID+requestValue_ID+'-JobNumber" style="font-weight:bold">'+requestValue_JobNumber+'</b>'
                                             }
                                             

                                             var requestValue_HS = $(this).attr("ows_HS");

                                              if(requestValue_HS == undefined ){

                                                    requestValue_HS = "None"

                                                   } 
                                             var requestValue_Requestor = $(this).attr("ows_Requestor");
 

                                             var requestValue_SA = $(this).attr("ows_SA");

                                             if(requestValue_SA == undefined || requestValue_SA == ""){

                                                    requestValue_SA= "None"

                                                   }else{
                                                     var splitSAString = requestValue_SA.split(';');
                                                     requestValue_SA ="";
                                                     $.each(splitSAString,function(index,value){
	                                                     if(index == 0){
	                                                        requestValue_SA+= value
	                                                     }else{
	                                                        requestValue_SA+= "; "+value
	                                                     }
                                                     })
                                                   }

                                             var requestValue_Campaign = $(this).attr("ows_Campaign");

                                                 if(requestValue_Campaign == undefined){

                                                    requestValue_Campaign = "None"

                                                   }else{

                                                    requestValue_Campaign = requestValue_Campaign.substring(requestValue_Campaign.indexOf('#')+1);

                                                 }                                                

                                               var requestValue_Routing =  $(this).attr("ows_Routing_x0020_Code");
                                               if(requestValue_Routing != undefined){
                                                 requestValue_Routing =   $(this).attr("ows_Routing_x0020_Code").substring($(this).attr("ows_Routing_x0020_Code").indexOf('#')+1);
                                               }

                                             var requestValue_DueDate = $(this).attr("ows_Due_x0020_Date");
                                                 duedateStyle ="";
                                                 tableRowClass="";
                                                    
                                                 if(requestValue_DueDate == undefined || requestValue_DueDate == "None"){
                                                 requestValue_DueDate = "None";
                                                 tableRowClass ="";
                                                 duedateStyle ="";
                                                 }else{
                                                 var requestValue_TodaysDate = new Date();
                                                 var requestValue_DueDateArg = new Date(requestValue_DueDate); 
                                                    ///set past due styling
    
                                                      if( requestValue_TodaysDate > requestValue_DueDateArg){ 
                                                      
                                                          tableRowClass ="table-danger";
                                                           duedateStyle ="pastDueDate";
                                                           if(requestValue_ProdStatus =="Job On Hold" ){
                                                              tableRowClass ="";
                                                           }

                                                  
                                                       }
                                                 }
                                                  
                                            var productionNotes = "";
                                            var productionNotesList ="";
                                                if($(this).attr("ows_ProductionNotes")!= undefined){
                                                     productionNotes = $(this).attr("ows_ProductionNotes");
                                                     productionNotes = productionNotes.split(',');
                                                     $.each(productionNotes, function( index, value ) {
                                                          value = decodeHtml(value); 
                                                          value = value.replace(/!#comma#!/g,',');
                                                          if(index == 0){
                                                     		productionNotesList +="• "+value;
                                                     		}else{
                                                     		productionNotesList +="\n• "+value;
                                                     		}
                                                     })
                                                }
                                            var sharedNotes =  $(this).attr("ows_SharedNotes");
                                            var sharedNotesList ="";
                                                if($(this).attr("ows_SharedNotes")!= undefined){
                                                     sharedNotes = $(this).attr("ows_SharedNotes");
                                                     sharedNotes = sharedNotes.split(',');
                                                     $.each(sharedNotes, function( index, value ) {
                                                          value = decodeHtml(value); 
                                                          value = value.replace(/!#comma#!/g,',');
                                                          if(index == 0){
                                                     		sharedNotesList +="• "+value;
                                                     		}else{
                                                     		sharedNotesList +="\n• "+value;
                                                     		}
                                                     })
                                                }


                                             var requestCBX = '<div class="custom-control custom-checkbox">'+

                    '<input type="checkbox" requestID="'+requestValue_ID+'"  class="custom-control-input   requestDetail-btn" id="'+tableID+requestValue_ID+'">'+

                    '<label class="custom-control-label" for="'+tableID+requestValue_ID+'" ><span class="sr-only">View details for '+requestValue_Title+'</span></label>'+

                '</div>'

           var requestLink ='<a  href="Requests.aspx?request='+requestValue_ID+'" target="_blank" style="color:#0275d8;font-weight:700"><i class="fa fa-external-link" aria-hidden="true"></i></a><a  href="Requests.aspx?request='+requestValue_ID+'" target="_blank" style="color:#0275d8;font-weight:600" id="'+tableID+requestValue_ID+'-Request">'+requestValue_Title+'</a>'                                                  

                                             if(requestView == "My Requests" || requestView == undefined){

                                                 tableRows  += '<tr  class="'+tableRowClass+'">'+

                                                                 '<td data-toggle="tooltip" data-placement="left" title="Click the Checkbox to view '+requestValue_Title+' Request Details" class="RequestDetailCBX"  style="border-right:1px solid #dee2e6"  >'+'<span style="display:none" id="'+tableID+requestValue_ID+'-Status">'+requestValue_Status+'</span>'+'<span  style="display:none"  id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span>'+requestCBX+'</td>'+
                                                                
                                                                '<td>'+JobNumberValue +'</td>'+
                                                                '<td>'+requestValue_Title +'</td>'+

                                                              '<td>'+'<div style="display:">'+requestValue_JobNumber+'</div>'+requestLink+'</td>'+

                                                               '<td>'+requestValue_HS+'</td>'+
                                                               
                                                               '<td>'+requestValue_Requestor+'</td>'+
                                                               '<td>'+requestValue_Routing+'</td>'+
                                                               '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+
                                                               
                                                               '<td>'+requestValue_Campaign+'</td>'+
                                                               '<td class="'+duedateStyle+'">'+requestValue_DueDate+'</td>'+
                                                               '<td>'+requestValue_ProdStage+'</td>'+
                                                               '<td>'+requestValue_ProdStatus+'</td>'+
                                                               '<td>'+requestValue_Status+'</td>'+

                                                               '<td ><span style="display:none" id="'+tableID+requestValue_ID+'-Stage">'+requestValue_ProdStage+'</span><span style="display:none" id="'+tableID+requestValue_ID+'-prodStat">'+requestValue_ProdStatus+'</span>'+requestValue_Status +'</td>'+

                                                               '<td>'+sharedNotesList+'</td>'+
                                                               '<td>???</td>'+

                                                               '<td >'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

                  }else if(requestView == "Production"){

                   tableRows  += '<tr class="'+tableRowClass+'" >'+

                                                               '<td data-toggle="tooltip" data-placement="left" title="Click the Checkbox to view '+requestValue_Title+' Job Details" class="RequestDetailCBX"   style="border-right:1px solid #dee2e6">'+'<span style="display:none" id="'+tableID+requestValue_ID+'-Status">'+requestValue_Status+'</span>'+'<span  style="display:none"  id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span>'+requestCBX+'</td>'+
                                                                
                                                                '<td>'+JobNumberValue +'</td>'+
                                                                 '<td>'+requestValue_Title +'</td>'+

                                                              '<td>'+'<div style="display:">'+requestValue_JobNumber+'</div>'+requestLink+'</td>'+

                                                               '<td>'+requestValue_HS+'</td>'+
                                                               
                                                               '<td>'+requestValue_Requestor+'</td>'+
                                                               '<td>'+requestValue_Routing+'</td>'+
                                                               '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+
                                                               
                                                               '<td>'+requestValue_Campaign+'</td>'+
                                                              '<td class="'+duedateStyle+'">'+requestValue_DueDate+'</td>'+
                                                              '<td id="'+tableID+requestValue_ID+'-Stage">'+requestValue_ProdStage+'</td>'+
                                                               '<td id="'+tableID+requestValue_ID+'-prodStat">'+requestValue_ProdStatus+'</td>'+
                                                               '<td>'+requestValue_Status+'</td>'+
                                                              


                                                               '<td ><span style="display:none" >'+requestValue_ProdStage+'</span><span style="display:none">'+requestValue_ProdStatus+'</span>'+requestValue_Status +'</td>'+

                                                               '<td>'+productionNotesList+'</td>'+
                                                               '<td>'+sharedNotesList+'</td>'+

                                                               '<td>'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

                                                              

                                                 }else if(requestView == "Closed"){

                   tableRows  += '<tr>'+

                                                               '<td  data-toggle="tooltip" data-placement="left" title="Click the Checkbox to view '+requestValue_Title+' Request Details" class="RequestDetailCBX"   style="border-right:1px solid #dee2e6">'+'<span style="display:none" id="'+tableID+requestValue_ID+'-Status">'+requestValue_Status+'</span>'+'<span  style="display:none"  id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span>'+requestCBX+'</td>'+

                                                                '<td>'+JobNumberValue +'</td>'+
                                                                 '<td>'+requestValue_Title +'</td>'+

                                                               '<td>'+'<div style="display:">'+requestValue_JobNumber+'</div>'+requestLink+'</td>'+


                                                               '<td>'+requestValue_HS +'</td>'+

                                                               '<td>'+requestValue_Requestor +'</td>'+

                                                               '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+

                                                               '<td>'+requestValue_Campaign +'</td>'+

                                                               '<td>'+requestValue_DueDate +'</td>'+
                                                               '<td>'+requestValue_ProdStage+'</td>'+
                                                               '<td>'+requestValue_ProdStatus+'</td>'+
                                                               '<td>'+requestValue_Status+'</td>'+


                                                               '<td ><span style="display:none" id="'+tableID+requestValue_ID+'-Stage">'+requestValue_ProdStage+'</span><span style="display:none" id="'+tableID+requestValue_ID+'-prodStat">'+requestValue_ProdStatus+'</span>'+requestValue_Status +'</td>'+

                                                               '<td>'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

                                                }else if(requestView == "Canceled"){

                   tableRows  += '<tr>'+

                                                                '<td  data-toggle="tooltip" data-placement="left" title="Click the Checkbox to view '+requestValue_Title+' Request Details" class="RequestDetailCBX"   style="border-right:1px solid #dee2e6">'+'<span style="display:none" id="'+tableID+requestValue_ID+'-Status">'+requestValue_Status+'</span>'+'<span  style="display:none"  id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span>'+requestCBX+'</td>'+
                                                                 '<td>'+JobNumberValue +'</td>'+
                                                                 '<td>'+requestValue_Title +'</td>'+


                                                               '<td>'+'<div style="display:">'+requestValue_JobNumber+'</div>'+requestLink+'</td>'+


                                                               '<td>'+requestValue_HS +'</td>'+

                                                               '<td>'+requestValue_Requestor +'</td>'+

                                                               '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+

                                                               '<td>'+requestValue_Campaign +'</td>'+

                                                               '<td>'+requestValue_DueDate +'</td>'+
                                                               '<td>'+requestValue_ProdStage+'</td>'+
                                                               '<td>'+requestValue_ProdStatus+'</td>'+
                                                               '<td>'+requestValue_Status+'</td>'+


                                                              '<td ><span style="display:none" id="'+tableID+requestValue_ID+'-Stage">'+requestValue_ProdStage+'</span><span style="display:none" id="'+tableID+requestValue_ID+'-prodStat">'+requestValue_ProdStatus+'</span>'+requestValue_Status +'</td>'+

                                                               '<td>'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

 

                   }else if(requestView == "Archive"){ 

                   tableRows  += '<tr>'+

                                                               '<td>'+requestCBX+'</td>'+
                                                             


                                                                '<td>'+requestValue_JobNumber+requestLink+'<span style="display:none" id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span></td>'+


                                                               '<td>'+requestValue_HS +'</td>'+

                                                               '<td>'+requestValue_Requestor +'</td>'+

                                                               '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+

                                                               '<td>'+requestValue_Campaign +'</td>'+

                                                               '<td>'+requestValue_DueDate +'</td>'+

                                                               '<td ><span style="display:none" id="'+tableID+requestValue_ID+'-Stage">'+requestValue_ProdStage+'</span><span style="display:none" id="'+tableID+requestValue_ID+'-prodStat">'+requestValue_ProdStatus+'</span>'+requestValue_Status +'</td>'+

                                                               '<td>'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

 

                    

  

                    

                  }else if(requestView == "Queue"){  

                   tableRows  += '<tr class="'+tableRowClass+'">'+

                                                              '<td data-toggle="tooltip" data-placement="left" title="Click the Checkbox to view '+requestValue_Title+' Request Details" class="RequestDetailCBX"   style="border-right:1px solid #dee2e6">'+'<span style="display:none" id="'+tableID+requestValue_ID+'-Status">'+requestValue_Status+'</span>'+'<span  style="display:none"  id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span>'+requestCBX+'</td>'+
                                                                 '<td>'+requestValue_Title +'</td>'+


                                                                '<td>'+'<div style="display:">'+requestValue_JobNumber+'</div>'+requestLink+'</td>'+

                                                               '<td>'+requestValue_HS +'</td>'+

                                                               '<td>'+requestValue_Requestor +'</td>'+

                                                               '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+

                                                               '<td>'+requestValue_Campaign +'</td>'+

                                                               '<td class="'+duedateStyle+'">'+requestValue_DueDate+'</td>'+
                                                               '<td>'+requestValue_Status+'</td>'+


                                                               '<td ><span style="display:none" id="'+tableID+requestValue_ID+'-Stage">'+requestValue_ProdStage+'</span><span style="display:none" id="'+tableID+requestValue_ID+'-prodStat">'+requestValue_ProdStatus+'</span>'+requestValue_Status +'</td>'+

                                                               '<td>'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

                    

                  }

 

 

                                            

                                  

                                             

                                              });

                                           if(Status == "success"){

                                            $('.loading-slert').hide();

                                                if(tableEmpty == "Yes"){

                                                   tableRows ="None";

                                                }

                                             };

                                          

                                       }

                                    })  

 
    });
 

   var tableHtml = getRequestTableHTML(requestView ,tableRows);
   
 
 

   ///set data table options

     var tableOptions = "";

       if(requestView == "My Requests" || requestView == undefined){
        var buttonCommon = {
					        exportOptions: {
					         columns: 'th:not(.noExport)',
					            format: {
					                body: function ( data, row, column, node ) {
					                    if( column === 0){
					                     // data = data.replace('<div class="custom-control custom-checkbox">',"");
					                    }
					                    return data;
					                 
					                }
					            }
					        }
					    };

        tableOptions = { 

                           "order": [[ 17, "desc" ]],
                           "dom": 'Bfrtip',
                           "buttons": [
                           				$.extend( true, {}, buttonCommon, {
                           				extend: 'excelHtml5',
                           				customize: function( xlsx ) {
							                var sheet = xlsx.xl.worksheets['sheet1.xml'];
                                            $('row c[r^="M"]', sheet).attr( 's', '55' );
							            }
                           				}),
                           				'pdf', 
                           				'print'
                           			  ],

            "columnDefs": [ 

                 {

                     "targets": [ 1,2,5,6,11,12,13,15,16,17  ],
                     "searchable": false,
                     "visible": false,     

                 },


               ]

               

            }   

    }else if(requestView == "Production"){ 
     var buttonCommon = {
					        exportOptions: {
					         columns: 'th:not(.noExport)',
					            format: {
					                body: function ( data, row, column, node ) {
					                    if( column === 0){
					                     // data = data.replace('<div class="custom-control custom-checkbox">',"");
					                    }
					                    return data;
					                 
					                }
					            }
					        }
					    }

           tableOptions = { 

                           "order": [[ 17, "desc" ]],
                           "dom": 'Bfrtip',
                           "buttons": [
                           				$.extend( true, {}, buttonCommon, {
                           				extend: 'excelHtml5',
                           				customize: function( xlsx ) {
							                var sheet = xlsx.xl.worksheets['sheet1.xml'];
                                            $('row c[r^="M"]', sheet).attr( 's', '55' );
                                            $('row c[r^="N"]', sheet).attr( 's', '55' );
                                         

							            }
                           				}),
                           				'pdf', 
                           				'print'
                           			  ],



                          

            "columnDefs": [ 

                 {

                     "targets": [ 1,2,6,9,13,14,15,16,17 ],

                     "visible": false,     

                     "searchable": false

                 },

               ]

               

            }  

  }else if(requestView == "Closed"){ 
   var buttonCommon = {
					        exportOptions: {
					         columns: 'th:not(.noExport)',
					            format: {
					                body: function ( data, row, column, node ) {
					                    if( column === 0){
					                     // data = data.replace('<div class="custom-control custom-checkbox">',"");
					                    }
					                    return data;
					                 
					                }
					            }
					        }
					    }

           tableOptions = { 

                           "order": [[ 14, "desc" ]],
                           "dom": 'Bfrtip',
                           "buttons": [
                           				$.extend( true, {}, buttonCommon, {extend: 'excelHtml5'} ),
                           				'pdf', 
                           				'print'
                           			  ],



                          

            "columnDefs": [ 

                 {

                     "targets": [ 1,2,10,11,12,13,14 ],

                     "visible": false,     

                     "searchable": false

                 },

               ]

               

            }                          

      }else if(requestView == "Canceled"){ 
       var buttonCommon = {
					        exportOptions: {
					         columns: 'th:not(.noExport)',
					            format: {
					                body: function ( data, row, column, node ) {
					                    if( column === 0){
					                     // data = data.replace('<div class="custom-control custom-checkbox">',"");
					                    }
					                    return data;
					                 
					                }
					            }
					        }
					    }

           tableOptions = { 

                           "order": [[ 14, "desc" ]],
                           "dom": 'Bfrtip',
                           "buttons": [
                           				$.extend( true, {}, buttonCommon, {extend: 'excelHtml5'} ),
                           				'pdf', 
                           				'print'
                           			  ],



                          

            "columnDefs": [ 

                 {

                     "targets": [ 1,2,10,11,12,13,14 ],

                     "visible": false,     

                     "searchable": false

                 },

               ]

               

            }                          

           }else if(requestView == "Archive"){

           tableOptions = { 

                           "order": [[ 9, "desc" ]],

                          

            "columnDefs": [ 

                 {

                     "targets": [ 9 ],

                     "visible": true,     

                     "searchable": false

                 },

               ]

               

            }   

       }else if(requestView == "Queue"){
        var buttonCommon = {
					        exportOptions: {
					         columns: 'th:not(.noExport)',
					            format: {
					                body: function ( data, row, column, node ) {
					                    if( column === 0){
					                     // data = data.replace('<div class="custom-control custom-checkbox">',"");
					                    }
					                    return data;
					                 
					                }
					            }
					        }
					    }

           tableOptions = { 

                           "order": [[ 11, "desc" ]],
                           "dom": 'Bfrtip',
                           "buttons": [
                           				$.extend( true, {}, buttonCommon, {extend: 'excelHtml5'} ),
                           				'pdf', 
                           				'print'
                           			  ],


                          

            "columnDefs": [ 

                 {

                     "targets": [ 1,3,9,11 ],

                     "visible": false,     

                     "searchable": false

                 },

               ]

               

            }   

               

          

  //////////////////////        

       }///end option conditions

   
    $('#JobRequests-TBLWrap').empty()
   $('#JobRequests-TBLWrap').append(tableHtml)
 
   ///set data table styling

    $('#requestSummaryTBL').DataTable(tableOptions);

             $('.dataTables_length').addClass('bs-select');
             
             ////update data table buttons
               ////remove table button row
               $('.dt-buttons').css("display","inline");
               $('.dataTables_filter').css("text-align","inherit");
               $('.dataTables_filter').find('label').css("float","right");
               $('.dt-button').addClass('btn').addClass('btn-light').addClass('btn-md');;
               var buttonDiv = $('.dt-buttons').detach();
                      $('.dataTables_filter').prepend(buttonDiv); 
             
   ////show Request ToolTip
               $('.RequestDetailCBX[data-toggle="tooltip"]').tooltip(); 
               
               
               //////Open Request View
                if(queryStringID != undefined){
                     $('.requestDetail-btn').trigger('click');
                     ////
                };
            

               
               
               
}
////////////////////////////
 
function getNotesArray(notesList){
var returnNotes = [];
      
     if(notesList == "Shared Notes"){
         $('#SharedNotes-Wrap').find('.noteMessage').each(function(){        
               noteMessage = $(this).text();
               noteMessage = encodeHtml(noteMessage.trim());
               noteMessage = noteMessage.replace(/,/g,'!#comma#!') 
               returnNotes.push(noteMessage);
         })
     }else if(notesList == "Production Notes"){
     var noteMessage = "";
         $('#ProdNotes-Wrap').find('.noteMessage').each(function(){
               noteMessage = $(this).text();
               noteMessage = encodeHtml(noteMessage.trim());
               noteMessage = noteMessage.replace(/,/g,'!#comma#!') 
               returnNotes.push(noteMessage);
         })
    }
    
    
     return returnNotes ;
}

/////////////////////////////////////////////////////
function updateProductionNotes_RequestList(noteID,NoteText){
        
       var SavePairs = [["ProductionNotes",NoteText],

                                                   ]
                                                    
                           
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: noteID,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															
															}
														})	
   

}
function updateSharedNotes_RequestList(noteID,NoteText){

       var SavePairs = [["SharedNotes",NoteText],

                                                   ]
                        
                                  
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: noteID,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															  
															}
														})	


}

function getRequestYear(){
  var returnedValues = "";
					   
	 var d = new Date(); 
	 var output = "";
	 var recordBase = 2015
	 var currentYear = parseInt(d.getFullYear());
	 var recordYearCount = currentYear - recordBase ;	     
		 
		var recordOptionYear;
		for (recordOptionYear  = recordBase  ; currentYear >= recordOptionYear  ; recordOptionYear++) {
		      returnedValues += ' <a class="dropdown-item" href="javascript:addYearFilters('+recordOptionYear+')">'+recordOptionYear+'</a>'
		}
		  	//alert(recordOptionYear)			   
		returnedValues 	= '<a class="dropdown-item" href="javascript:clearYearFilters()">Reset Filters</a>'+ returnedValues 			   
	return returnedValues;				   

}
////////////////////////////////////////////////////
function addYearFilters(optionSelected){
   var currentFilters = [];
   var filterDup =  'No'  
    $('.yearBadge').each(function(){ 
		    if($(this).text() == optionSelected){
		     filterDup  ="Yes"
		    }
		      currentFilters.push($(this).text())
    });
      if(filterDup  == "No"){
      currentFilters.push(optionSelected);
      }
     var requestView = $('#yearFilterWrap').attr('requestView') 
     var requestFilter = $('#yearFilterWrap').attr('requestFilter') 
     var currentfunc = $('#yearFilterWrap').attr('currentfunc') ;
     
     if(currentfunc  == undefined){
         generateRequestTable(requestView,requestFilter,currentFilters)
         }else{
          setRequestDetails_Legacy(requestView,requestFilter,currentFilters)

         }
}
//////////////////////////////////////
function clearYearFilters(){
    var requestView = $('#yearFilterWrap').attr('requestView') 
     var requestFilter = $('#yearFilterWrap').attr('requestFilter') 
     var currentfunc = $('#yearFilterWrap').attr('currentfunc') ;
     
     if(currentfunc  == undefined){
         generateRequestTable(requestView,requestFilter)
         }else{
          setRequestDetails_Legacy(requestView,requestFilter)

         }


}
////////////////////////////////////////
function removeYearFilter(optionSelected){ 
   $('.'+optionSelected+'YearBadge').remove()
     var currentFilters = [];

    $('.yearBadge').each(function(){
         currentFilters.push($(this).text())
    });
     var requestView = $('#yearFilterWrap').attr('requestView') 
     var requestFilter = $('#yearFilterWrap').attr('requestFilter') 
     var currentfunc = $('#yearFilterWrap').attr('currentfunc') ;
     
     if(currentfunc  == undefined){
         generateRequestTable(requestView,requestFilter,currentFilters)
         }else{
          setRequestDetails_Legacy(requestView,requestFilter,currentFilters)

         }


}
////////////

function getRequestTableHTML(requestView ,requestRows){

   var returnTableHTML ="";

       if(requestView == "My Requests" ){

      if(requestRows == "None"){

          requestRows = '<tr><td  colspan="14">No Records Found</td></tr>';

       }

      returnTableHTML ='<table id="requestSummaryTBL" class="table table-hover table-responsive " cellspacing="0" width="100%">'+

                '<thead>'+

                  '<tr>'+

                   '<th  style="visibility:collapse" class="th-sm noExport" scope="col"><span class="sr-only">View Request Details</span></th>'+
                    '<th class="th-sm" scope="col">Job #</th>'+
                    '<th class="th-lg" scope="col">Project</th>'+
                    '<th class="th-lg noExport" scope="col">Project</th>'+
                    '<th class="th-sm" scope="col">HS#</th>'+
                    '<th class="th-sm" scope="col">Customer</th>'+
                    '<th class="th-sm" scope="col">Routing Symbol</th>'+
                    '<th class="th-sm" scope="col">SA</th>'+
                    '<th class="th-sm" scope="col">Request Date</th>'+
                    '<th class="th-sm" scope="col">Campaign</th>'+
                    '<th class="th-sm" scope="col">Due Date</th>'+
                    '<th class="th-sm" scope="col">Production Stage</th>'+
                    '<th class="th-sm" scope="col">Production Status</th>'+
                    '<th class="th-sm" scope="col">Request Status</th>'+
                    '<th class="th-sm noExport" scope="col">Status</th>'+
                    '<th class="th-sm" scope="col">Shared Notes</th>'+
                    '<th class="th-sm  noExport" scope="col">Due Back</th>'+
                    '<th class="th-sm noExport" scope="col">Created</th>'+
                  '</tr>'+

                '</thead>'+

                '<tbody >'+

                  requestRows+              

                '</tbody>'+

              '</table>'   

     }else if(requestView == "Production"){

           if(requestRows == "None"){

          requestRows = '<tr><td  colspan="10">No Records Found</td></tr>';

       }

      returnTableHTML ='<table id="requestSummaryTBL" class="table table-hover table-responsive" cellspacing="0" width="100%">'+

                '<thead>'+

                  '<tr>'+

                  '<th  style="visibility:collapse" class="th-sm noExport" scope="col"><span class="sr-only">View Request Details</span></th>'+

                    '<th class="th-sm" scope="col">Job #</th>'+
                    '<th class="th-lg" scope="col">Project</th>'+
                    '<th class="th-lg noExport" scope="col">Project</th>'+
                    '<th class="th-sm" scope="col">HS#</th>'+
                    '<th class="th-sm" scope="col">Customer</th>'+
                    '<th class="th-sm" scope="col">Routing Symbol</th>'+
                    '<th class="th-sm" scope="col">SA</th>'+
                    '<th class="th-sm" scope="col">Request Date</th>'+
                    '<th class="th-sm" scope="col">Campaign</th>'+
                    '<th class="th-sm" scope="col">Due Date</th>'+
                    '<th class="th-sm" scope="col">Production Stage</th>'+
                    '<th class="th-sm" scope="col">Production Status</th>'+
                    '<th class="th-sm" scope="col">Request Status</th>'+
                    '<th class="th-sm noExport" scope="col">Status</th>'+
                    '<th class="th-sm" scope="col">Production Notes</th>'+
                    '<th class="th-sm" scope="col">Shared Notes</th>'+
                    '<th class="th-sm noExport" scope="col">Created</th>'+

                  '</tr>'+

                '</thead>'+

                '<tbody >'+

                  requestRows+              

                '</tbody>'+

              '</table>'   

   }else if(requestView == "Closed"){

           if(requestRows == "None"){

          requestRows = '<tr><td  colspan="10">No Records Found</td></tr>';

       }

      returnTableHTML ='<table id="requestSummaryTBL" class="table table-hover table-responsive" cellspacing="0" width="100%">'+

                '<thead>'+

                  '<tr>'+

                  '<th  style="visibility:collapse" class="th-sm noExport" scope="col"><span class="sr-only">View Request Details</span></th>'+
                    '<th class="th-sm" scope="col">Job #</th>'+
                    '<th class="th-lg" scope="col">Project</th>'+
                    '<th class="th-lg noExport" scope="col">Project</th>'+

                    '<th class="th-sm" scope="col">HS#</th>'+

                    '<th class="th-sm" scope="col">Requestor</th>'+

                    '<th class="th-sm" scope="col">SA</th>'+

                    '<th class="th-sm" scope="col">Requested</th>'+

                    '<th class="th-sm" scope="col">Campaign</th>'+

                    '<th class="th-sm" scope="col">Due</th>'+
                    '<th class="th-sm" scope="col">Production Stage</th>'+
                    '<th class="th-sm" scope="col">Production Status</th>'+
                    '<th class="th-sm" scope="col">Request Status</th>'+


                    '<th class="th-sm noExport" scope="col">Status</th>'+

                    '<th class="th-sm noExport" scope="col">Created</th>'+

                  '</tr>'+

                '</thead>'+

                '<tbody >'+

                  requestRows+              

                '</tbody>'+

              '</table>'   

            

          }else if(requestView == "Canceled"){

           if(requestRows == "None"){

          requestRows = '<tr><td  colspan="10">No Records Found</td></tr>';

       }

      returnTableHTML ='<table id="requestSummaryTBL" class="table table-hover table-responsive" cellspacing="0" width="100%">'+

                '<thead>'+

                  '<tr>'+

                  '<th  style="visibility:collapse" class="th-sm noExport" scope="col"><span class="sr-only">View Request Details</span></th>'+
                  '<th class="th-sm" scope="col">Job #</th>'+
                    '<th class="th-lg" scope="col">Project</th>'+


                    '<th class="th-lg noExport" scope="col">Project</th>'+

                    '<th class="th-sm" scope="col">HS#</th>'+

                    '<th class="th-sm" scope="col">Requestor</th>'+

                    '<th class="th-sm" scope="col">SA</th>'+

                    '<th class="th-sm" scope="col">Requested</th>'+

                    '<th class="th-sm" scope="col">Campaign</th>'+

                    '<th class="th-sm" scope="col">Due</th>'+
                    '<th class="th-sm" scope="col">Production Stage</th>'+
                    '<th class="th-sm" scope="col">Production Status</th>'+
                    '<th class="th-sm" scope="col">Request Status</th>'+


                    '<th class="th-sm noExport" scope="col">Status</th>'+

                    '<th class="th-sm noExport" scope="col">Created</th>'+

                  '</tr>'+

                '</thead>'+

                '<tbody >'+

                  requestRows+              

                '</tbody>'+

              '</table>'   

            

     }else if(requestView == "Archive"){

           if(requestRows == "None"){

          requestRows = '<tr><td  colspan="10">No Records Found</td></tr>';

       }

      returnTableHTML ='<table id="requestSummaryTBL" class="table table-hover table-responsive" cellspacing="0" width="100%">'+

                '<thead>'+

                  '<tr>'+

                  '<th  style="visibility:collapse" class="th-sm" scope="col"><span class="sr-only">View Request Details</span></th>'+

                    '<th class="th-lg" scope="col">Project</th>'+

                  //  '<th class="th-sm" scope="col">HS#</th>'+

                    '<th class="th-sm" scope="col">Requestor</th>'+

                  //  '<th class="th-sm" scope="col">SA</th>'+

                    '<th class="th-sm" scope="col">Requested</th>'+

                    '<th class="th-sm" scope="col">Campaign</th>'+

                    //'<th class="th-sm" scope="col">Due</th>'+

                    '<th class="th-sm" scope="col">Status</th>'+

                    '<th class="th-sm" scope="col">Created</th>'+

                  '</tr>'+

                '</thead>'+

                '<tbody >'+

                  requestRows+              

                '</tbody>'+

              '</table>'   

            

    

                    

   }else if(requestView == "Queue"){

           if(requestRows == "None"){

          requestRows = '<tr><td  colspan="10">No Records Foundx</td></tr>';

       }

      returnTableHTML ='<table id="requestSummaryTBL" class="table table-hover table-responsive" cellspacing="0" width="100%">'+

                '<thead>'+

                  '<tr>'+

                  '<th  style="visibility:collapse" class="th-sm noExport" scope="col"><span class="sr-only">View Request Details</span></th>'+

                    '<th class="th-lg" scope="col">Project</th>'+
                    '<th class="th-lg noExport" scope="col">Project</th>'+

                    '<th class="th-sm" scope="col">HS#</th>'+

                    '<th class="th-sm" scope="col">Requestor</th>'+

                    '<th class="th-sm" scope="col">SA</th>'+

                    '<th class="th-sm" scope="col">Requested</th>'+

                    '<th class="th-sm" scope="col">Campaign</th>'+

                    '<th class="th-sm" scope="col">Due</th>'+
                    '<th class="th-sm" scope="col">Request Status</th>'+

                    '<th class="th-sm noExport" scope="col">Status</th>'+

                    '<th class="th-sm noExport" scope="col">Created</th>'+

                  '</tr>'+

                '</thead>'+

                '<tbody >'+

                  requestRows+              

                '</tbody>'+

              '</table>'   

    

                    

   }

 

         

           

   return returnTableHTML;

}

////////////////////////////////////////

/// get Currently Assigned workflows

function getCurrrentlyAssignedWorkflows(selectedRequestedID){

   $('#currentWorkflows-TBody').empty();
   $('.productionWorkflowTasks-TBody').empty();
   var activeWorkflowRow ='';

   var productionWorkflowRow ='';
   var hasApprovalTasks = "Yes";
   ///empty approval Workflow List
   $('#approvalWFList').empty();
   

      var  Query ='<Query><OrderBy><FieldRef Name="Created_x0020_Date" Ascending="False"/></OrderBy><Where><Eq><FieldRef Name="Request_x003a_ID"/><Value Type="Counter">'+selectedRequestedID+'</Value></Eq></Where></Query>'

                        $().SPServices({

                                 operation: "GetListItems",

                                 async: false,

                                 listName: "Workflows Active",                                  

                                       CAMLViewFields: "<ViewFields>" +

                                                        "<FieldRef Name='ID'/>"+

                                                        "<FieldRef Name='Title'/>"+ 

                                                        "<FieldRef Name='Request_x003a_ID'/>"+ 

                                                        "<FieldRef Name='WorkflowStatus'/>"+ 

                                                        "<FieldRef Name='LastMod'/>"+
                                                        
                                                        "<FieldRef Name='TaskDetails'/>"+
                                                        
                                                        "<FieldRef Name='ProductionTask'/>"+
                                                        "<FieldRef Name='InitTask'/>"+

                                                        
                                                        "<FieldRef Name='Product'/>"+
                                                        "<FieldRef Name='Editor'/>"+ 
                                                        "<FieldRef Name='Status'/>"+ 
                                                         

                                                           "</ViewFields>",                             

                                       CAMLQuery:Query ,

          //CAMLRowLimit: 20,       

                                  completefunc: function (xData, Status) {

                                          $(xData.responseXML).SPFilterNode("z:row").each(function() { 

                                             var found_WorkflowID = $(this).attr("ows_ID"); 

                                             var found_WorkflowTitle = $(this).attr("ows_Title");

                                             var found_WorkflowStatus = $(this).attr("ows_WorkflowStatus");
                                             var found_WorkflowStatusIcon ="";
                                             
                                              var found_WorkflowProduct = $(this).attr("ows_Product");
                                              var found_WorkflowProductID = "";
                                           
                                                  if(found_WorkflowProduct != undefined){
                                                     found_WorkflowProductID = found_WorkflowProduct.substring(0,found_WorkflowProduct.indexOf(';'));
                                                     found_WorkflowProduct = '<a style="color:rgb(59, 89, 152)" href="javascript:goToProduct('+"'"+found_WorkflowProductID+"'"+')">'+found_WorkflowProduct.substring(found_WorkflowProduct.indexOf('#')+1)+'</a>';
                                                     
                                                  }else{
                                                    found_WorkflowProduct ="";
                                                  }

                                             
                                             var productionTaskComplete= "";
                                             var taskClass = "";
                 
                                             var statusJSON = "";
                                                  if($(this).attr("ows_Status") != undefined && $(this).attr("ows_Status") !=""){                                                  
                                                    statusJSON = JSON.parse($(this).attr("ows_Status"));                                                  
                                                  
                                                  }
                                             
                                             var found_WorkflowAssignedTo ="";
                                                 if($(this).attr("ows_TaskDetails") != undefined && $(this).attr("ows_TaskDetails") !=""){
                                                       var found_WorkflowAssignedUsers = JSON.parse($(this).attr("ows_TaskDetails"));
                                                       $.each(found_WorkflowAssignedUsers.Action.AssignTo, function( index, value ) {
														  found_WorkflowAssignedTo += value+'</br>' ;
														  if(value == curUserTitle){
														  taskClass = "table-primary"
														  }
														});
                                                       
                                                 }
                                            var found_WorkflowEditor =$(this).attr("ows_Editor").substring($(this).attr("ows_Editor").indexOf('#')+1);
      

                                            var isProductionTask = $(this).attr("ows_ProductionTask");
                                             var isApprovalTask = $(this).attr("ows_InitTask");

                                             
                                             var found_WorkflowLastMod = $(this).attr("ows_LastMod");

                                                   if(found_WorkflowLastMod != undefined){

                                                      found_WorkflowLastMod = found_WorkflowLastMod.substring(found_WorkflowLastMod.indexOf('#')+1)

                                                   }

                                          

                                                  if(found_WorkflowStatus== "In Progress"){

                                   bgHEXColor = "#00C851"//"#4285F4"; 

                                   textHEXColor ="#00C851"//"#4285F4";

                                   statusDisplayText = "In Progress";

                                   statusStepCardIcon ="fa fa-refresh fa-spin"

                                   found_WorkflowStatus = '<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i> '+statusDisplayText+'</span>'
                                   found_WorkflowStatusIcon = '<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i></span>'
                           
                           }else if(found_WorkflowStatus == "Complete" ){

                                  bgHEXColor = "slateGray"//"#00C851"; 

                                   textHEXColor ="greenyellow !important";

                                   statusDisplayText = "Complete";

                                   statusStepCardIcon ="fa fa-check";
                                   if(statusJSON.currentStatus.subActionsRejected == 'Complete'){
                                      textHEXColor ="red";
                                      statusStepCardIcon ="fa fa-times";
                                      statusDisplayText = "Rejected"; 
                                   }else if(statusJSON.currentStatus.ApprovalTask == 'Complete'){
                                      statusDisplayText = "Approved";
                                   } 
                                   

                                   found_WorkflowStatus = '<span style="color:'+bgHEXColor+'"><i style="color:'+textHEXColor+'" class="'+statusStepCardIcon+'" aria-hidden="true"></i> '+statusDisplayText+'</span>'

                                   found_WorkflowStatusIcon ='<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i></span>'
                                   productionTaskComplete = found_WorkflowLastMod;
                                   
                                   found_WorkflowAssignedTo = found_WorkflowEditor ;
                                   

                           }else if(found_WorkflowStatus == "Stopped"){

                                   bgHEXColor = "#ff4444";  

                                   textHEXColor ="#ff4444";

                                   statusDisplayText = "Stopped";

                                   statusStepCardIcon ="fa fa-ban";

                                   found_WorkflowStatus = '<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i> '+statusDisplayText+'</span>'
                                   found_WorkflowStatusIcon ='<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i></span>'

                                   productionTaskComplete = found_WorkflowLastMod;
                                    found_WorkflowAssignedTo = found_WorkflowEditor ;
                                   //isProductionTask = "No"

          

                           }else if( found_WorkflowStatus == "On Hold"){

                                   bgHEXColor = "#ffbb33";  

                                   textHEXColor ="#ffbb33";

                                   statusDisplayText = "On Hold";

                                   statusStepCardIcon ="fa fa-pause-circle-o";

                                   found_WorkflowStatus = '<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i> '+statusDisplayText+'</span>'
                                   found_WorkflowStatusIcon ='<span style="color:'+textHEXColor+'"><i class="'+statusStepCardIcon+'" aria-hidden="true"></i></span>'

                           }  

                                             var found_WorkflowHref = 'WorkflowWizard.aspx?request='+selectedRequestedID+'&activeWF='+found_WorkflowID;

                                             

                                                     

                                             activeWorkflowRow += '<tr>'+

                           '<th scope="row">'+found_WorkflowID+'</th>'+

                           '<td><b><a class="a-link" style="color:#0275d8" target="_blank" href="'+found_WorkflowHref+'"><b>'+found_WorkflowTitle+'</b></a></b></td>'+

                           '<td>'+found_WorkflowLastMod+'</td>'+
                           

                           '<td>'+found_WorkflowStatus+'</td>'+

                         '</tr>'
                         
                         if(isProductionTask == "Yes" ){
                         

                                productionWorkflowRow  += '<tr class="'+taskClass +'">'+

                           '<th scope="row"><a class="a-link" style="color:#0275d8" target="_blank" href="'+found_WorkflowHref+'"><b>'+found_WorkflowTitle+'</b></a></th >'+
                           
                           '<td>'+found_WorkflowAssignedTo+'</td>'+
                           
                           '<td>'+found_WorkflowProduct+'</td>'+

                           '<td>'+found_WorkflowStatus+'</td>'+
                           
                            '<td>'+productionTaskComplete+'</td>'+
                            '<td></td>'+
                            

                         '</tr>'};
                         
                         if(isApprovalTask == "Yes" ){
                             $('#approvalWFList').append(
                              '<a role="button" style="color:#495057!important"  href="'+found_WorkflowHref+'" target="_blank" class="list-group-item init-approval-task list-group-item-action">'+found_WorkflowStatusIcon+' '+found_WorkflowTitle+'</a>'
                             )
                         
                         };
 

                                             

                                          })

                                       }

                                    })  

   if(hasApprovalTasks == "Yes"){
       $('#approvalWFList').append(
                             '<label role="button" style="color:#495057!important" for="prod-SA_TopSpan_EditorInput" class="list-group-item list-group-item-action"><span style="color:#00C851"><i class="fa fa-refresh fa-spin" aria-hidden="true"></i></span> Assign a Service Advisor</label>'+
                             '<li role="button" style="color:#495057!important"   class="list-group-item "><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> Generate new Job# (System generated when SA is assigned)</li>'
                             )
      ///set request ID on saveSA-BTN
    $('#saveSA-BTN').attr('selectedRequest',selectedRequestedID)

   }

    if(activeWorkflowRow !=""){

     $('#currentWorkflows-TableWrap').show();

     }
     if(activeWorkflowRow == "" ){
    activeWorkflowRow ='<tr>'+
					           '<td style="text-align:center" colspan="5">No Workflows Found</td>'+
					           '</tr>';
    }
    if(productionWorkflowRow == ""){
    productionWorkflowRow ='<tr>'+
					           '<td style="text-align:center" colspan="5">No Tasks Found</td>'+
					           '</tr>';
    }

    $('#currentWorkflows-TBody').append(activeWorkflowRow);  
    $('.productionWorkflowTasks-TBody').append(productionWorkflowRow ); 
    resetTaskConfigurationForm();
    
    

}

////////////////////////////////////////////////
function completeAllApprovalTasks(){
      var approvalSelectedRequest_ID = $('#saveSA-BTN').attr('selectedRequest');
      var systemDate = new Date();
      var systemDateMonth  =  String(systemDate.getMonth() + 1).padStart(2, '0'); //January is 0!
      var systemDateDay  = String(systemDate.getDate()).padStart(2, '0');
      var systemDateYear = systemDate.getFullYear();
      var taskSaveDate = systemDateMonth  +'/'+systemDateDay +'/'+systemDateYear;
      var systemTimeHour  = systemDate.getHours();
      var systemTimeMinutes  = systemDate.getMinutes();
      var systemTimeam_pm = systemDate.getHours() >= 12 ? "pm" : "am";
      var systemTime = systemTimeHour+':'+systemTimeMinutes+systemTimeam_pm  ;
      /////Update Workflows Active 
      var statusJSON = '{"currentStatus":{"Steps":["Complete"],"Actions":["Complete"],"subActionsApproved":["Complete"],"subActionsRejected":["Canceled"]}}'
      var taskDetailsJSON = '{"Action":{"Date":["'+taskSaveDate +'"],"Time":["'+systemTime+'"],"AssignTo":["'+curUserAccount +'"],"Comment":[""]},"ApprovalTask":{"Date":["'+taskSaveDate +'"],"Time":["'+systemTime +'"],"AssignTo":["'+curUserAccount+'"]},"RejectTask":{"Date":["Canceled"],"Time":[""],"AssignTo":["'+curUserAccount +'"]}}';
      var  Query ='<Query><Where><And><Neq><FieldRef Name="WorkflowStatus"/><Value Type="Text">Complete</Value></Neq><Eq><FieldRef Name="Request_x003a_ID"/><Value Type="Counter">'+approvalSelectedRequest_ID+'</Value></Eq></And></Where></Query>';
     // Query ='<Query><Where><And><Eq><FieldRef Name="WorkflowStatus"/><Value Type="Text">Complete</Value></Eq><Eq><FieldRef Name="Request_x003a_ID"/><Value Type="Counter">'+approvalSelectedRequest_ID+'</Value></Eq></And></Where></Query>'
            $().SPServices.SPUpdateMultipleListItems({
				  listName: "Workflows Active",
				  CAMLQuery: Query ,
				  valuepairs: [["WorkflowStatus", "Complete"],
				               ["Status",statusJSON ],
				               ["TaskDetails",taskDetailsJSON ]
				                ],
				  completefunc: function(xData, Status) {
				      generateReqIDNumber('Job');
				      pushTOProd();
				  }
				});
     
   
 
}
////////////////////////////
//Production Push
function pushTOProd(){
 $('#RequestStatusInput').val('Production Approved');
 saveStatusUpdates();
};
////////////////////////////
///get production Notes

function getProdNotes(SpList){



      

        ///empty notes

        var NoteWrap = "";

        if(SpList == "Production Notes"){

            NoteWrap = '#ProdNotes-Wrap';

        }else if(SpList == "Shared Notes"){

            NoteWrap = '#SharedNotes-Wrap';

        }

        $(NoteWrap).empty();

        var AllNotesHtml = '';

        var noteLayout = "";  

        var hasNotes = "No"       

        

   var  Query ='<Query><OrderBy><FieldRef Name="Created" Ascending="False"/></OrderBy><Where><Eq><FieldRef Name="RequestID"/><Value Type="Text">'+userSelectedRequest+'</Value></Eq></Where></Query>'

                        $().SPServices({

                                 operation: "GetListItems",

                                 async: false,

                                 listName: SpList,                                  

                                       CAMLViewFields: "<ViewFields>" +

                                                        "<FieldRef Name='ID'/>"+

                                                        "<FieldRef Name='Title'/>"+ 

                                                        "<FieldRef Name='Author'/>"+ 

                                                        "<FieldRef Name='Note'/>"+

                                                        "<FieldRef Name='User'/>"+

                                                        "<FieldRef Name='CreatedDisplay'/>"+

                                                        "<FieldRef Name='Created'/>"+
                                                        "<FieldRef Name='CreatedDisplayDate'/>"+
                                                        "<FieldRef Name='RequestID'/>"+

                                                           "</ViewFields>",                             

                                      CAMLQuery:Query ,

          //CAMLRowLimit: 20,       

                                  completefunc: function (xData, Status) {

                                          $(xData.responseXML).SPFilterNode("z:row").each(function() { 

                                          hasNotes = "Yes"  

                                          var NoteEntryID = $(this).attr("ows_ID"); 

                                          var NoteEntryAuthor= $(this).attr("ows_Author").substring( $(this).attr("ows_Author").indexOf('#')+1);

                                          var NoteEntryAuthorEmail= $(this).attr("ows_User"); 

                                          var NoteEntryDate = $(this).attr("ows_CreatedDisplay").substring( $(this).attr("ows_CreatedDisplay").indexOf('#')+1);
                                          var NoteEntryDateOnly = $(this).attr("ows_CreatedDisplayDate").substring( $(this).attr("ows_CreatedDisplayDate").indexOf('#')+1);

                                          var NoteEntryMessage = $(this).attr("ows_Note"); if(NoteEntryMessage  == undefined){NoteEntryMessage = ""};
                                                  // Decode HTML in NoteEntryMessage //
                                              NoteEntryMessage = decodeHtml(NoteEntryMessage);

                                          var UserPic ="/_vti_bin/DelveApi.ashx/people/profileimage?size=L&amp;userId="+NoteEntryAuthorEmail                                    

                                          var UserDelveLink = "/_layouts/15/me.aspx/?p="+NoteEntryAuthorEmail

                                          var deleteAction ="deleteNote('"+SpList+"','"+NoteEntryID+"')"

                                          var NoteHtml ="";

                                          var NoteAuthorPicHTML = '<a href="'+UserDelveLink+'" target="_blank" ><img src="'+UserPic+'" alt="avatar" class="avatar rounded-circle mr-2 ml-lg-3 ml-0 z-depth-1"></a>'

                                          var NoteCardHTML =  '<div class="chat-body white p-3 ml-2">'+

                                   '<div class="header">'+

                                     '<strong class="primary-font"><a href="'+UserDelveLink+'" target="_blank" >'+NoteEntryAuthor+'</a></strong>'+

                                     '<small class="pull-right text-muted"> <i class="far fa-clock"></i> '+

                  NoteEntryDate+'</small>'+

                                   '</div>'+

                                   //'<hr style=" margin-bottom: 5px;margin-top: 5px"  class="w-100">'+

                                   '<p class="mb-0 noteMessage">'+
                                   		'<span class="noteDate" style="display:none">'+NoteEntryDateOnly+': </span>'+
                                      NoteEntryMessage+

                                  ' </p>'+

                                  '<button class="btn btn-primary postNewNote-Option-btn btn-sm float-right dropdown-toggle mr-4" type="button" data-toggle="dropdown"'+

                      'aria-haspopup="true" aria-expanded="false"><strong>Options</strong></button>'+                    

                    '<div class="dropdown-menu">'+

                      '<a class="dropdown-item" style="color:red" href="javascript:'+deleteAction+'">Delete Note</a>'+

                    // ' <a class="dropdown-item" href="#">Another action</a>'+

                      //'<a class="dropdown-item" href="#">Something else here</a>'+

                     // '<div class="dropdown-divider"></div>'+

                      //'<a class="dropdown-item" href="#">Separated link</a>'+

                    '</div>'+

                             // '<button type="button" class="btn btn-sm btn-flat float-right" onclick="'+deleteAction+'" style="color:red!important;padding:0px"><b>Delete</b></button>'+

                                 '</div>'

                                             ///adjust note Direction

                                             //noteLayout = "Right"

                                               if(noteLayout == "" || noteLayout == "Right"){

                                                   noteLayout  = "Left";

                                                    NoteHtml = '<li class="d-flex justify-content-between mb-4">'+

                                NoteAuthorPicHTML+

                                NoteCardHTML+ 

                                '</li>'

                                               }else{

                                                  noteLayout  = "Right"; 

                                                  NoteHtml = '<li class="d-flex justify-content-between mb-4">'+

                                                      NoteCardHTML+ 

                                NoteAuthorPicHTML+

                                '</li>'

                                              

                                               }

 

                                              var found_WorkflowID = $(this).attr("ows_Author"); 

                                    

                                        AllNotesHtml += NoteHtml 

 

                                         })

                                       }

                                    })  

          ///// Add Notes 

          if(hasNotes == "Yes" ){

            $(NoteWrap).html(AllNotesHtml )

          }else{

             $(NoteWrap).html('<div style="font-size:24px"><b>No Notes Posted</b></div>')

          }

         

         

         

         

}    

///////////////////////////////////////////////

////Post new Note

function postNewNote(spList,noteInput){

   //
    var noteArray =  getNotesArray(spList);///Previous stuff without the new you just wrote
 
    var newNoteText = $(noteInput).val()
      
    // Encode HTML in the newNoteText variable
        newNoteText = encodeHtml(newNoteText);

    
  
    var newNoteText = $(noteInput).val();
      

   
        
     var SavePairs = [["Title","Note by " ],

                      ["Note",newNoteText],

                      ["RequestID",userSelectedRequest ],

                      ["User",curUserEmail],

                         ]

      /////////////////Sp Service Save

              $().SPServices({

      operation: "UpdateListItems",

      listName: spList,

      batchCmd: "New" ,

      valuepairs: SavePairs,

      completefunc: function(xData, Status) {

        if(Status =='success'){

             ///reset Input
            var createdDate = $(xData.responseXML).SPFilterNode("z:row").attr("ows_CreatedDisplayDate");
                createdDate = createdDate.substring(createdDate.indexOf('#')+1);

            $(noteInput).val('');
            //update Shared or Production List
            newNoteText = encodeHtml(newNoteText.trim());
            //Update already with the encode html on custom js//
            //newNoteText = newNoteText.replace(/,/g,'!#comma#!')//
            noteArray.unshift(createdDate+': '+newNoteText);
            	if(spList == "Shared Notes"){
            	  updateSharedNotes_RequestList(userSelectedRequest,noteArray )
            	}else if(spList == "Production Notes"){
            	  updateProductionNotes_RequestList(userSelectedRequest,noteArray )
            	}

            //refresh

            getProdNotes(spList);

             newToast('success','Saved!','The '+spList+' item has been saved.')

        }else{

        

                     newToast('error','Save Error!','Something went wrong please contact a SharePoint Developer.')   

        }

      

      }

     }) 

}

    //////////////////////////////////////////////////////////

    ////delet Note

function deleteNote(spList,itemToDelete){
       
    $().SPServices({

  operation:"UpdateListItems",

  async: false,

  batchCmd: "Delete",

  listName: spList,

  ID: itemToDelete,

  completefunc:function(xData, Status){

    if(Status == 'success'){

       //refresh

     getProdNotes(spList);
      var noteArray =  getNotesArray(spList);
      if(spList == "Shared Notes"){
    	  updateSharedNotes_RequestList(userSelectedRequest,noteArray )
    	}else if(spList == "Production Notes"){
    	  updateProductionNotes_RequestList(userSelectedRequest,noteArray )
    	}


              newToast('error','Deleted!','The '+spList+' item has been deleted.') 

    }else{

      newToast('error','Save Error!','Something went wrong please contact a SharePoint Developer.') 

    }

  }

   })

  

  

  }

//////////////////////////////////////////////\

///check if folder is available

function checkFolder(folderName,queryList){

  var FolderQuery = '<Query><OrderBy><FieldRef Name="Created" Ascending="False" /></OrderBy></Query>'

    var FolderPresent = "No"

    ////////////////SPServices Get List Items

                               $().SPServices({

            operation: "GetListItems",

            async: false,

            listName: queryList,

            CAMLViewFields: "<ViewFields><FieldRef Name='ID' /><FieldRef Name='FileLeafRef' /><FieldRef Name='FSObjType' /></ViewFields>",

            CAMLQuery:FolderQuery,

            completefunc: function (xData, Status) {

              $(xData.responseXML).SPFilterNode("z:row").each(function() {

              /////////////////////////////////////////////////// c

                 var itemName =  $(this).attr("ows_FileLeafRef").substring($(this).attr("ows_FileLeafRef").indexOf('#')+1);

                 var fileType =  $(this).attr("ows_FSObjType").substring($(this).attr("ows_FSObjType").indexOf('#')+1);

                             ///set Folder Status

                                if(itemName  == folderName && fileType  == "1"){

                                    FolderPresent  = "Yes";

                                }         

              ////////////////////////////////////////////////                                                                                   

                                                });

                          

                          

                     }

               });

                                         ////////////////SPServices Get List Items

 
 
                    /////create missing folder

                if(FolderPresent == "No" && userSelectedStatus == "Production Approved"){

                           var newFolderName =folderName

                                                     /////Create Folder 

                     $().SPServices({

                         operation: "UpdateListItems",

                         async: false,

                         listName: queryList,

                         batchCmd: "New",                

                            updates: "<Batch OnError='Continue' PreCalc='TRUE' ListVersion='0' >" +

                                   "<Method ID='1' Cmd='New'>" +

                                   "<Field Name='FSObjType'>1</Field>" +

                                   "<Field Name='BaseName'>"+newFolderName+"</Field>" +

                                   "</Method>" +

                                    "</Batch>",

                                     completefunc: function(xData, Status) {

                                        /////get returned new ID

                 var newFolderID = $(xData.responseXML).SPFilterNode("z:row").attr("ows_ID");

                                           if(Status == 'success'){

                                           
                FolderPresent = "Yes" 
                newToast('success','Production Folder Created!', 'A new folder has been created to upload Production Documents')   

                                       

                                             

                                          }else{

                                         newToast('error','Error creating your Folder', 'There was an error while creating the new folder to upload Production Documents')   

  

                                          

                                          }

                                                            //////////////////////////////                     

        

                                                    }

        

                                   });

               /////////////////////////////////////////////////////////

 

                    

                    }

                      //////////////////////////////////                       

                                         

                                         

                                         

                                         

   

      return FolderPresent;

 

}

////////////////////Get Request documents

function getRequestDocuments(queryList){ 

/////empty table body

   $('#currentProductionDocs-TBody').empty()

     var RequestFolder ="";

       var uploadBtnID = "";

       var uploadReturn =""; 

       if(queryList == "Production Documents"){

                   RequestFolder ="Request"+userSelectedRequest +"ProductionDocuments";

                   uploadBtnID = "#ProductionDocumentsUpload-Btn";

                   uploadReturn = '#currentProductionDocs-TBody';

               };

     var  DocumentQuery = '<Query><Where><Contains><FieldRef Name="FileDirRef"/><Value Type="Text">'+RequestFolder+'</Value></Contains></Where><OrderBy><FieldRef Name="Created" Ascending="False" /></OrderBy></Query>'

       var tableRow ='None' 

             

                ///set upload button's folder attrubute to none

                
                   

                     var hasFolder =  checkFolder(RequestFolder,queryList);
                      

                       if(hasFolder ==  "Yes"){

                              ///update attachment buttons

          $(uploadBtnID).attr('uploadFolder',RequestFolder);

       $(uploadBtnID).attr('foldercreated','Yes');

                   

              //  Production Documents

    ////////////////SPServices Get List Items

                               $().SPServices({

            operation: "GetListItems",

            async: false,

            listName: queryList,

            CAMLViewFields: "<ViewFields><FieldRef Name='ID' /><FieldRef Name='LastMod' /><FieldRef Name='FileDirRef' /><FieldRef Name='Created' /><FieldRef Name='_SourceUrl' /><FieldRef Name='_SourceUrl' /><FieldRef Name='FileLeafRef' /><FieldRef Name='ID' /><FieldRef Name='Author' /><FieldRef Name='FileDirRef' /><FieldRef Name='DocIcon' /><FieldRef Name='FileRef' /></ViewFields>",

            CAMLQuery:DocumentQuery ,

            CAMLQueryOptions: '<QueryOptions><ViewAttributes Scope="Recursive"/></QueryOptions>',

            completefunc: function (xData, Status) {

              $(xData.responseXML).SPFilterNode("z:row").each(function() {

              //remove placeholder

             // $('.Document-placeholderRow').remove();

             

              var Document_ID = $(this).attr("ows_ID");

              var DocumentAuthor = $(this).attr("ows_Author").substring( $(this).attr("ows_Author").indexOf('#')+1);

              var Document_Name =$(this).attr("ows_FileLeafRef").substring( $(this).attr("ows_FileLeafRef").indexOf('#')+1);

              var Document_URL = window.location.protocol + "//" + window.location.host + "/" + $(this).attr("ows_FileDirRef").substring($(this).attr("ows_FileDirRef").indexOf('#')+1)+"/"+Document_Name;

              var DocumentLink = $(this).attr("ows_FileRef").substring( $(this).attr("ows_FileRef").indexOf('#')+1);

              var LastModifiedDate = $(this).attr("ows_LastMod").substring( $(this).attr("ows_LastMod").indexOf('#')+1);

              var Document_Deletefunc ="'"+$(this).attr("ows_ID")+"'"+","+"'"+DocumentLink+"'"+","+"'"+queryList+"'";

                                       

          

 

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

                                          }

                                          ////////////////////////////////////////////////

                                          ///set Table row

                                         tableRow ='<tr>'+

                    

                   '<th  scope="row"><a  class="ReLink" href="'+ Document_URL+'"><i class="fa '+docicon+'" aria-hidden="true"></i> <b>'+Document_Name+'</b></a></th>'+

                   '<td>'+LastModifiedDate +'</td>'+

                   '<td>'+DocumentAuthor+'</td>'+

                   '<td style="padding:2px!important;padding-top:4px!important"><a class="btn-sm btn-danger btn-floating" onclick="deleteAttachedDocument('+Document_Deletefunc+');" ><i class="fa fa-times"></i></a></td>'+

                ' </tr>'

                

          ///append to table

               $(uploadReturn).append(tableRow)      

                                          

                                          ////////////////////////////////////////////////

                                                                                    

                                                });

                          

                          

                     }

               });

                                         ////////////////SPServices Get List Items

                          }else{
                          
                            ///hide attach a file button
                             $('#ProductionDocumentsUpload-Btn').hide();
                          
                          }

                          

                           if(tableRow  == "None"){

                                 tableRow ='<tr>'+

              '<th  scope="row" colspan="4"><b>No Documents Found</b></th>'+

              ' </tr>' 

                                      

          ///append to table

               $(uploadReturn ).append(tableRow)

                       

                               }

}

/////////////////////////////////////////////////////////////////////////////

////delete Products and Services attachments

   function deleteAttachedDocument(docid,docname,doclib){

       var DocumentName = docname.substring(docname.lastIndexOf('/')+1) 

                       $().SPServices({

                                                      operation: "UpdateListItems",

                                                      listName: doclib,

                                                      updates: "<Batch OnError='Continue'><Method ID='1' Cmd='Delete'><Field Name='ID'>"+docid+"</Field><Field Name='FileRef'>"+docname+"</Field></Method></Batch>",

                                                          completefunc: function(xData, Status) {

                                                          

                                                             if(Status == 'success'){

                                       //successfullDelete('Document');

                                     getRequestDocuments(doclib);

                                         newToast('error','Document has been Deleted!', DocumentName+' has been deleted.')   

                                     

                          }else{

                         //  errorDelete('Document')

                           newToast('error','There has been an error deleting the Document!','there was an error while deleting '+docname+'.')   

 

                          }

 

 

                                                          }

                                                });

 

   

   }

///////////////////////////////////////////////////////////////////////////////

//set upload modal 

  function newAttachmentUploadler(libName,FldrRetun,uploadBtn){

  var attachmentfolderStatus = $('#'+uploadBtn).attr('foldercreated')

      ///set correct folder name

       var FldrName = $('#'+uploadBtn).attr('uploadFolder')

  

        ///remove modal for reset

         ///$('#fileUploaderModal').remove();

    

      $('Body').append('<iframe   style="border:0px;margin:auto" width="100%" height="220px" id="UploaderIframe" src="../SiteAssets/UploadIframe.aspx?libraryname='+libName+'&fname='+FldrName+'&target='+libName+'"></iframe>')

      ////show upload modal

  //$('#fileUploaderModal').modal('show') ;

     

    

    

    

    

 }

//////////////////////////////////////////////////////////// 

function closeProductModalUploader(retrunLibrary){

        ////close upload modal

               $('#UploaderIframe').remove()

 

}

function UploadProductSucessful(retrunLibrary){

     /// refresh products and services Table

   getRequestDocuments(retrunLibrary);

   //// close Products Modal

   closeProductModalUploader();

   newToast('success','New Document Uploaded!','Your new document was uploaded successfully')   

 

}

////////////////////////////////////////////////////////////////////

function setRequestDetails(){
        
           var requestValue_Products ="";

         var QueryListName = "Requests";

       var Query ='<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+userSelectedRequest+'</Value></Eq></Where></Query>';
       
       requestProdPOCList ="";

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
      '<FieldRef Name="Production_x0020_Stage"/>'+
      '<FieldRef Name="Production_x0020_Status"/>'+
      '<FieldRef Name="StatusDate"/>'+ 
      '<FieldRef Name="ProductionContacts"/>'+   
      '<FieldRef Name="statusLog"/>'+   

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
                                           
                                              if(requestValue_Description != undefined){ 
                                                 $('.requestDesc-Display').html(requestValue_Description)
                                              }else{
                                                 $('.requestDesc-Display').html('') ;
                                              }
                                           
                                           var requestValue_StatusDate =  $(this).attr("ows_StatusDate");
                                           
                                              var requestValue_JobNo =  $(this).attr("ows_Job_x0020_Number");
                                               $('#reuestJobNo_Disp').html('')
                                               if(requestValue_JobNo != "" && requestValue_JobNo != undefined){
                                                  $('#reuestJobNo_Disp').html('Job# '+requestValue_JobNo )
                                               };
                                           var requestValue_Campaign =  $(this).attr("ows_Campaign");

                                               if(requestValue_Campaign != undefined){requestValue_Campaign = requestValue_Campaign.substring(requestValue_Campaign.indexOf('#')+1)}
 
                                           var requestValue_Requestor =  $(this).attr("ows_Requestor").substring($(this).attr("ows_Requestor").indexOf('#')+1);

             var requestValue_RoutingCode =  $(this).attr("ows_Routing_x0020_Code");
              

                 if(requestValue_RoutingCode != undefined){requestValue_RoutingCode = requestValue_RoutingCode.substring(requestValue_RoutingCode.indexOf('#')+1)}

             var requestValue_PhoneNumber =  $(this).attr("ows_Phone_x0020_Number");

             var requestValue_OfficeNumber =  $(this).attr("ows_Office_x0020_Room_x0020_Number");
                  
             var requestValue_Status = $(this).attr("ows_Status");
                 if(requestValue_Status != "Draft"){
                     $('#RequestStatusInput').val(requestValue_Status).change();
                 }else{
                       $('#RequestStatusInput').val("").change();

                 }
                 
    

             var requestValue_ProdStage = $(this).attr("ows_Production_x0020_Stage");
             if(requestValue_ProdStage != undefined){
                requestValue_ProdStage = requestValue_ProdStage.substring(0,requestValue_ProdStage.indexOf('#')-1); 
                $('#ProductionStageInput').val(requestValue_ProdStage).change();
             
                  }else{
                requestValue_ProdStage = "";   
               };
                    
             var requestValue_ProdStatus = $(this).attr("ows_Production_x0020_Status");
              if(requestValue_ProdStatus != undefined && requestValue_ProdStatus != ""){
                requestValue_ProdStatus = requestValue_ProdStatus.substring(0,requestValue_ProdStatus.indexOf('#')-1);
                  $('#PublicationStatusInput').val(requestValue_ProdStatus).change();
                  
                  }else{
                requestValue_ProdStatus = "";   
               }
                ///update Status Details
            
              
               // 
                 //return;         
             requestValue_Products =  $(this).attr("ows_Product_x0020_Details");
           
             
             var requestValue_OD =  $(this).attr("ows_Office_x0020_Director_x0028_OD_x");

             var requestValue_AA =  $(this).attr("ows_Associate_x0020_Administrator_x0");

             var pocJSON =  $(this).attr("ows_POCs");

             var requestValue_DueDate =  $(this).attr("ows_Due_x0020_Date");

             var requestValue_DueDateDefault = "";
            
                            
                 if(requestValue_DueDate != undefined && requestValue_DueDate != ""){

                   requestValue_DueDateDefault = convertDatePickerValue(requestValue_DueDate,"Default");
                     
		                   if(requestValue_Status == "Complete" || requestValue_Status == "Canceled" || requestValue_Status == "Closed"  || requestValue_Status == "Rejected"){
		                   resetDueDateClock(requestValue_StatusDate,false,requestValue_Status);
		                   }else{
		                    resetDueDateClock(requestValue_DueDate,true,requestValue_Status);
		                   }

                 }else{
                   resetDueDateClock(requestValue_DueDate);
                   requestValue_DueDate = "No Due Date"; 

                 }

             var requestValue_Rush =  $(this).attr("ows_Rush");

             var requestValue_RushReason =  $(this).attr("ows_Rush_x0020_Reason");
                     
             var pocLI =""
                      
                 if(pocJSON != undefined && pocJSON != ""  ){ 

              var newRequesterJSON = JSON.parse("["+pocJSON+"]");
                  
              //alert(newRequesterJSON[0].Name)
             
              $.each( newRequesterJSON , function( index, value ) {

                ///set POC data

                var pocName = value.Name; 

                var pocRole = value.Role;

                if(pocRole == 'CC'){

                   pocRole ="Contract Coordinator(CC)"

                }else if(pocRole == 'OD'){

                   pocRole ="Office Director(OD)"

                }else if(pocRole == 'DC'){

                   pocRole ="Division Chief(DC)"                

                }else if(pocRole == 'PM'){

                   pocRole ="Project Manager"

                }else if(pocRole == 'COR'){

                   pocRole ="Contract Office Representative(COR)"

                }else if(pocRole == 'AA'){

                   pocRole ="Associate Administrator(AA)"

                }

                ///set 

              

                 pocLI+='<li class="list-group-item"><b style="font-weight:bold!important">'+pocRole +': </b>'+pocName +'</li>'

                

             }) ;

             }     
                    
 

                                            /////set Request Details and POCS

                                            $('#accordionDetails > .card').empty().append(

                                                    ///Details                                                    

                       '<!-- Card header -->'+

                       '<div class="card-header" role="tab" id="DetailsSection-Header">'+

                         '<a class="collapsed"  data-toggle="collapse" data-parent="#accordionDetails" href="#DetailsSection" aria-expanded="false"'+

                           'aria-controls="DetailsSection">'+

                           '<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">'+

                            'Details <i class="fas fa-angle-down rotate-icon"></i>'+

                           '</h3>'+

                         '</a>'+

                       '</div>'+

           

                       '<!-- Card body -->'+

                       '<div id="DetailsSection" class="collapse " role="tabpanel" aria-labelledby="DetailsSection-Header" data-parent="#accordionDetails">'+

                         '<div style="padding-top:0px" class="card-body">'+

                            '<ul class="list-group list-group-flush">'+

                       //'<li class="list-group-item"><b style="font-weight:bold!important">HS#: </b></li>'+
                        '<li class="list-group-item"><b style="font-weight:bold!important">Title: </b>'+requestValue_Title +'</li>'+
                       '<li class="list-group-item"><b style="font-weight:bold!important">Description: </b>'+requestValue_Description+'</li>'+
                       '<li class="list-group-item"><b style="font-weight:bold!important">Campaign: </b>'+requestValue_Campaign+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Requestor: </b>'+requestValue_Requestor +'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Routing Code: </b>'+requestValue_RoutingCode+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Phone Number: </b>'+requestValue_PhoneNumber+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Office Room Number: </b>'+requestValue_OfficeNumber+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Due Date: </b>'+requestValue_DueDate+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Rush Justification: </b>'+requestValue_RushReason +'</li>'+

           

                     '</ul>'+

                                   '</div>'+

                       '</div>'+

                       ///////POCs

                        '<!-- Card header -->'+

                        '<div class="card-header" role="tab" id="POCSection-Header">'+

                          '<a class="collapsed" data-toggle="collapse" data-parent="#accordionDetails" href="#POCSection" aria-expanded="false"'+

                           ' aria-controls="POCSection">'+

                            '<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">'+

                             'Contacts <i class="fas fa-angle-down rotate-icon"></i>'+

                            '</h3>'+

                         ' </a>'+

                        '</div>'+

            

                        '<!-- Card body -->'+

                        '<div id="POCSection" class="collapse" role="tabpanel" aria-labelledby="POCSection-Header" data-parent="#accordionDetails">'+

                          '<div style="padding-top:0px" class="card-body">'+

                            '<ul class="list-group list-group-flush">'+

                           '<li class="list-group-item"><b style="font-weight:bold!important">Primary Associate Administrator(AA): </b>'+requestValue_AA+'</li>'+

                                                                 '<li class="list-group-item"><b style="font-weight:bold!important">Primary Office Director(OD): </b>'+requestValue_OD +'</li>'+

                                                                 pocLI+

            

                      '</ul>'+

                                    '</div>'+

                        '</div>'+
                        
                        ///////Log

                        '<!-- Card header -->'+

                        '<div class="card-header" role="tab" id="StatusSection-Header">'+

                          '<a class="collapsed" data-toggle="collapse" data-parent="#accordionDetails" href="#StatusSection" aria-expanded="false"'+

                           ' aria-controls="StatusSection">'+

                            '<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">'+

                             'Status Log <i class="fas fa-angle-down rotate-icon"></i>'+

                            '</h3>'+

                         ' </a>'+

                        '</div>'+

            

                        '<!-- Card body -->'+

                        '<div id="StatusSection" class="collapse" role="tabpanel" aria-labelledby="StatusSection-Header" data-parent="#accordionDetails">'+

                          '<div style="padding-top:0px" class="card-body">'+

                            '<ul id="StatusSectionList" class="list-group list-group-flush">'+
 


                      

            
  
                            '</ul>'+

                                    '</div>'+

                        '</div>'


            

                                                          

                                            ) 

                                            /////////////////////////////////////                                             
     
          
     ///////set production Contacts
       
      var prodPOCJSON =  $(this).attr("ows_ProductionContacts"); 
          if(prodPOCJSON != undefined && prodPOCJSON != ""  ){ 
               prodPOCJSON = JSON.parse("["+prodPOCJSON +"]");
               requestProdPOCList = prodPOCJSON ;
               ///set production poc contacts
               getProdContacts();              
                             
             }else{
             requestProdPOCList =[];
                 getProdContacts();
             } 
      ////////////////////////////////////////////////          

           

                                             

                                          })

                                       }

                                    })  ;
//////////////////////////////////////////////////
     if(requestValue_Products != undefined ){
     
             reGenerateProductHTML(requestValue_Products);
     };


}

///////////////////////////////////////////////////////////
function setLegacyDetails(QueryListName, QueryListURL ){
 
 
           var requestValue_Products ="";
       var Query ='<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+userSelectedRequest+'</Value></Eq></Where></Query>';
       requestDataArray =[];
       requestDataPOCs =[];
      


                  

                        $().SPServices({

                                 operation: "GetListItems",

                                 async: false,
 
                                  listName: QueryListName,

                                    webURL: QueryListURL ,                                  

                                       CAMLViewFields:"<ViewFields Properties='True' />",                             

                                       CAMLQuery:Query ,

                 

                                  completefunc: function (xData, Status) { 

                                          $(xData.responseXML).SPFilterNode("z:row").each(function() {  

                                           var requestValue_ID =  $(this).attr("ows_ID");

                                           var requestValue_Title =  $(this).attr("ows_Title");

                                           var requestValue_Description =  $(this).attr("ows_Description");
                                           if(requestValue_Description != undefined){
                                            $('.requestDesc-Display').html(requestValue_Description)
                                           }else{
                                           $('.requestDesc-Display').html('')
                                           }

                                           var requestValue_Campaign =  $(this).attr("ows_Compaign");

                                               if(requestValue_Campaign != undefined){requestValue_Campaign = requestValue_Campaign.substring(requestValue_Campaign.indexOf('#')+1)
                                                 }else{
                                                 requestValue_Campaign ="None"
                                               
                                               }

                                           var requestValue_Requestor =  $(this).attr("ows_Requestor").substring($(this).attr("ows_Requestor").indexOf('#')+1);
                                           
                                           var requestValue_RoutingCode =  $(this).attr("ows_RoutingCode");

                 //if(requestValue_RoutingCode != undefined){requestValue_RoutingCode = requestValue_RoutingCode.substring(requestValue_RoutingCode.indexOf('#')+1)}

             var requestValue_PhoneNumber =  $(this).attr("ows_Phone");

             var requestValue_OfficeNumber =  $(this).attr("ows_Office");
             var requestValue_JobNumber =  $('#Legacy'+requestValue_ID+'-JobNumber').text();
                 if(requestValue_JobNumber != undefined && requestValue_JobNumber != ""){
                     requestValue_JobNumber =  '<li class="list-group-item"><b style="font-weight:bold!important">Job #: </b>'+requestValue_JobNumber+'</li>'

                 }else{
                    requestValue_JobNumber = "";
                 } //
             var requestValue_HSNumber = $(this).attr("ows_JobWF_x003a_HSNumber");;
                 if(requestValue_HSNumber != undefined && requestValue_HSNumber != "" && requestValue_HSNumber != "???"){
                 requestValue_HSNumber = requestValue_HSNumber.substring(requestValue_HSNumber.indexOf('#')+1)
                 requestValue_HSNumber ='<li class="list-group-item"><b style="font-weight:bold!important">HS #: </b>'+requestValue_HSNumber+'</li>'
                 }else{
                 requestValue_HSNumber = "";
                 };
 

             

                          

              requestValue_Products =  ""//$(this).attr("ows_Product_x0020_Details");
    //
             var requestValue_OD = $(this).attr("ows_Supervisor");if(requestValue_OD != undefined){
                 requestValue_OD = requestValue_OD.substring(requestValue_OD.indexOf('#')+1)
                 requestDataPOCs.push('{"Name":"'+requestValue_OD+'","Role":"OD"}');
                   }
               var requestValue_AA =  $(this).attr("ows_Director");if(requestValue_AA != undefined){
                   requestValue_AA = requestValue_AA.substring(requestValue_AA.indexOf('#')+1);                  
                   requestDataPOCs.push('{"Name":"'+requestValue_AA+'","Role":"AA"}');
                   }
             var requestPOCs=  setLegacyPOCs(QueryListURL )//$(this).attr("ows_POCs");

             var requestValue_DueDate = ""// $(this).attr("ows_Due_x0020_Date");
             var requestValue_DateSubmitted = $(this).attr("ows_CreatedCalc").substring( $(this).attr("ows_CreatedCalc").indexOf('#')+1);;
    
             var requestValue_DeliveryDate = $(this).attr("ows_RequireDate")
             var requestValue_DueDateDefault = "";
              
                  if(requestValue_DeliveryDate != undefined && requestValue_DeliveryDate != ""){
                   var requestDate = $(this).attr("ows_RequireDate").substring($(this).attr("ows_RequireDate").lastIndexOf('-')+1,$(this).attr("ows_RequireDate").lastIndexOf('-')+3);
                   var requestMonth = $(this).attr("ows_RequireDate").substring($(this).attr("ows_RequireDate").indexOf('-')+1,$(this).attr("ows_RequireDate").lastIndexOf('-'));
                   var requestYear = $(this).attr("ows_RequireDate").substring(0,$(this).attr("ows_RequireDate").indexOf('-'));
                       requestValue_DeliveryDate = requestMonth+'/'+requestDate+'/'+requestYear  

                  }else{

                   requestValue_DeliveryDate = ""; 

                  }

             var requestValue_Rush =  $(this).attr("ows_Rush");if(requestValue_Rush == "1"){requestValue_Rush = "Yes"+' <br><i>'+ $(this).attr("ows_RushReason")+'</i>'}else{requestValue_Rush  = "No"}

             var requestValue_RushReason =  $(this).attr("ows_RushReason");
             /////set Regeneration Arrays
                     requestDataArray.push(requestValue_Title);  
                     requestDataArray.push('archive;#'+requestValue_Campaign);  
                     requestDataArray.push(requestValue_Description);  
                     requestDataArray.push(requestValue_OD);  
                     requestDataArray.push(requestValue_AA);  
                     requestDataArray.push(requestValue_Rush);  
                     requestDataArray.push(requestValue_RushReason );                                       
                                           
               ////////////////////////////////////////////////////                            
                                          
                                           
                                           
                                           
                                                /////set Request Details and POCS

                                            $('#accordionDetails > .card').empty().append(

                                                    ///Details                                                    

                       '<!-- Card header -->'+

                       '<div class="card-header" role="tab" id="DetailsSection-Header">'+

                         '<a data-toggle="collapse" data-parent="#accordionDetails" href="#DetailsSection" aria-expanded="true"'+

                           'aria-controls="DetailsSection">'+

                           '<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">'+

                            'Details <i class="fas fa-angle-down rotate-icon"></i>'+

                           '</h3>'+

                         '</a>'+

                       '</div>'+

           

                       '<!-- Card body -->'+

                       '<div id="DetailsSection" class="collapse show" role="tabpanel" aria-labelledby="DetailsSection-Header" data-parent="#accordionDetails">'+

                         '<div style="padding-top:0px" class="card-body">'+

                            '<ul class="list-group list-group-flush">'+
                            
                        requestValue_JobNumber+ 

                        requestValue_HSNumber+ 

                       '<li class="list-group-item"><b style="font-weight:bold!important">Campaign: </b>'+requestValue_Campaign+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Requestor: </b>'+requestValue_Requestor +'</li>'+
                       
                       '<li class="list-group-item"><b style="font-weight:bold!important">Date Submitted: </b>'+requestValue_DateSubmitted +'</li>'+
                       
                       '<li class="list-group-item"><b style="font-weight:bold!important">Routing Code: </b>'+requestValue_RoutingCode+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Phone Number: </b>'+requestValue_PhoneNumber+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Office Room Number: </b>'+requestValue_OfficeNumber+'</li>'+

                       '<li class="list-group-item"><b style="font-weight:bold!important">Delivery Date: </b>'+requestValue_DeliveryDate+'</li>'+
                       
                       '<li class="list-group-item"><b style="font-weight:bold!important">Rush Job: </b>'+requestValue_Rush +'</li>'+
  
                         

           

                     '</ul>'+

                                   '</div>'+

                       '</div>'+

                       ///////POCs

                        '<!-- Card header -->'+

                        '<div class="card-header" role="tab" id="POCSection-Header">'+

                          '<a class="collapsed" data-toggle="collapse" data-parent="#accordionDetails" href="#POCSection" aria-expanded="false"'+

                           ' aria-controls="POCSection">'+

                            '<h3  style="font-size:22px;color: rgb(59, 89, 152);font-weight:600!important" class="mb-0">'+

                             'Contacts <i class="fas fa-angle-down rotate-icon"></i>'+

                            '</h3>'+

                         ' </a>'+

                        '</div>'+

            

                        '<!-- Card body -->'+

                        '<div id="POCSection" class="collapse" role="tabpanel" aria-labelledby="POCSection-Header" data-parent="#accordionDetails">'+

                          '<div style="padding-top:0px" class="card-body">'+

                            '<ul class="list-group list-group-flush">'+

                           '<li class="list-group-item"><b style="font-weight:bold!important">Associate Administrator(AA): </b>'+requestValue_AA+'</li>'+

                                                                 '<li class="list-group-item"><b style="font-weight:bold!important">Office Director(OD): </b>'+requestValue_OD +'</li>'+

                                                                 requestPOCs+

            

                      '</ul>'+

                                    '</div>'+

                        '</div>'

            

                                                          

                                            ) 

                                            /////////////////////////////////////  
                                           
                                           
                                           
                                           

                                                       })

                                       }

                                    })  ;
//////////////////////////////////////////////////
     if(requestValue_Products != undefined ){
             //reGenerateProductHTML(requestValue_Products);
     };


}

///////////////////////////////////////////////////////////
function setLegacyPOCs(QueryListURL ){
var pocLI = ''
     var Query ='<Query><Where><Eq><FieldRef Name="ProjectID"/><Value Type="Counter">'+userSelectedRequest+'</Value></Eq></Where></Query>';
 


                  

                        $().SPServices({

                                 operation: "GetListItems",

                                 async: false,
 
                                  listName: 'JobWorkflow',

                                    webURL: QueryListURL ,                                  

                                       CAMLViewFields:"<ViewFields Properties='True' />",                             

                                       CAMLQuery:Query ,

                                  completefunc: function (xData, Status) { 
                                          $(xData.responseXML).SPFilterNode("z:row").each(function() {
                                          function convertPOCNameDisplay(pocName){
                                          var convertedName =pocName
                                             if(pocName != undefined && pocName != ""){
                                                convertedName  =  pocName.substring(pocName.indexOf('#')+1);
                                              //  requestDataPOCs.push('{"Name":"'+convertedName+'","Role":"OD"}');
                                             }else if(pocName == undefined){
                                                convertedName ="";
                                             }
                                            
                                             return convertedName;
                                          } 
                                          var pocSupervisor = $(this).attr("ows_Supervisor");
                                              if(pocSupervisor != undefined){
                                                  //pocSupervisor = pocSupervisor.substring(pocSupervisor.indexOf('#')+1);
                                                  //requestDataPOCs.push('{"Name":"'+pocSupervisor+'","Role":"OD"}');
                                                  };
                                          var pocAssignedSA = convertPOCNameDisplay($(this).attr("ows_AssignedSA"));
                                          var pocAssignedEditor  = convertPOCNameDisplay($(this).attr("ows_AssignedEditor"));
                                          var pocAssignedDesigner  = convertPOCNameDisplay($(this).attr("ows_AssignedDesigner"));
                                          var pocAssignedPC  = convertPOCNameDisplay($(this).attr("ows_AssignedPC"));
                                          var pocBackupSA  = convertPOCNameDisplay($(this).attr("ows_AssignedSABackup"));
                                          var pocBackupEditor  = convertPOCNameDisplay($(this).attr("ows_AssignedEditorBackup"));
                                          var pocBackupDesigner  = convertPOCNameDisplay($(this).attr("ows_AssignedDesignerBackup"));
                                          var pocBackupPC  = convertPOCNameDisplay($(this).attr("ows_AssignedPCBackup"));
                                         
                                            pocLI = '<li class="list-group-item"><b style="font-weight:bold!important">Assigned SA: </b>'+pocAssignedSA +'</li>'+
                                            '<li class="list-group-item"><b style="font-weight:bold!important">Assigned Editor: </b>'+pocAssignedEditor+'</li>'+
											'<li class="list-group-item"><b style="font-weight:bold!important">Assigned Designer: </b>'+pocAssignedDesigner+'</li>'+
											'<li class="list-group-item"><b style="font-weight:bold!important">Assigned PC: </b>'+pocAssignedPC +'</li>'+
											'<li class="list-group-item"><b style="font-weight:bold!important">Backup SA: </b>'+pocBackupSA+'</li>'+
											'<li class="list-group-item"><b style="font-weight:bold!important">Backup Editor: </b>'+pocBackupEditor+'</li>'+
											'<li class="list-group-item"><b style="font-weight:bold!important">Backup Designer: </b>'+pocBackupDesigner+'</li>'+
											'<li class="list-group-item"><b style="font-weight:bold!important">Backup PC: </b>'+pocBackupPC+'</li>'
											

                                           })
                                          } 
                                         })




return pocLI ;
}
/////////////////////////////////////////////////////////////////////////

 function reGenerateProductHTML(newProductJSONString){ 
 
    
 

  var newProductName ="";
  var newProductDescription ="";
      newProductCount = 0;
  var newProductAttachmentFolderName ="" ;
  var produtFormNumber = "";
  
   $('#accordionServices > .card').empty();
    
  if(newProductJSONString != undefined){   
         //////split object string incase of multiple Products       
       var splitProducts = newProductJSONString.split(",{");
       var newProductJSONStringArry =[];
       var productHTML =[];
       var lastProductIndex = 0;
       
       $.each( splitProducts , function( index, value ){
            ///add { to each value
            if(index > 0){
              value = "{"+value;
            }
            
         
       ///extract html
            var newProductHTML = value.substring(value.indexOf(',"HTML"'),value.indexOf(',"JavaScript":')) ;
                value = value.replace(newProductHTML ,'');
                newProductHTML = newProductHTML.substring(newProductHTML.indexOf('[')+2,newProductHTML.lastIndexOf('"'));
                
            /////////////////////////////
            var newProductJSON =JSON.parse(value);
             var productLI = '';
             var productionLegacyHTML ='';
             var newProductID = newProductJSON.ID;  
             var newProductName = newProductJSON.Name; 
                 if(newProductName != undefined){
                    newProductName = decodeHtml(newProductName);
                 }; 
             var newProductType = newProductJSON.Type ; 
                 if(newProductType  != undefined){
	                   newProductType = newProductType.replace('Service:','Service');
	                  };
             var newProductAttachmentButton = decodeHtml(newProductJSON.AttachmentButton); 
             var newProductDescription = newProductJSON.Description ; 
             var newProductJS = newProductJSON.JavaScript;
             var newProductDetail = newProductID +';#'+newProductType ; 
             var newProduct_HtmlIndex = index; 
             var NewFieldHTMLArray =  newProductHTML.split('","'); 
             var newProductElementID;
                 newProductAttachmentFolderName  =  $(newProductAttachmentButton).attr('id'); 
                 produtFormNumber =  newProductAttachmentFolderName.substring(newProductAttachmentFolderName.indexOf('-')+1,newProductAttachmentFolderName.lastIndexOf('-'))
                 if(newProductAttachmentFolderName  != undefined){newProductAttachmentFolderName  = 'Request'+userSelectedRequest+newProductAttachmentFolderName.substring(0,newProductAttachmentFolderName.indexOf('-Attachments'))}
                 newProductCount +=1;
                 
                   $.each( NewFieldHTMLArray , function( index, value ) {  
                     var NewFieldHTML = decodeHtml(value);

                      if($(NewFieldHTML).hasClass( "legacyHTML" )){
                        //alert($(NewFieldHTML).attr('class'))
                        productionLegacyHTML = NewFieldHTML 
                       }else{ 
                        
                       var fieldAttr = $(NewFieldHTML).attr('fieldtype');
			           var fieldLabel = $(NewFieldHTML).find('.details-label').text();
			           var fieldLabelID = $(NewFieldHTML).find('.details-label').attr('for');
			           var fieldLabelIndex =fieldLabelID ;
			               if(fieldLabelID != undefined){
			                 fieldLabelIndex = fieldLabelID.substring(fieldLabelID.indexOf('DF')+2)
			               }
			                 
			           var fieldValue = "Unknown Value";
                            if(fieldLabel != undefined){fieldLabel = fieldLabel.replace('*','');} 
			          if(fieldAttr == 'Single line of text' ){
                        //Single line of text
                        fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();
                        
                        }else if(fieldAttr == 'Multiple lines of text'){
						//Multiple lines of text
						fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).text();
						 }else if(fieldAttr == 'Radio'){
						//Radio
						var selectRdaioInputID = $(NewFieldHTML).find('input:checked' ).attr('id');
						fieldValue = $(NewFieldHTML).find('label[for*="'+selectRdaioInputID+'"]').attr('value');
					 
						 }else if(fieldAttr == 'Checkbox'){
						//Checkbox
						var selectRdaioInputID = "";
						var cbxArray = [];
						$($(NewFieldHTML).find('input:checked')).each(function(){
						    selectRdaioInputID = $(this).attr('id');
						    cbxArray.push($(NewFieldHTML).find('label[for*="'+selectRdaioInputID+'"]').text()) 
						})
						fieldValue =cbxArray ;

						 }else if(fieldAttr == 'Dropdown'){
						//Dropdown
						    fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();
						 }else if(fieldAttr == 'Dropdown(Multiple)'){
						//Dropdown(Multiple)
						var optionArray = [];
						 
                             $(NewFieldHTML).find('option:selected').each(function(){
                                 optionArray.push($(this).text())
                             })
						 fieldValue = optionArray
						 }else if(fieldAttr == 'Date'){
						//Date
						  var dateArray =$(NewFieldHTML).find('#'+fieldLabelID ).attr('data-value');
						    if(dateArray != undefined ){
						        dateArray = dateArray.replace('[','').replace(']','')
						        dateArray = dateArray.split(',')
						    }
						
						  	if(dateArray  != undefined){
								fieldValue = dateArray[1]+'/'+dateArray[2]+'/'+dateArray[0]
								}else{
								fieldValue =""
								}

						 }else if(fieldAttr == 'Time'){
						//Time
						 fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();

						 }else if(fieldAttr == 'Custom'){
						//Custom
						 }else if(fieldAttr == 'Number'){
						//Number
						   fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();

						
						}
						
						 if(fieldLabelIndex != '0'){		
						 			 
		                productLI +='<li class="list-group-item"><b style="font-weight:bold!important">'+fieldLabel+': </b>'+fieldValue +'</li>'
			            
			            }
			           	////////////////////	   

                        
                     }
                         
					 
                   })
                   
             ///set html
     $('#accordionServices > .card').append(
         '<!-- Card header -->'+
            '<div class="card-header" role="tab" id="ServiceSection-Header'+newProductCount+'">'+
              '<a class="collapsed"   data-toggle="collapse" data-parent="#accordionServices" href="#ServiceSection'+newProductCount+'" aria-expanded="false"'+
               ' aria-controls="ServiceSection'+newProductCount+'">'+
                '<h3 style="font-size:22px;color:rgb(59, 89, 152)" class="mb-0">'+
                 ''+newProductType+': <span class="ProductName-Header"  ProductID="'+produtFormNumber +'" style="font-weight:600"> '+
                 newProductName +'</span><i class="fas fa-angle-down rotate-icon"></i>'+
                '</h3>'+
             ' </a>'+
            '</div>'+

            '<!-- Card body -->'+
            
            '<div id="ServiceSection'+newProductCount+'" class="collapse " ProductID="'+produtFormNumber +'"  role="tabpanel" aria-labelledby="ServiceSection-Header'+newProductCount+'" data-parent="#accordionServices">'+
              '<div style="padding-top:0px" class="card-body">'+
             '<p style="padding-left:15px;font-size:16px">'+newProductDescription+'</p>'+
                 '<ul class="list-group list-group-flush">'+
                productLI  +

          '</ul>'+
          productionLegacyHTML +
          '<div class="  " style="padding: 30px !important;">'+
          '<h5><span style="color: rgb(59, 89, 152) !important;"><i class="fa fa-folder" aria-hidden="true"></i> <b><span class="sr-only">'+newProductName +'</span> Attachtments</b></span></h5>'+
          '<table class="table table-hover ">'+
          '<thead style="color: rgb(59, 89, 152) !important;"><tr><th style="font-size: 18px; font-weight: bold !important;" scope="col">File</th><th style="font-size: 18px; font-weight: bold !important;" scope="col">Last Modified</th></tr> </thead>'+
          '<tbody class="RequestAttachmentTBL" id="'+newProductAttachmentFolderName+'-Attachments"></tbody></table>'+
          '</div>'+
                        '</div>'+
            '</div>'


    )
 //////////////////////
           getRequestAttachments_Products(newProductAttachmentFolderName)
			 
        }) ; 
      
	getProducts_radioOptions();  
  /////////////////////////////////////////
      var LegacyHTMLClass = '.legacyHTML';
   var undefinedInputID = 0
   
    $(LegacyHTMLClass).each(function(){
		   /////Convert TextArea
		   $(this).find('textarea').each(function(){
		        $(this).attr('readonly','readonly');
		        
		        		   });
		   /////Convert Singleline Text
		   $(this).find('input[type*="text"]').each(function(){
		         $(this).attr('readonly','readonly');
		        
		        		   });
		       		   
		     /////Convert Select
		   $(this).find('select').each(function(){
		         $(this).attr('readonly','readonly');
		        
		        		   });
     		    
		     /////Convert checkbox
		   $(this).find('input[type*="checkbox"]').each(function(){
		                    $(this).prop('disabled',true);
		       
		        		   });
		    ////////////////////////////////////////////////////    		   
    })	   




       
         return;
       ////////////////////////////////////
       ////////////////////////////////////////
       /////////////////
    var newProductJSON = JSON.parse("["+newProductJSONString +"]");
       
        $.each( newProductJSON, function( index, value ) {
         var productLI = '';
           var newProductID = value.ID;  
               newProductName = newProductJSON[index].Name;  
              
            var newProductType = newProductJSON[index].Type ; 
            var newProductAttachmentButton =  decodeHtml(newProductJSON[index].AttachmentButton);
            
             newProductAttachmentFolderName  =  $(newProductAttachmentButton).attr('id');///newProductAttachmentFolderName
             produtFormNumber =  newProductAttachmentFolderName.substring(newProductAttachmentFolderName.indexOf('-')+1,newProductAttachmentFolderName.lastIndexOf('-'))
             if(newProductAttachmentFolderName  != undefined){newProductAttachmentFolderName  = 'Request'+userSelectedRequest+newProductAttachmentFolderName.substring(0,newProductAttachmentFolderName.indexOf('-Attachments'))}
               newProductDescription = newProductJSON[index].Description ;
            // var newProductJS = newProductJSON[index].JavaScript
       //   var newProductAttachmentFolderName  ="Request42productForm-1"
            var newProductDetail = newProductID +';#'+newProductType ; 
            newProductCount +=1;
             
                 $.each( newProductJSON[index].HTML, function( index, value ){
			         NewFieldHTML = decodeHtml(value);  
			          // $('body').append(NewFieldHTML )   
			           var fieldAttr = $(NewFieldHTML).attr('fieldtype');
			           var fieldLabel = $(NewFieldHTML).find('.details-label').text();
			           var fieldLabelID = $(NewFieldHTML).find('.details-label').attr('for');
			           var fieldLabelIndex =fieldLabelID ;
			               if(fieldLabelID != undefined){
			                 fieldLabelIndex = fieldLabelID.substring(fieldLabelID.indexOf('DF')+2)
			               }
			           var fieldValue = "Unknown Value";
                            if(fieldLabel != undefined){fieldLabel = fieldLabel.replace('*','');} 
			          if(fieldAttr == 'Single line of text' ){
                        //Single line of text
                        fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();
                        
                        }else if(fieldAttr == 'Multiple lines of text'){
						//Multiple lines of text
						fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).text();
						 }else if(fieldAttr == 'Radio'){
						//Radio
						var selectRdaioInputID = $(NewFieldHTML).find('input:checked' ).attr('id');
						fieldValue = $(NewFieldHTML).find('label[for*="'+selectRdaioInputID+'"]').attr('value');
					 
						 }else if(fieldAttr == 'Checkbox'){
						//Checkbox
						var selectRdaioInputID = "";
						var cbxArray = [];
						$($(NewFieldHTML).find('input:checked')).each(function(){
						    selectRdaioInputID = $(this).attr('id');
						    cbxArray.push($(NewFieldHTML).find('label[for*="'+selectRdaioInputID+'"]').text()) 
						})
						fieldValue =cbxArray ;

						 }else if(fieldAttr == 'Dropdown'){
						//Dropdown
						    fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();
						 }else if(fieldAttr == 'Dropdown(Multiple)'){
						//Dropdown(Multiple)
						var optionArray = [];
						 
                             $(NewFieldHTML).find('option:selected').each(function(){
                                 optionArray.push($(this).text())
                             })
						 fieldValue = optionArray
						 }else if(fieldAttr == 'Date'){
						//Date
						  var dateArray =$(NewFieldHTML).find('#'+fieldLabelID ).attr('data-value');
						    if(dateArray != undefined ){
						        dateArray = dateArray.replace('[','').replace(']','')
						        dateArray = dateArray.split(',')
						    }
						
						  	if(dateArray  != undefined){
								fieldValue = dateArray[1]+'/'+dateArray[2]+'/'+dateArray[0]
								}else{
								fieldValue =""
								}

						 }else if(fieldAttr == 'Time'){
						//Time
						 fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();

						 }else if(fieldAttr == 'Custom'){
						//Custom
						 }else if(fieldAttr == 'Number'){
						//Number
						   fieldValue =  $(NewFieldHTML).find('#'+fieldLabelID ).val();

						
						}
						
						if(fieldLabelIndex != '0'){		
						 			 
		                productLI +='<li class="list-group-item"><b style="font-weight:bold!important">'+fieldLabel+': </b>'+fieldValue +'</li>'
			            }
			           		   

                    }) ;

             ///set html
     $('#accordionServices > .card').append(
         '<!-- Card header -->'+
            '<div class="card-header" role="tab" id="ServiceSection-Header'+newProductCount+'">'+
              '<a class="collapsed"   data-toggle="collapse" data-parent="#accordionServices" href="#ServiceSection'+newProductCount+'" aria-expanded="false"'+
               ' aria-controls="ServiceSection'+newProductCount+'">'+
                '<h3 style="font-size:22px;color:rgb(59, 89, 152)" class="mb-0">'+
                 ''+newProductType+': <span class="ProductName-Header"  ProductID="'+produtFormNumber +'" style="font-weight:600"> '+
                 newProductName +'</span><i class="fas fa-angle-down rotate-icon"></i>'+
                '</h3>'+
             ' </a>'+
            '</div>'+

            '<!-- Card body -->'+
            
            '<div id="ServiceSection'+newProductCount+'" class="collapse " ProductID="'+produtFormNumber +'"  role="tabpanel" aria-labelledby="ServiceSection-Header'+newProductCount+'" data-parent="#accordionServices">'+
              '<div style="padding-top:0px" class="card-body">'+
             '<p style="padding-left:15px;font-size:16px">'+newProductDescription+'</p>'+
                 '<ul class="list-group list-group-flush">'+
                productLI  +

          '</ul>'+
          '<div class="  " style="padding: 30px !important;">'+
          '<h5><span style="color: rgb(59, 89, 152) !important;"><i class="fa fa-folder" aria-hidden="true"></i> <b><span class="sr-only">'+newProductName +'</span> Attachtments</b></span></h5>'+
          '<table class="table table-hover ">'+
          '<thead style="color: rgb(59, 89, 152) !important;"><tr><th style="font-size: 18px; font-weight: bold !important;" scope="col">File</th><th style="font-size: 18px; font-weight: bold !important;" scope="col">Last Modified</th></tr> </thead>'+
          '<tbody class="RequestAttachmentTBL" id="'+newProductAttachmentFolderName+'-Attachments"></tbody></table>'+
          '</div>'+
                        '</div>'+
            '</div>'


    )
 //////////////////////
    getRequestAttachments_Products(newProductAttachmentFolderName)
			 
        }) ; 
     
	getProducts_radioOptions();  
  /////////////////////////////////////////
     

    }
    
                                    
                                   
   

};
/////////////////////////////////////////////////////////
 
 
 
////////////////////Get Request documents
function getRequestAttachments_Products(ProductAttachmentLocation){    
 
  
  
/////empty table body
    $('#'+ProductAttachmentLocation+'-Attachments').empty();
 
  
     DocumentQuery = '<Query><Where><Contains><FieldRef Name="FileDirRef"/><Value Type="Text">'+ProductAttachmentLocation +'</Value></Contains></Where><OrderBy><FieldRef Name="Created" Ascending="False" /></OrderBy></Query>'
 
    ////////////////SPServices Get List Items
                               $().SPServices({
								    operation: "GetListItems",
								    async: false,
								    listName: 'Request Library',
								    CAMLViewFields: "<ViewFields><FieldRef Name='ID' /><FieldRef Name='FileDirRef' /><FieldRef Name='LastMod' /><FieldRef Name='FileDirRef' /><FieldRef Name='Created' /><FieldRef Name='_SourceUrl' /><FieldRef Name='_SourceUrl' /><FieldRef Name='FileLeafRef' /><FieldRef Name='ID' /><FieldRef Name='Author' /><FieldRef Name='FileDirRef' /><FieldRef Name='DocIcon' /><FieldRef Name='FileRef' /></ViewFields>",
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
								    //  var Document_Deletefunc ="'"+$(this).attr("ows_ID")+"'"+","+"'"+DocumentLink+"'"+","+"'Request Library'"+","+"'"+ProductAttachmentLocation+"'";

                                    
								      
 
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
													       
													      '<th  scope="row"><a target="_blank" class="ReLink" href="'+ Document_URL+'"><i class="fa '+docicon+'" aria-hidden="true"></i> '+Document_Name+'</a></th>'+
													      '<td>'+LastModifiedDate +'</td>'+
													     // '<td style="padding:2px!important;padding-top:4px!important"><a class="btn-sm btn-danger btn-floating" onclick="deleteProductDocument('+Document_Deletefunc+');" ><i class="fa fa-times"></i></a></td>'+
													   ' </tr>'
													   
										///append to table
										     $('#'+ProductAttachmentLocation+'-Attachments').append(tableRow)			   

                                          ///append to attachment list
                                             var documentListItem = '<li style="-ms-word-wrap: break-word;" ><a target="_blank" class="ReLink" href="'+ Document_URL+'">'+Document_Name+'</a></li>';
											                         
											   $('#'+ProductAttachmentLocation+'-AttachLI').show();                     
											 $('#'+ProductAttachmentLocation+'-AttachLI  > ul').append(documentListItem).show()                        
                                          ////////////////////////////////////////////////
                                                                                    

                                                });
									                 
									                 
									            }
									   		 });
                                         ////////////////SPServices Get List Items



}
/////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////

function setRequestDetails_Legacy(requestView,requestFilter,yearFilters ){

$('.loading-slert').show()
  var queryList = "OCCIRequest"
  var queryUrl = "https://usdot.sharepoint.com/teams/nhtsa-occiwf/CE-nhtsa-occiwf"

  var tableName ="";

  var tableEmpty = "Yes";

  var tableRows ="";

  var tableID ="Legacy";

  var  Query ='<Query><OrderBy><FieldRef Name="Created" Ascending="FALSE"/></OrderBy></Query>'

  var summaryViewTitle = "Request Archives";

  var summaryViewInstruction = "Sed ut perspiciatis unde omnis iste natus error sit"+

        "voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae"+ 

        "ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt "+

        "explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut "+

        "fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi "+

        "nesciunt";
  
      
        var hideyearFileters =""
          if(yearFilters == undefined){
             // hideyearFileters ="display:none"
            var d = new Date(); 
	        var requestYearCurrent = parseInt(d.getFullYear());
            var requestYear3 = requestYearCurrent  - 1;
            var requestYear2 = requestYearCurrent  - 2;
            var requestYear1 = requestYearCurrent  - 3;
                yearFilters  = [requestYearCurrent,requestYear3] 
                }   
        
        var yearFilterButtons = "" ;
   var yearFilterButtons = "" ;
  $.each(yearFilters , function( index, value ) {
 
      var filteredYear = value;
          yearFilterButtons += '<a href="javascript:removeYearFilter('+value+')"  style="margin-right:15px" class=" '+value+'YearBadge badge badge-light"><span class="yearBadge" >'+value +'</span> <i  class="fa fa-times" aria-hidden="true"></i></a>'
      var requestYearItems =  getRequestYear();
    var filterDropID = "dropdownMenuRequests";
    
    var requestYearFilter = '<div class="dropdown">'+
								  '<button class="btn btn-primary btn-sm dropdown-toggle" type="button" id="'+filterDropID+'" data-toggle="dropdown"'+
								    'aria-haspopup="true" aria-expanded="false">'+
								   'Year Filters'+
								  '</button>'+
								  '<div class="dropdown-menu" aria-labelledby="'+filterDropID+'">'+
								    requestYearItems+
								  '</div>'+
								'</div>'+
								'<div style="'+hideyearFileters+'" currentfunc="setRequestDetails_Legacy" requestFilter="'+requestFilter+'" requestView="'+requestView+'" id="yearFilterWrap">'+
								'<div style="padding-left:10px;padding-right:10px;padding-top:5px">'+
								'<b style="padding-right:5px"><i class="fa fa-filter" aria-hidden="true"></i> Year Filters:</b> '+
								 yearFilterButtons +
								'</div>'+
								'</div>'


       ///set summary title

           $('#summary-view').html(summaryViewTitle)

           $('#summary-viewInstructions').html(summaryViewInstruction+requestYearFilter )


     

      var Query ='<Query>'+
              '<Where>'+      
                  '<Eq>'+
						'<FieldRef Name="datecalcYear"/>'+
						 '<Value Type="Text">'+filteredYear+'</Value>'+
						 					 
					'</Eq>'+
                '</Where>'+
                '</Query>';
        
              $().SPServices({

                    operation: "GetListItems",

                    async: false,

                    listName: queryList ,

                      webURL: queryUrl ,                                                                                                            

                      CAMLQuery:Query ,

                    // CAMLRowLimit: 10,               

                      CAMLViewFields: "<ViewFields Properties='True' />",                                                                                                                              

                      completefunc: function (xData, Status) {

                       $(xData.responseXML).SPFilterNode("z:row").each(function() { 

                          tableEmpty ="No";                     

                                              

                                             var requestValue_ID = $(this).attr("ows_ID"); 

                                             var requestValue_Title = $(this).attr("ows_Title");

                                             var requestValue_RequestDate = $(this).attr("ows_CreatedCalc")
                                               if(requestValue_RequestDate != undefined){
                                                 requestValue_RequestDate = $(this).attr("ows_CreatedCalc").substring( $(this).attr("ows_CreatedCalc").indexOf('#')+1);
                                                 }
                                              
                                             var requestValue_SpCreatedDate = $(this).attr("ows_Created");

                                             var requestValue_Status = $(this).attr("ows_Status");
                                              ////set Job status
                                                    if(requestValue_Status == "Approved"){
                                                          requestValue_Status  =  $(this).attr("ows_JobWF_x003a_Job_x0020_Status_x000");
                                                            if(requestValue_Status != undefined){
                                                                requestValue_Status = requestValue_Status.substring(requestValue_Status.indexOf('*')+1);
                                                            }
                                                    } 

                                             var requestValue_JobNumber =$(this).attr("ows_JobNO");if(requestValue_JobNumber!= undefined){requestValue_JobNumber = '<span style="font-weight:bold">Job# </span><b id="'+tableID+requestValue_ID+'-JobNumber" style="font-weight:bold">'+requestValue_JobNumber+'</b><br>'}else{ requestValue_JobNumber =""}
 


                                             var requestValue_HS = "???"//$(this).attr("ows_HS");

                                              if(requestValue_HS == undefined ){

                                                    requestValue_HS = "None"

                                                   }

                                             var requestValue_Requestor = $(this).attr("ows_Requestor");
                                                 if(requestValue_Requestor != undefined){
                                                     requestValue_Requestor =  $(this).attr("ows_Requestor").substring($(this).attr("ows_Requestor").indexOf('#')+1);

                                                 }
                                             var requestValue_SA = "???"//$(this).attr("ows_SA");

                                             if(requestValue_SA == undefined || requestValue_SA == ""){

                                                    requestValue_SA= "None"

                                                   }

                                             var requestValue_Campaign = $(this).attr("ows_Compaign");
                                            
                                                 if(requestValue_Campaign == undefined){

                                                    requestValue_Campaign = "None"

                                                   }else{                                                

                                                    requestValue_Campaign = requestValue_Campaign.substring(requestValue_Campaign.indexOf('#')+1);

                                                 }                                                

                                                  

                                             var requestValue_DueDate = "???"//$(this).attr("ows_Due_x0020_Date");

                                                 if(requestValue_DueDate == undefined){requestValue_DueDate = "None"}

                                             var requestCBX = '<div class="custom-control custom-checkbox">'+

                                                        '<input type="checkbox" requestID="'+requestValue_ID+'"  class="custom-control-input   legacyRequestDetail-btn"  queryList="'+queryList+'" queryUrl="'+queryUrl+'"  id="'+tableID+requestValue_ID+'">'+

                                                        '<label class="custom-control-label" for="'+tableID+requestValue_ID+'" ><span class="sr-only">View details for '+requestValue_Title+'</span></label>'+

                                                    '</div>'

                                               var requestLink ='<span   style="color:#0275d8" id="'+tableID+requestValue_ID+'-Request"><b>'+requestValue_Title+'</b></span> ' 

                                              

                                                                                                                                                          
                                                 //////////////////////////////////////////////
                                                    tableRows  += '<tr>'+

                                                               '<td  data-toggle="tooltip" data-placement="left" title="Click the Checkbox to view '+requestValue_Title+' Request Details" class="RequestDetailCBX"  style="border-right:1px solid #dee2e6">'+requestCBX+'</td>'+

                                                               '<td>'+requestValue_JobNumber+requestLink+'<span style="display:none" id="'+tableID+requestValue_ID+'-HS">'+requestValue_HS+'</span></td>'+

                                                              // '<td>'+requestValue_HS +'</td>'+

                                                               '<td>'+requestValue_Requestor +'</td>'+

                                                              // '<td>'+requestValue_SA+'</td>'+

                                                               '<td>'+requestValue_RequestDate +'</td>'+

                                                               '<td>'+requestValue_Campaign +'</td>'+

                                                            //   '<td>'+requestValue_DueDate +'</td>'+

                                                               '<td>'+requestValue_Status +'</td>'+

                                                               '<td>'+requestValue_SpCreatedDate +'</td>'+

                                                              '</tr>';

                            

                         

                       })

                      }

                     })  
               });
 

   if(tableEmpty != "No"){

   

          tableRows ="None";

   }

     

      

       var tableHtml = getRequestTableHTML(requestView ,tableRows);

   ///set data table options

     var tableOptions = "";

                 tableOptions = { 

                           "order": [[ 6, "desc" ]],

                          

            "columnDefs": [ 

                 {

                     "targets": [ 6 ],

                     "visible": false,     

                     "searchable": false

                 },

               ]

               

            }   

                   

          

  //////////////////////        

    $('.loading-slert').hide()
   $('#JobRequests-TBLWrap').empty()
   $('#JobRequests-TBLWrap').append(tableHtml)

   ///set data table styling

    $('#requestSummaryTBL').DataTable(tableOptions);

             $('.dataTables_length').addClass('bs-select');

 

 
////show Request ToolTip
               $('.RequestDetailCBX[data-toggle="tooltip"]').tooltip(); 

 

}

 

//////////////////////////////////////////////////////////
  /////////////////////////////////////////////////////////
function reGenerateProductLegacyHTML(QueryListURL ){
   newProductCount = 0;
    
  var Query ='<Query><Where><Eq><FieldRef Name="OCCIRequestID"/><Value Type="Text">'+userSelectedRequest+'</Value></Eq></Where></Query>';

                        $().SPServices({

                                 operation: "GetListItems",

                                 async: false,
 
                                  listName: 'ProjectDetail',

                                    webURL: QueryListURL ,                                  

                                       CAMLViewFields:"<ViewFields Properties='True' />",                             

                                       CAMLQuery:Query ,

                                  completefunc: function (xData, Status) { 
                                      $(xData.responseXML).SPFilterNode("z:row").each(function() {
                                         
                                        var x = $(this);
	            	var itemId = parseInt(x.attr("ows_ID"));
 
				   
					var serviceId = getReferenceId(x.attr("ows_Service"))[0];
				   
	            	var detailDiv =$('#testdiv')// $('#dtl_' + serviceId);
	            	
	            	var detail = x.attr("ows_Detail");
	            	
	            	var detailHtml  = unescape(detail);
	            	
	            	var otherName =x.attr("ows_Other");
	            		            	
	            detailDiv.html(unescape(detail));
	            	
					detailDiv.attr('itemId', itemId);
				
					 
					//https://ce.dot.gov/team/nhtsa.occiwf/Job/job_status.aspx?JobID=214863
					var hasAttach = x.attr("ows_Attachments");				
	                var attchmentLinkIDs =[]; 
					if (hasAttach  == '1') {
		                 attchmentLinkIDs.push(itemId)
		            }

                          
                         loadCategoryDetail(QueryListURL ,serviceId, otherName ,detailHtml,attchmentLinkIDs )
                    						
                      ////set Product detail array
                      //   requestDataProducts 
                      
                      /////////////////////////////////
                        
                                      })
                                      
                                   }
                                 }) 
                                 
        productMaterialize();                          
                                 
                     
}
/////////////////////////////////////////////////////
function getReferenceId(xmlVal){
		if (xmlVal) {
			//return xmlVal.substring(0, xmlVal.indexOf(';'));
			return xmlVal.split(';#');
		}
		else {
			return [0, ''];
		}
	}

////////////////////load category
	/* Load Category to array_category */
	function loadCategory(QueryListURL ) {	
	
		 
  

	    $().SPServices({
	        operation: "GetListItems",
	        listName: "ProdSvcCategory",
	        webURL: QueryListURL ,
	        CAMLViewFields:"<ViewFields Properties='True' />", 
	        async: false,
	        completefunc: function (xData, Status) {
	            //alert(xmlToString(xData.responseXML));  
	            var index = 0;
	            $(xData.responseXML).SPFilterNode('z:row').each(function(){
	               var x = $(this);
	               var idx = parseInt(x.attr("ows_ID"));       
	               array_category[index] = {
	                	"ID":idx, 
	                	"Name":x.attr("ows_LinkTitle")
	
	                };
	                
	                index++;
	
	            });
	            
	
	        }
	    });  
	} 
	//end of function load category
	/* Load Category to array_category_detail */
	function loadCategoryDetail(QueryListURL,QueryID,otherName, detailHtml,attchmentLinkIDs   ){	
 
 var Query ='<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+QueryID +'</Value></Eq></Where></Query>';
     Queryx ='<Query>'+
              '<OrderBy>'+
				'<FieldRef Name="Created" Ascending="TRUE"/>'+
			'</OrderBy>'+
            '</Query>'


	    $().SPServices({
	        operation: "GetListItems",
	        listName: "ProductAndService",
	        webURL: QueryListURL ,
	        CAMLQuery:Query ,
	        CAMLViewFields:"<ViewFields Properties='True' />",   
	        async: false,
	        completefunc: function (xData, Status) {   
	            var index = 0;
	            $(xData.responseXML).SPFilterNode('z:row').each(function(){
	               var x = $(this);
	               var idx = parseInt(x.attr("ows_ID"));       
	               array_category_detail[index] = {
	                	"ID":idx, 
	                	"Name":x.attr("ows_LinkTitle"),
	                	"Category":x.attr("ows_Category"),
						"Layout":detailHtml ,
						"Other":otherName 
	                };
	                
	                index++;
	              
	            });
	              //  
 
	             $(xData.responseXML).SPFilterNode('z:row').each(function(){
                     var layoutID = getCategoryID($(this).attr("ows_Category"));
                     generate_layout(layoutID,attchmentLinkIDs,QueryListURL)
                  });  
	        }
	    });  
	  
	     //alert( array_category_detail );
	} 
	//end of function load category detail
	/* get categoryID */
	function getCategoryID( categoryName ){
		var index=0;
		for(index=0; index<array_category.length; index++){
			if(  categoryName.indexOf( array_category[index].Name ) != -1 ){
				return array_category[index].ID			
			}
		}
	  
		return 0;
	}
	
///////////////////////////////////////////////////////////////////////////////////////
	/* generate accordion detail */
	function generate_layout( categoryID,attchmentLinkIDs,QueryListURL ){
///get project attachments
 var attachmentRows ="";
	$.each(attchmentLinkIDs, function( index, value ) {
   attachmentRows  = getLegacyAttachments(QueryListURL ,value )
 
});
            // requestDataProducts =[]
               
		//filter
		var array_current_category_detail = [];
		var index = 0;
		var newProductName = "Other";
	 	var newProductOther = ''
        var newProductDescription ="Description Text ...";
   
  var newProductAttachmentFolderName ="none" 
  var productLI  =""
  var productIframeHTML =""
			for(var i=0; i < array_category_detail.length; i++){{
			if( getCategoryID(array_category_detail[i].Category) == categoryID  )
				 array_current_category_detail[index] = array_category_detail[i];
				 if(array_category_detail[i].Category!= undefined){newProductName = array_category_detail[i].Category.substring(array_category_detail[i].Category.indexOf('#')+1)};
				 newProductCount+=1;
				 index++;
			}	
		}
	 
		 
		var this_html = [];
		
		//generate checkbox
		this_html.push("<div class='cat-section'>");
		for(var i=0; i < array_current_category_detail.length; i++){	
			if( array_current_category_detail[i].Name == 'Other' ){
		   		this_html.push("<div class='req_opt req_opt_other'>");	
		    }
		    else {
		   		this_html.push("<div class='req_opt'>");		    
		    }
	
			this_html.push("<input type='checkbox' id='chk_") ;
			this_html.push(array_current_category_detail[i].ID , "' name='chk_"); 
			this_html.push(categoryID, "_" , array_current_category_detail[i].ID);
			this_html.push("' value='1' /> <span class='project_regular'>");
			 if(newProductName == 'Product (Pick one)'){
			    newProductName = array_current_category_detail[i].Name
			 }
			 
	        if( array_current_category_detail[i].Name != 'Other' ){
		   		this_html.push(array_current_category_detail[i].Name, "</span>");	
		   	 
		    }
		    else{
		        this_html.push("Other  <input type='text' id='txt_other_",
		        	array_current_category_detail[i].ID);
		        this_html.push("' size='50' /> </span>");	
		        newProductName = "Other";
		        newProductOther = '<span style="font-weight:600">:</span> '+array_current_category_detail[i].Other
		        
		    }	
		    
		    this_html.push("</div>");
		}
	
	    this_html.push("<div class='clear'></div></div><br/>");	
		
		//generate table
		for(var i=0; i < array_current_category_detail.length; i++){
			this_html.push("<div id='tbl_", array_current_category_detail[i].ID, "' class=dynamic_detail>");
			
			this_html.push('<h3>', array_current_category_detail[i].Name, ' Details</h3>');
			
			this_html.push("<div id='dtl_", array_current_category_detail[i].ID, "'>");
			this_html.push(convertToHtml(array_current_category_detail[i].Layout));
			this_html.push("</div>");	
			
			this_html.push("<div class='attach-file'><div class='attachments'><img src='images/Attach-icon.png' alt='View Attachments' title='View Attachments' /></div></div>");
			
			//if (i == 0) alert(convertToHtml(array_current_category_detail[i].Layout));
					
			this_html.push("</div>");
	          // productLI = converServiceHTML_LI("<div class='ignore-css' id='dtl_"+ array_current_category_detail[i].ID+"'>"+array_current_category_detail[i].Layout+"</div>",array_current_category_detail[i].Name)
		     productIframeHTML = array_current_category_detail[i].Layout
		
		}
	 	 //$('body').append(this_html.join(''))
 
                                    
	 	 var elementname="script"
   
     var cbxSelect = '"input[type='+"'checkbox'"+']"'
      
           var updatedSTyle =     '<'+elementname+' type="text/javascript">'+
			                         'function toggleFormElements(bDisabled) {'+ 
									   ' var inputs = document.querySelectorAll('+cbxSelect+'); '+
									   ' for (var i = 0; i < inputs.length; i++) { '+
									      '  inputs[i].disabled = bDisabled;'+
									       
									   ' }'+
									    ' var inputs = document.getElementsByTagName("input"); '+
									    'for (var i = 0; i < inputs.length; i++) { '+
									      'inputs[i].readOnly = bDisabled;'+
									     //'  inputs[i].disabled = bDisabled;'+
									   ' } '+
									 
									   ' var selects = document.getElementsByTagName("select");'+
									   ' for (var i = 0; i < selects.length; i++) {'+
									      '  selects[i].disabled = bDisabled;'+
									   ' }'+
									   ' var textareas = document.getElementsByTagName("textarea");'+ 
									   ' for (var i = 0; i < textareas.length; i++) { '+
									   //'    textareas[i].disabled = bDisabled;'+
									     'textareas[i].readOnly = bDisabled;'+
									   ' }'+
									   ' var buttons = document.getElementsByTagName("button");'+
									   ' for (var i = 0; i < buttons.length; i++) {'+
									
									'}'+
									 
									'}'+
									
									'toggleFormElements(true)'+
			
                       '</'+elementname+'>'+
                        '<style type="text/css">html, body {font-family: sans-serif;line-height: 1.15; -webkit-text-size-adjust: 100%;  }</style>'
        updatedSTyle = ''//'<style type="text/css">html, body {font-family: sans-serif;line-height: 1.15; -webkit-text-size-adjust: 100%;  }</style>'

	 	    ///set html
     $('#accordionServices > .card').append(
         '<!-- Card header -->'+
            '<div class="card-header" role="tab" id="ServiceSection-Header'+newProductCount+'">'+
              '<a class="collapsed" data-toggle="collapse" data-parent="#accordionServices" href="#ServiceSection'+newProductCount+'" aria-expanded="false"'+
               ' aria-controls="ServiceSection'+newProductCount+'">'+
                '<h3 style="font-size:22px;color:rgb(59, 89, 152)" class="mb-0 serviceTitle">'+
                 '<span style="font-weight:600"> '+
                 newProductName +'</span>'+newProductOther+'<i class="fas fa-angle-down rotate-icon"></i>'+
                '</h3>'+
             ' </a>'+
            '</div>'+

            '<!-- Card body -->'+
            '<div id="ServiceSection'+newProductCount+'" class="collapse " role="tabpanel" aria-labelledby="ServiceSection-Header'+newProductCount+'" data-parent="#accordionServices">'+
              '<div style="padding-top:0px" class="card-body">'+
             //'<p style="padding-left:15px;font-size:16px">'+newProductDescription+'</p>'+
             '<div class="legacyHTML prodfield-wrap" LegactServiceTitle="'+newProductName +''+newProductOther+'" fieldtype="legacyHTML"  style="padding:5px; " id="productHTML'+newProductCount+'"></div>'+
   
                        '<div  style="overflow:auto;max-height:500px;border:2px solid #dee2e6!important;display:none">'+
                        
                   // '<iframe   id="productIframe'+newProductCount+'" frameborder="1" scrolling="no" style="display:block; width:100%; height:100vh;"></iframe>' +
                   '</div>'+
                 '<ul class="list-group list-group-flush">'+
                //productLI  +

          '</ul>'+
          '<hr>'+
          '<div class=" alert alert-info " style="padding: 30px !important;">'+
          '<h5><span style="color: rgb(59, 89, 152) !important;"><i class="fa fa-folder" aria-hidden="true"></i> <b><span class="sr-only">'+newProductName +'</span> Attachtments</b></span></h5>'+
          '<table class="table table-hover ">'+
          '<thead style="color: rgb(59, 89, 152) !important;"><tr><th style="font-size: 18px; font-weight: bold !important;" scope="col">File</th></tr> </thead>'+
          '<tbody class="RequestAttachmentTBL" id="'+newProductAttachmentFolderName+'-Attachments">'+attachmentRows+'</tbody></table>'+
          '</div>'+
            '<hr>'+
                        '</div>'+
            '</div>'


    )
    
       $('#ServiceSection-Header1 > a').click();
       
      $('#productHTML'+newProductCount).append(updatedSTyle+productIframeHTML);
     
     
     // $('#productIframe'+newProductCount).contents().find("body").append(updatedSTyle+productIframeHTML );
    /////////add products to array
      var serviceName = newProductName+newProductOther;
  

         // requestDataProducts.push('{'+
                                 //  '"ID":22,"Type":"Legacy Service","Name":"'+serviceName+'","Description":"",'+
                                 //  '"AttachmentButton":"!#less#!button type=!#quote#!button!#quote#! id=!#quote#!productForm-1-AttachmentsBTN!#quote#! onclick=!#quote#!openAttachmentUploadler(!#singlequote#!Request Library!#singlequote#!,!#singlequote#!22;#Other!#singlequote#!,!#singlequote#!productForm-1!#singlequote#!)!#quote#! class=!#quote#!btn btn-md upload-btn   btn-rounded mb-3 primary-color !#quote#! uploadfolder=!#quote#!undefined!#quote#! foldercreated=!#quote#!undefined!#quote#!!#great#!!#less#!i class=!#quote#!fa fa-paperclip!#quote#! aria-hidden=!#quote#!true!#quote#!!#great#!!#less#!/i!#great#! Attach A file!#less#!/button!#great#!",'+
                                  // '"FieldType":["Single line of text","Multiple lines of text"],'+
                                  // '"HTML":["!#less#!div class=!#quote#!prodfield-wrap!#quote#! fieldtype=!#quote#!Single line of text!#quote#!!#great#!!#less#!label class=!#quote#!details-label!#quote#! for=!#quote#!productForm-1-DetailsDF0!#quote#!!#great#!Name !#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/label!#great#!!#less#!input type=!#quote#!text!#quote#! id=!#quote#!productForm-1-DetailsDF0!#quote#! formlocation=!#quote#!productForm-1-Link!#quote#! style=!#quote#!width:100%!#quote#! onchange=!#quote#!if(!$(this).val()||$(this).val().trim().length === 0 ){$(this).val(!#singlequote#!!#singlequote#!);$(!#singlequote#!#productForm-1-AttachLI !#great#! .prodTitle!#singlequote#!).html(!#singlequote#!OtherOption!#singlequote#!);}else{$(!#singlequote#!#productForm-1-Link!#singlequote#!).html($(this).val());$(!#singlequote#!#productForm-1-AttachLI !#great#! .prodTitle!#singlequote#!).html($(this).val());}!#quote#! class=!#quote#!form-control input-required mb-2 validate valid!#quote#! required=!#quote#!!#quote#! value=!#quote#!OtherOption!#quote#!!#great#!!#less#!/div!#great#!","!#less#!div class=!#quote#!form-group prodfield-wrap!#quote#! fieldtype=!#quote#!Multiple lines of text!#quote#!!#great#!!#less#!label class=!#quote#!details-label active!#quote#! for=!#quote#!DetailsproductForm-1DF12!#quote#!!#great#!Description !#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/label!#great#!!#less#!textarea type=!#quote#!text!#quote#! formlocation=!#quote#!productForm-1-Link!#quote#! id=!#quote#!DetailsproductForm-1DF12!#quote#! class=!#quote#!form-control mb-2 textarea-required validate valid!#quote#! placeholder=!#quote#!!#quote#! rows=!#quote#!3!#quote#! required=!#quote#!!#quote#!!#great#!Desc Text!#less#!/textarea!#great#!!#less#!/div!#great#!"],'+
                                  // '"JavaScript":"None"'+
                                   //'}')
      
      

    ////////////////////////////

		return this_html.join('');
	


}
//////////////////////////////////
function genLegacyProduct(prodName,prodFormNumber,prodFormDesc,prodFormHtml){ 
	 
 

var newProductJSONString  = '{"ID":22,'+
						  '"Type":"Legacy Product or Service:",'+
						  '"Name":"'+prodName+'",'+
						  '"Description":"'+prodFormDesc+'",'+
						  '"AttachmentButton":"!#less#!button type=!#quote#!button!#quote#! id=!#quote#!productForm-'+prodFormNumber+'-AttachmentsBTN!#quote#! onclick=!#quote#!openAttachmentUploadler(!#singlequote#!Request Library!#singlequote#!,!#singlequote#!22;#Legacy Product or Service:!#singlequote#!,!#singlequote#!productForm-'+prodFormNumber+'!#singlequote#!)!#quote#! class=!#quote#!btn btn-md upload-btn btn-rounded mb-3 primary-color !#quote#! uploadfolder=!#quote#!undefined!#quote#! foldercreated=!#quote#!undefined!#quote#!!#great#!!#less#!i class=!#quote#!fa fa-paperclip!#quote#! aria-hidden=!#quote#!true!#quote#!!#great#!!#less#!/i!#great#! Attach A file!#less#!/button!#great#!",'+
						  '"FieldType":["Single line of text","legacyHTML"],'+
						  '"HTML":["!#less#!div class=!#quote#!prodfield-wrap!#quote#! fieldtype=!#quote#!Single line of text!#quote#!!#great#!!#less#!label class=!#quote#!details-label!#quote#! for=!#quote#!productForm-'+prodFormNumber+'-DetailsDF0!#quote#!!#great#!Name of Legacy Product or Service !#less#!span aria-hidden=!#quote#!true!#quote#! style=!#quote#!color:red!#quote#!!#great#!*!#less#!/span!#great#!!#less#!/label!#great#!!#less#!input type=!#quote#!text!#quote#! id=!#quote#!productForm-'+prodFormNumber+'-DetailsDF0!#quote#! formlocation=!#quote#!productForm-'+prodFormNumber+'-Link!#quote#! style=!#quote#!width:100%!#quote#! onchange=!#quote#!if(!$(this).val()||$(this).val().trim().length === 0 ){$(this).val(!#singlequote#!!#singlequote#!);$(!#singlequote#!#productForm-'+prodFormNumber+'-AttachLI !#great#! .prodTitle!#singlequote#!).html(!#singlequote#!Test Product12345!#singlequote#!);}else{$(!#singlequote#!#productForm-'+prodFormNumber+'-Link!#singlequote#!).html($(this).val());$(!#singlequote#!#productForm-'+prodFormNumber+'-AttachLI !#great#! .prodTitle!#singlequote#!).html($(this).val());}!#quote#! class=!#quote#!form-control input-required mb-2 validate valid!#quote#! required=!#quote#!!#quote#! value=!#quote#!Test Product12345!#quote#!!#great#!!#less#!/div!#great#!",'+
						             '"'+prodFormHtml+'"'+
						              '],'+
						  '"JavaScript":"None"}'
						 







   return newProductJSONString ;



}

////////////////////////////////////////
function productMaterialize(){  
   var LegacyHTMLClass = '.legacyHTML';
   var undefinedInputID = 0
   
    $(LegacyHTMLClass).each(function(){
		   /////Convert TextArea
		   $(this).find('textarea').each(function(){
		      //// Add class'
		        $(this).addClass('form-control');
		        $(this).addClass('mb-2');
		        $(this).attr('rows','10');
		        $(this).attr('readonly','readonly');
		        
		        		   });
		   /////Convert Singleline Text
		   $(this).find('input[type*="text"]').each(function(){
		      //// Add class'
		        $(this).addClass('browser-default');
		        $(this).addClass('form-control');
		        $(this).addClass('mb-2');
		         $(this).attr('readonly','readonly');
		        
		        		   });
		       		   
		     /////Convert Select
		   $(this).find('select').each(function(){
		      //// Add class'
		        $(this).addClass('form-control');
		        $(this).addClass('mb-2');
		         $(this).attr('readonly','readonly');

		        
		        		   });
     		    
		     /////Convert checkbox
		   $(this).find('input[type*="checkbox"]').each(function(){
		      var inputID = $(this).attr('id'); 
		      var inputLabel = $('label[for*="'+inputID+'"]').html()
		     
		        
		      if(inputLabel != undefined ){ 
		            var inputVlue = $(this).val();
		            var isChecked  = '';
		                 if($(this).attr('checked') != undefined){
		                   isChecked  = 'checked=""';
		                 }
		              ///Add new chcekcbox
		              $('<div  class="custom-control custom-checkbox materialized-cbx" style="padding-bottom:10px">'+
                    '<input type="checkbox" '+isChecked  +' disabled value="'+inputVlue +'" id="'+inputID+'-materialized" class="custom-control-input"/>'+
		            '<label for="'+inputID+'-materialized" class="custom-control-label mb-2">'+inputLabel+'</label>'+
		            '</div>').insertBefore(this)
		            ////remove Input and Label
		                 $('label[for="'+inputID+'"]').hide(); 
		                    		            
		       }else{
		        undefinedInputID += 1;
		        inputID = "productCBX"+undefinedInputID; 
		        $(this).attr('id',inputID );
		         //// Add class'
		        $(this).addClass('custom-control-input');
		         //update HTML
		        $('<div class="custom-control custom-checkbox custom-control-inline materialized-cbx" style="margin-right:0px" id="'+inputID+'-wrap"></div>').insertBefore(this);
		        var detachedInput = $(this).detach();
		        var detachedLabel = '<label for="'+inputID+'" class="custom-control-label mb-2"  style="font-weight:bold;padding-left:14px">&nbsp;</label>';
		        $('#'+inputID+'-wrap').append(detachedInput );
		        $('#'+inputID+'-wrap').append(detachedLabel );
                $(this).prop('disabled',true);
		       }
		          

		        		   });
		    ////////////////////////////////////////////////////    		   
    })	   
     		   
}
////////////////////////////////////////
function converServiceHTML_LI(detailHTML,detailName){ 
var fieldLabel = "";
var fieldValue  ="";
var fieledType ="";
var productLI = "";
var detailHTML = detailHTML
   
/////set fields
$(detailHTML).find('input').each(function(){
 fieledType = $(this).attr('type')
 
  productLI += '<li class="list-group-item"><b style="font-weight:bold!important">'+fieldLabel+': </b>'+fieledType +'</li>'

});
$(detailHTML).find('textarea').each(function(){
if(fieldLabel ==""){
 fieldLabel = $(this).prev("h4").last().html();
 }

if(fieldLabel ==undefined || fieldLabel ==""){
 //fieldLabel = detailName+' Detail'
 }else{
 //fieldLabel = fieldLabel.substring(0,fieldLabel.indexOf(':'))
 }
 
  fieldValue  = $(this).val()
  productLI += '<li class="list-group-item"><b style="font-weight:bold!important">'+fieldLabel+': </b>'+fieldValue+'</li>'

});





productLI = detailHTML
 
return productLI  ;
}
/////////////////////////////////////////
function convertToHtml(markup){
		if (markup && markup.length > 0){
			markup = markup.replace(/\[/g, '<');
			markup = markup.replace(/\]/g, '>');		
			return markup;
		}
		else {
			return '';
		}
	}
////////////////////////////////////////////////////
function getLegacyAttachments(QueryListURL ,itemId){ 
    var legacyAttachmentLink =""
				    var att ="";
 
  $().SPServices({
				operation:'GetAttachmentCollection',
				async: false,
				listName: "ProjectDetail",
				ID: itemId,
				webURL: QueryListURL ,
				completefunc: function (xData, Status) {
				    // fileList = [];
				    // fileList.push('<ul>');
				 
					 $(xData.responseXML).find("Attachment").each(function() {
					 	    att = $(this).text();
					    var longLink = att.split("/");
					    
					    var fileName =  att.substring(att.lastIndexOf('/')+1)
					    var docicon = 'fa-file-o';
						   legacyAttachmentLink += '<tr><td><a href="'+att +'" target="_blank" class="ReLink"  ><i class="fa '+docicon+'" aria-hidden="true"></i> '+fileName +'</a></td></tr>' 
						   	                     
					});
				 
                   
	             	 	
 
				}
				  
			});
		
 	return legacyAttachmentLink; 
 

}
////////////////////////////////////////////////////	
  function loadProjectWorkflow(QueryListURL){
   /////2021 redesign of the Communication Calendar 
   ///has workflow data 
 
	    var query = "<Query><Where><Eq><FieldRef Name='Project' LookupId='true' /><Value Type='Lookup'>" +userSelectedRequest  + "</Value></Eq></Where>";
	    query = query + "<OrderBy><FieldRef Name='ows_ID'  /></OrderBy></Query>";
	    project_workflow =[];
	    //title text
        var title = [
                 '[Program Office Approval] Office Director Comments:',
                 '[Program Office Approval] Associate Administrator Comments:',
                 '[OCCI Approval] Communication Services Comments:',
                 '[OCCI Approval] Consumer Information Comments:',
                 '[OCCI Approval] Media Relations Comments:',
                 '[OCCI Approval] OCCI Associate Administrator Comments:',
                ]; 
        var approverNames = [];
        var approverComment = [];
        var approverDate = [];
        var approverHistory= [];
	    $().SPServices({
	        operation: "GetListItems",
	        listName: "OCCIRequestWorkflow",
	        webURL: QueryListURL ,
	        async: false,
	        CAMLQuery: query,
	        completefunc: function (xData, Status) { 
	            //alert(xmlToString(xData.responseXML));  
	            var index = 0;
	            $(xData.responseXML).SPFilterNode('z:row').each(function(){
	               var x = $(this); 
	               var idx = parseInt(x.attr("ows_ID"));       
	               project_workflow[index] = {
	                	"ID":idx,
	                	"Project" : x.attr("ows_Project"),
	                	"P1Comment" : x.attr("ows_P1Comment"),
	                	"P1ApprovedBy" : x.attr("ows_P1ApprovedBy"),
	                	"P1Date" : x.attr("ows_P1Date"),
	                	"P2Comment" : x.attr("ows_P2Comment"),
	                	"P2ApprovedBy" : x.attr("ows_P2ApprovedBy"),
	                	"P2Date" : x.attr("ows_P2Date"),
          		        "P3Comment" : x.attr("ows_P3Comment"),
	                	"P3ApprovedBy" : x.attr("ows_P3ApprovedBy"),
	                	"P3Date" : x.attr("ows_P3Date"),
	                	"P4Comment" : x.attr("ows_P4Comment"),
	                	"P4ApprovedBy" : x.attr("ows_P4ApprovedBy"),
	                	"P4Date" : x.attr("ows_P4Date"),
	                	"P5Comment" : x.attr("ows_P5Comment"),
	                	"P5ApprovedBy" : x.attr("ows_P5ApprovedBy"),
	                	"P5Date" : x.attr("ows_P5Date"),
	                	"P6Comment" : x.attr("ows_P6Comment"),
	                	"P6ApprovedBy" : x.attr("ows_P6ApprovedBy"),
	                	"P6Date" : x.attr("ows_P6Date"),
	                	"HistoryRejected" : x.attr("ows_HistoryRejected")

	                };
	                     
	 $.each(title , function( index, value ) {
	      var personIndex = index+1
   	                     approverNames.push(x.attr("ows_P"+personIndex+"ApprovedBy"));
                         approverComment.push(x.attr("ows_P"+personIndex+"Comment"));
                         approverDate.push(x.attr("ows_P"+personIndex+"Date"));
                         approverHistory.push(x.attr("ows_HistoryRejected"));

                 });
	                
	                index++;
	
	            });
				
	        }
	    });  
	    
 
$.each(approverNames, function( index, value ) {

	 var rejected_at = parseInt(approverHistory[index ]);
	 if( rejected_at == undefined ){
    			rejected_at = -1;
    		}else{
    		     rejected_at += -1
    		}
    		
     var comm = '';
         comm = unescape(approverComment[index ])

     var approverResponse = '';
     //image file
     
				if( index == rejected_at){
	                approverResponse = "<img src='img/delete.png' alt='Declined' />"+"<span style='color:red!important' class='project_name'>Declined</span> "
				}
				else{
					approverResponse = "<img src='img/approve.png' alt='Approved' />"+"<span style='color:limegreen!important' class='project_name'>Approved</span> ";
					
				}
				
	     
	  var convertedApprovalDate = approverDate[index ];
	  var convertedApproverName =  approverNames[index ];
	  if(convertedApproverName != undefined){
	    convertedApproverName  = convertedApproverName.substring(convertedApproverName.indexOf('#')+1)
	  }else{
	    convertedApproverName =""
	  }
	  

	 

    	 $('#RequestDetail-1 > .card > .card-body').append(   	 
    	 '<li class="list-group-item">'+
    	 '<b>'+approverResponse +'</b></br>'+
    	 '<span style="color:#3b5998!important"><b>'+convertedApproverName+'</b></span></br>'+
    	 '<b style="font-weight:bold!important"> '+title[index]+' </b></br>'+
    	 convertedApprovalDate+'</br>'+
    	 '<div style="padding:30px"><i>'+comm+'</i></div></li>'
    	 )
    /////////////////////////////////////////
   	})  
	  
     if( project_workflow == ""){
        $('#RequestDetail-1 > .card > .card-body').append(   	 
    	 '<li class="list-group-item">'+
    	 '<b>No Workflow Data Found</b>'+
    	 '</li>'
    	 )

     }
	    

	 

    }
    
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function getLegacySubsiteData(queryList,jobID,QueryListURL ){                               
    ////////////////SPServices Get List Items
 //alert(queryList)
    ////////Test Variables 
            // jobID ="18-0013733";
             //QueryListURL ="/teams/dev-nhtsa-occiwf/subsite2";
             //queryList ="Subsite Archive";
             ////////
      
     var hasJOBContent = false;
      // var folderNameArry = ["14-0010509-WInter Driving Tips -- Analysis/Announcements"];
    var folderNameArry = ["18-0013405-201 Motorcycles TSF Sheet/Shared Documents",
                          "18-0013405-201 Motorcycles TSF Sheet/Shared Documents/Documents",
                          "18-0013405-201 Motorcycles TSF Sheet/Shared Documents/Documents/Final",
                          "18-0013405-201 Motorcycles TSF Sheet/Shared Documents/Documents/Designer",
                          "18-0013405-201 Motorcycles TSF Sheet/Shared Documents/Documents/Designer/versions"
                          ];
                          
                          
     folderNameArry  = getArchvieFolderNames(queryList,jobID,QueryListURL);                     
    //var folderNameArry = ["18-0013405-201 Motorcycles TSF Sheet"];
    
    ///empty Legacy files
         $('#legacy-Files > .card').empty();
         var subSiteFolders =[];
         archiveJobsiteFolders = [];
         var folderCount =-1;
    $.each(folderNameArry,function(index,value){
      var folderFileDirRef = QueryListURL+'/'+queryList+'/'+value;
      //var DocumentQuery = '<Query><Where><Eq><FieldRef Name="FileDirRef"/><Value Type="Text">'+folderFileDirRef+'</Value></Eq></Where><OrderBy><FieldRef Name="Created" Ascending="False" /></OrderBy></Query>'
      var DocumentQuery = '<Query><OrderBy><FieldRef Name="Created" Ascending="False" /></OrderBy></Query>'
     
         $().SPServices({

            operation: "GetListItems",

            async: false,

            listName: queryList,
 
            CAMLQuery:DocumentQuery ,
	        webURL: QueryListURL ,
            CAMLViewFields: "<ViewFields Properties='True' />",
               //CAMLRowLimit: 1,
            CAMLQueryOptions: "<QueryOptions><Folder>" + folderFileDirRef + "</Folder></QueryOptions>",//'<QueryOptions><ViewAttributes Scope="Recursive"/></QueryOptions>',
          //  CAMLQueryOptions: '<QueryOptions><ViewAttributes Scope="Recursive"/></QueryOptions>',
            completefunc: function (xData, Status) {
              $(xData.responseXML).SPFilterNode("z:row").each(function() { 
               var currentFolder = $(this).attr("ows_FileDirRef").substring($(this).attr("ows_FileDirRef").lastIndexOf('/')+1);
               var currentFolderDirectory =  value.substring(value.indexOf('/')+1);
               var docicon = $(this).attr("ows_DocIcon")  ;
                   hasJOBContent = true;
                    
                    if ( $(this).attr("ows_FileDirRef").indexOf("Site Pages") < 0 && $(this).attr("ows_FileDirRef").indexOf("Site Assets") < 0 && docicon != undefined){
                       if(jQuery.inArray(currentFolder , subSiteFolders) === -1){  
                       
                            subSiteFolders.push(currentFolder);
                            folderCount +=1;
                            ///create new Header
                           $('#legacy-Files > .card').append( 
                           '<!-- Card header -->'+
					           '<div class="card-header" role="tab" id="JobSection-Header'+folderCount +'">'+
					              '<a class="collapsed" data-toggle="collapse" data-parent="#legacy-Files" href="#JobSection'+folderCount +'" aria-expanded="false"'+					       
					               ' aria-controls="JobSection'+folderCount +'">'+
					                '<h3 style="font-size:22px;color:rgb(59, 89, 152)" class="mb-0">'+
					                  '<span style="font-weight:600"><i class="fa fa-folder-o" aria-hidden="true"></i> '+currentFolderDirectory +
					                '</span><i class="fas fa-angle-down rotate-icon"></i>'+
					                '</h3>'+
					             ' </a>'+
					            '</div>'+  
					            
					               '<!-- Card body -->'+
						            '<div id="JobSection'+folderCount +'" class="collapse" role="tabpanel" aria-labelledby="JobSection-Header'+folderCount +'" data-parent="#legacy-Files">'+
						              '<div style="padding-top:0px;padding-left:40px;padding-bottom:5px;" class="card-body">'+
						                        '<div >'+
						                   '</div>'+
						                 '<ul id="LegacyUL'+folderCount+'" class="list-group list-group-flush">'+
						                 
						
						          '</ul>'+
						            '</div>'+
						            '</div>'


					            )

                            
                         }
                   }; 
			          
			            //////////////////////////////////////////////////
			             }) ;
			      $(xData.responseXML).SPFilterNode("z:row").each(function() {		               
			              			 var Document_ID = $(this).attr("ows_ID");
								      var Document_Name =$(this).attr("ows_FileLeafRef").substring( $(this).attr("ows_FileLeafRef").indexOf('#')+1);   
								      var Document_URL = window.location.protocol + "//" + window.location.host + "/" + $(this).attr("ows_FileDirRef").substring($(this).attr("ows_FileDirRef").indexOf('#')+1)+"/"+Document_Name;
								      var DocumentLink = $(this).attr("ows_FileRef").substring( $(this).attr("ows_FileRef").indexOf('#')+1);
                                      var currentFolder = $(this).attr("ows_FileDirRef").substring($(this).attr("ows_FileDirRef").lastIndexOf('/')+1);
                                      

                                     ///set document icon
                    				var docicon = $(this).attr("ows_DocIcon")  ;
                    			    if(docicon != undefined){	
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
			                        }
                                                var liIndex = "";
                                     
			                       $(subSiteFolders).each(function(index,value){
			                         //legacy-Files
	              		                   if(value == currentFolder ){
	              		                      liIndex = index;
	              		                    }
			                            }) 
			                             if ( $(this).attr("ows_FileDirRef").indexOf("Site Pages") < 0 && $(this).attr("ows_FileDirRef").indexOf("Site Assets") < 0 && docicon !== undefined){
                                      			  $('#LegacyUL'+liIndex ).append('<a target="_blank" class="ReLink" href="'+ Document_URL+'"><i class="fa '+docicon+'" aria-hidden="true"></i> '+Document_Name+'</a>'+'</br>')    
			                                  }
                                     });
 
			               ///////////////////////////////////////////////////////       
			            }
			           })   
               ///////////////////////////////////////////////////////////////////////////////////

          });//End each Folder Name
          if(hasJOBContent == false){
             $('#legacy-Files > .card').append(
               '<li class="list-group-item">'+
		    	 '<b>No Job Content Data Found</b>'+
		    	 '</li>'

             );
          }
}
//////////get Archive Folder names that have files 
function getArchvieFolderNames(queryList,jobID,QueryListURL){
 //jobID = '18-0013405';
       
     var DocumentQuery = '<Query>'+
                          '<Where><Contains><FieldRef Name="FileLeafRef"/><Value Type="Text">'+jobID+'</Value></Contains></Where>'+
                          '<OrderBy><FieldRef Name="Created" Ascending="false" /></OrderBy>'+
                         '</Query>'
        var subFolderArray =[];
            
        
         var currentFolder= "";
        $().SPServices({
            operation: "GetListItems",
            async: false,
            listName: queryList, 
            CAMLQuery:DocumentQuery ,
	        webURL: QueryListURL ,
            CAMLViewFields: "<ViewFields><FieldRef Name='FileLeafRef' /><FieldRef Name='LinkFilename' /></ViewFields>",
            CAMLRowLimit: 1,
            completefunc: function (xData, Status) { 
             $(xData.responseXML).SPFilterNode("z:row").each(function(index,value) {  
                   currentFolder = $(this).attr("ows_LinkFilename");
                   currentFolder = currentFolder.substring(currentFolder.indexOf('#')+1);
                   //////////Get Sub Folders
                    archiveJobsiteFolders.push(currentFolder);
                    getArchvieSubFolderNames(queryList,currentFolder ,QueryListURL)
                     

                  ///////////////////////////////////////// End of Subfolder Folder Query
       
             
            /////////////////////////////////////////////////////// End of Main Folder Query
                          })       
			            }
			           })   
               ///////////////////////////////////////////////////////////////////////////////////
               
              return archiveJobsiteFolders  ;  
	   
		  
};
function checkArchiveFolder(queryList,currentParentFolder,QueryListURL,archiveFolderArray){
       
		$.each(archiveFolderArray, function(index, value){
	          if(jQuery.inArray(value, archiveJobsiteFolders) == -1){
	             archiveJobsiteFolders.push(value);
	              getArchvieSubFolderNames(queryList,value ,QueryListURL)

	          }
             		          
  	
		})

}
function getArchvieSubFolderNames(queryList,currentParentFolder,QueryListURL){
 var DocumentQuery = '<Query>'+
                          '<OrderBy><FieldRef Name="Created" Ascending="false" /></OrderBy>'+
                         '</Query>';
                         
   var foundSubFolderCount = 0;
   var newfoundFolderArray = [];
    
   $().SPServices({
            operation: "GetListItems",
            async: false,
            listName: queryList, 
            CAMLQuery:DocumentQuery ,
	        webURL: QueryListURL ,
            CAMLViewFields: "<ViewFields Properties='True' />",
            CAMLQueryOptions: "<QueryOptions><Folder>"+queryList+"/"+currentParentFolder+"</Folder></QueryOptions>",            
            completefunc: function (xData, Status) { 
             $(xData.responseXML).SPFilterNode("z:row").each(function(index,value) { 
             //////////////////////
                var docicon = $(this).attr("ows_DocIcon")  ;
                    if(docicon == undefined){
		              var foundFolder =  currentParentFolder+'/'+$(this).attr("ows_LinkFilename");
		               foundSubFolderCount +=1;
                       newfoundFolderArray.push(foundFolder )
                      
		           
		            
		           }

         
             ////////////////////////////////////////////////////
           })  ;
            
         ///////////////////////
     
	     }
    })   

           ////////Find Extra folders
    
    
      checkArchiveFolder(queryList,currentParentFolder,QueryListURL,newfoundFolderArray )
   
            
        //  return newfoundFolderArray ;
      
}
//////////////////////////////////////////////////////////////// 
function setProductionStage(requestStatusValue){
   var defaultOption = '<option value="">Select a Production Stage</option>';
   var returnOptions = defaultOption ;
   var queryList ="Production Stages";
   var queryFilter ='<Query><OrderBy><FieldRef Name="Title" Ascending="True" /></OrderBy></Query>';
           $().SPServices({
            operation: "GetListItems",
            async: false,
            listName: queryList,
            CAMLQuery:queryFilter,
            CAMLViewFields: "<ViewFields Properties='True' />",
            completefunc: function (xData, Status) {
              $(xData.responseXML).SPFilterNode("z:row").each(function() {
                  var selectOption = '<option value="'+$(this).attr("ows_ID")+'">'+$(this).attr("ows_Title")+'</option>';
                      returnOptions+= selectOption ;
               })
              }
             }) 
             
             if(requestStatusValue == 'Production Approved'){
                  $('#ProductionStageInput').prop('disabled', false); 
             }else{
                  $('#ProductionStageInput').prop('disabled', true);
             }
             
         $('#ProductionStageInput').empty();
         $('#ProductionStageInput').append(returnOptions)


}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function filterProductionStatus(stageID){//alert(stageID)
   
   var defaultOption = '<option value="" >Select a Production Stage</option>';
   var returnOptions = defaultOption ;
   var queryList ="Production Status";
   var queryFilter ='<Query><Where><Eq><FieldRef Name="Production_x0020_Stage_x003a_ID"/><Value Type="Text">'+stageID+'</Value></Eq></Where><OrderBy><FieldRef Name="Title" Ascending="True" /></OrderBy></Query>';
           $().SPServices({
            operation: "GetListItems",
            async: false,
            listName: queryList,
            CAMLQuery:queryFilter,
            CAMLViewFields: "<ViewFields Properties='True' />",
            completefunc: function (xData, Status) {
              $(xData.responseXML).SPFilterNode("z:row").each(function() {
                  var selectOption = '<option value="'+$(this).attr("ows_ID")+'">'+$(this).attr("ows_Title")+'</option>';
                      returnOptions+= selectOption ;
               })
              }
             }) 
              
         if(stageID != "" && stageID != undefined){ 
         $('#PublicationStatusInput').prop('disabled', false); 
         $('#PublicationStatusInput').empty();
         $('#PublicationStatusInput').append(returnOptions)
         }else{
         $('#PublicationStatusInput').prop('disabled', true);   
         $('#PublicationStatusInput').empty();
         $('#PublicationStatusInput').append('<option value="" selected >Select a Production Stage</option>' )
         }

}
//////////////////////////////////////////////////////////////////////////////////////////////
function saveStatusUpdates(){
           var updatedLog ="";
           var updated_RequestStatus =$("#RequestStatusInput").val();
           if(updated_RequestStatus != undefined && updated_RequestStatus != ""){updatedLog += "Request Status: "+updated_RequestStatus };
           var updated_ProductionStage =$("#ProductionStageInput").val();
           if(updated_ProductionStage != undefined && updated_ProductionStage != ""){updatedLog += ";br Production Stage: "+$("#ProductionStageInput option:selected").text()};
           var updated_ProductionStatus =$("#PublicationStatusInput").val();
           if(updated_ProductionStatus != undefined && updated_ProductionStatus != ""){updatedLog += ";br Production Status: "+$("#PublicationStatusInput option:selected").text() };
           var updated_ProductionContacts = "";
           ////upate status to Complete when job is complete
           var  ProductionStatusText = $("#PublicationStatusInput option:selected").text();
               if(ProductionStatusText == "Job Complete"){
                  updated_RequestStatus = "Complete";
                  $("#RequestStatusInput").val("Complete").change();
               }
           
            
          ////set request 
          var requestSumaryValue="";
          if(updated_RequestStatus == "Saved" ){
             requestSumaryValue = "New Request";
          }else if(updated_RequestStatus == "Waiting for Production Approval" ){
             requestSumaryValue = "Approval Queue";
          }else if(updated_RequestStatus == "Production Approved" ){
             requestSumaryValue = "Production";
          }else if(updated_RequestStatus == "Rejected" ){
             requestSumaryValue = "Approval Queue";
          }else if(updated_RequestStatus == "Complete" ){
             requestSumaryValue = "Closed";
          }else if(updated_RequestStatus == "Canceled" ){
             requestSumaryValue = "Canceled";
          }else if(updated_RequestStatus == "Closed" ){
             requestSumaryValue = "Closed";
          };
          
           


      //////////////////////////////////////////////////////////                  
                            var SavePairs = [["Status",updated_RequestStatus ],
                                             ["Production_x0020_Stage",updated_ProductionStage],
                                             ["Production_x0020_Status",updated_ProductionStatus],
                                            // ["ProductionContacts",updated_ProductionContacts ],
                                             ["SummaryFilter",requestSumaryValue ],

                                                   ]
                                                    
                          
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: userSelectedRequest,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															   if(Status == "success"){
															        summaryAlerts('<b style="font-weight:bold!important">Success!</b> Your status update has been successfully saved','success'); 
															         if(updated_ProductionContacts != ""){summaryAlerts('<b style="font-weight:bold!important">Success!</b> Your Production Contacts have been successfully saved','success');}
															         updatestatusLog(updatedLog);
															        
															   }else{
															        summaryAlerts('<b style="font-weight:bold!important">Error!</b> There was an error while attempting to save your satus update','danger');
															         if(updated_ProductionContacts != ""){summaryAlerts('<b style="font-weight:bold!important">Error!</b> There was an error while attempting to save your Producton Contacts','danger');}
															   }
															}
														   })	

}
///////////////////////////////////////////////////////////////////////
//////request RequestEmails
  function requestEmailAlerts(alertType,alertTypeTo){
 
    var emailListTitle = "";
    var emailWorkflowAction = "";
    var emailListRequest;
    var emailTO = "" ;
    var emailRole = "" ;
    var emailSubject = "" ;
    var emailText = "" ;
    var emailWorkflowTemplate = "" ;
    
  if(alertType == "Status"){
        emailListTitle = "Send Email";
        emailWorkflowAction = "Status Update";
        emailListRequest = userSelectedRequest;
        emailTO = curUserTitle  ;
        emailSubject = "Request Submitted" ;
        emailText = "Request Submitted";
        emailWorkflowTemplate = 5;
   
   }else if(alertType == "Status-Production"){
        emailListTitle = "Send Email";
        emailWorkflowAction = "Status Update";
        emailListRequest = userSelectedRequest;
        emailTO = curUserTitle  ;
        emailSubject = "Status Update" ;
        emailText = "Status Update";
        emailWorkflowTemplate = 7;
   
   }else if(alertType == "New Team Member"){
        emailListTitle = "Send Email";
        emailWorkflowAction = "New Production Team Member";
        emailListRequest = userSelectedRequest;
        emailTO = ""  ;
        emailRole ="";
        if(alertTypeTo != "" && alertTypeTo != undefined){
          emailTO = alertTypeTo[0];
          emailRole = alertTypeTo[1];
        }
        
        emailSubject = "New Production Team Member" ;
        emailText = "New Production Team Member";
        emailWorkflowTemplate = 8;

   }else if(alertType == "Job"){
        emailListTitle = "Job#";
        emailWorkflowAction = "New Job#";
        emailListRequest = userSelectedRequest;
        emailTO = curUserTitle  ;
        emailSubject = "New Job#" ;
        emailText = "New Job#";
        emailWorkflowTemplate = 17;

   }else if(alertType == "HS"){
        emailListTitle = "HS#";
        emailWorkflowAction = "New HS#";
        emailListRequest = userSelectedRequest;
        emailTO = curUserTitle  ;
        emailSubject = "New HS#" ;
        emailText = "New HS#";
        emailWorkflowTemplate = 18;

   } 
 
 

       
  if(emailListRequest != undefined){
       var SavePairs = [["Title",emailListTitle],
                       // ["Workflow_x0020_Action",emailWorkflowAction],
                        ["Workflow_x0020_Template",emailWorkflowTemplate ],
                        ["Request",emailListRequest],
                        ["Email_x0020_Recipients",emailTO],
                        ["ProductionRole",emailRole],
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










//////////////////////////////////////////////////////////////////
  function summaryAlerts(Alertmsg, AlertmsgClass){  
  

   var requestFormAlertHtml ='<div class="alert alert-'+AlertmsgClass+' alert-dismissible fade show" role="alert">'+
            Alertmsg+
  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
    '<span aria-hidden="true">&times;</span>'+
  '</button>'+
'</div>' 
  

/////append alert
  $('#SummaryAlerts').append(requestFormAlertHtml )
    

}
function generateReqIDNumber(numberType,returnElement){
 
   var queryID;
   if(numberType == "HS"){
    queryID = 1;
   }else if(numberType == "Job"){
    queryID = 2;
   }else{
    queryID = "";
   };
   var queryList ="NumberGen";
   var queryFilter ='<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+queryID+'</Value></Eq></Where></Query>';
   var queryprefix ="";
   var queryNumber ="";
   var returnNumber ="";
   var returnCurrent="";
           $().SPServices({
            operation: "GetListItems",
            async: false,
            listName: queryList,
            CAMLQuery:queryFilter,
            CAMLViewFields: "<ViewFields Properties='True' />",
            completefunc: function (xData, Status) {
              $(xData.responseXML).SPFilterNode("z:row").each(function() {
                  queryprefix = $(this).attr("ows_Prefix");
                  queryNumber = $(this).attr("ows_Number");
                    
               })
              }
             });
             if(queryNumber != undefined){
                queryNumber = parseInt(queryNumber);
             }
                  if(numberType == "HS"){
                    queryNumber +=1;
				    returnNumber = queryprefix+" "+queryNumber ;
				     ///set job number
                    $('#HSStatus').html('<span style="color:#3b5998" >'+returnNumber +'</span>');
                    closeRequestAlert();

				   }else if(numberType == "Job"){
				    queryNumber +=1;
				    queryprefix = setFiscalYear();
				    returnNumber = queryprefix+"-00"+queryNumber ;
				    
				    ///set job number
                    $('#jobNumberStatus').html('<span style="color:#3b5998" >'+returnNumber +'</span>');
                    closeRequestAlert();
				    
				    };
			
			updateRequestNumbers(numberType,returnNumber, queryprefix ,queryNumber );
	  		

 
}
function setFiscalYear(){
 var newFiscalYear;
 var d = new Date();
 var month = d.getMonth()
 var year = d.getFullYear();
 if(month == 9 ||month == 10 || month == 11){  
	  year = Number(year)+1;
	   };
 if(year != undefined){ 
	     year = year.toString();
	     newFiscalYear = year.substring(2);
	    }	   
	   
	    
	//return month ; 
   return newFiscalYear;
};
 function getJobNumber(inputJobNumber){
 var returnedJobNumber =""; 

    if(inputJobNumber == undefined || inputJobNumber == ""){
     returnJobNumberFunction = "generateRequestAlert('#requestOptions','JOB#')"
     returnedJobNumber = '<span style="font-weight:bold">Job# </span><span id="jobNumberStatus"><a href="javascript:'+returnJobNumberFunction +'" style="color:#4285f4!important"><b>Generate Job#</b></a></span>'
     }else {
     returnedJobNumber = '<span style="font-weight:bold">Job# </span><span id="jobNumberStatus">'+inputJobNumber+'</span>';
     }
   return returnedJobNumber ;
  }
function getHSNumber(inputHSNumber){
  var returnedHSNumber ="";
  if(inputHSNumber == undefined  || inputHSNumber == "" || inputHSNumber == "None"){
     returnHSNumberFunction = "generateRequestAlert('#requestOptions','HS#')"
     returnedHSNumber  = ' | <span style="font-weight:bold">HS# </span><span id="HSStatus"><a href="javascript:'+returnHSNumberFunction+'" style="color:#4285f4!important"><b>Generate HS#</b></a></span>';
  }else{
     returnedHSNumber  = ' | <span style="font-weight:bold">HS# </span><span id="HSStatus">'+inputHSNumber+'</span>';
  } 
   return returnedHSNumber ;
  }
function generateRequestAlert(returnElement,alertType){
    if(alertType == "JOB#"){
       alertBody= "Are you sure you would like to create a new Job number?";
       alertButtons ='<button class="btn btn-primary" onclick="generateReqIDNumber('+"'Job'"+')"><b>Generate Job Number</b></button>';
   };
   if(alertType == "HS#"){
       alertBody= "Are you sure you would like to create a new HS number?";
       alertButtons ='<button class="btn btn-primary" onclick="generateReqIDNumber('+"'HS'"+')"><b>Generate HS Number</b></button>';
   };

    ////create alert modal  
var alertHtml = '<div class="alert alert-light alert-dismissible fade show alert-form" role="alert">'+
                         alertBody+ 
                         //'<hr>'+
                         '<div>'+alertButtons+'</div>'+
				  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
				    '<span aria-hidden="true">&times;</span>'+
				  '</button>'+
				'</div>';
					   

  $(returnElement).append(alertHtml);
  
  ///reset temporary variables
     tempAlertBody = "";
     tempAlertButton = "";

}
 function  closeRequestAlert(){
 
  $('.alert-form').alert('close');
 
 }
 ////update Job and HS numbers
 function updateRequestNumbers(numberType,NumberValue,QueryNumberPrefix, QueryNumberValue){
 ////set save value pairs
   var SavePairs;
   var numberSavePairs;
   var genNumberID;
  
   if(numberType == "Job"){
     SavePairs = [["Job_x0020_Number",NumberValue]];
     genNumberID = "2";
     numberSavePairs = [["Number",QueryNumberValue]];
   }else if(numberType == "HS"){
     SavePairs = [["HS",NumberValue]];
     genNumberID ="1"; 
     numberSavePairs = [["Prefix",QueryNumberPrefix],["Number",QueryNumberValue]];
   };
 ///

                     $().SPServices({
									operation: "UpdateListItems",
									listName: "NumberGen",
									ID: genNumberID ,
									batchCmd: 'Update',
									valuepairs: numberSavePairs,
									completefunc: function(xData, Status) {
									   if(Status == "success"){
                    
                     
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: userSelectedRequest,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															   if(Status == "success"){
															        summaryAlerts('<b style="font-weight:bold!important">Success!</b> Your '+numberType+' Number has been successfully saved','success'); 
															         if(numberType == "Job"){
                                                                         requestEmailAlerts(numberType )
																	   }else if(numberType == "HS"){
																	    requestEmailAlerts(numberType )
																	   };
 
															         
															         
                                                                  }else{
															        summaryAlerts('<b style="font-weight:bold!important">Error!</b> There was an error while attempting to save your '+numberType+' Number','danger')
															   }
															}
														   })	
                                     /////////////////////////////////////////////
                                     
                                  }
								}
							   })    

 
 };
 function addStatusPeoplePicker(ppReturnLocation,ppID,PPLabel){
 
  var peoplepickerHTML = '<div class="col col-4"><label for="'+ppID+'_TopSpan_EditorInput" >'+PPLabel+'</label>'+ 
                          '<div class="peoplePickerDiv" id="'+ppID+'"></div></div>';

  

 ///add to page 
 $(ppReturnLocation).append(peoplepickerHTML); 
 initializePeoplePicker(ppID);
 
 }
 //////////////////////////////////////
 // Format time as hh:mm:ss ap 
function formatAMPM(date) {
  var hours = date.getHours();
  var minutes = date.getMinutes();
  var ampm = hours >= 12 ? 'pm' : 'am';
  hours = hours % 12;
  hours = hours ? hours : 12; // the hour '0' should be '12'
  minutes = minutes < 10 ? '0'+minutes : minutes;
  var strTime = hours + ':' + minutes + ' ' + ampm;
  return strTime;
}

 /////////
 function getStatusLog(){
 var retrunValue;
      $().SPServices({
          operation: "GetListItems",
          async: false,
          listName: "Requests",                                  
          CAMLViewFields: "<ViewFields>" +
                           "<FieldRef Name='statusLog'/>"+
                            "</ViewFields>",                           
           CAMLQuery:'<Query><Where><Eq><FieldRef Name="ID"/><Value Type="Counter">'+userSelectedRequest+'</Value></Eq></Where></Query>',       
            completefunc: function (xData, Status) {                                       
            $(xData.responseXML).SPFilterNode("z:row").each(function() { 
             retrunValue = $(this).attr("ows_statusLog");
            
            })
           }
          });
   if(retrunValue == undefined){retrunValue =""}       
return  retrunValue; 
 }
 
 //////////////////////
 function updatestatusLog(statusUpdateValue){
 
 ///
 ///
  
 var currentDate = new Date();
 var currentMonthSave = currentDate.getMonth()+1; 
 var currentDaySave = currentDate.getDate(); 
 var currentYearSave = currentDate.getFullYear(); 
 var currentHourSave = formatAMPM(currentDate );
 var currentStatusInput = $('#RequestStatusInput').val();
 var saveDate = currentMonthSave +'/'+currentDaySave+'/'+currentYearSave+' '+currentHourSave  ;
 var saveStatusJSON = getStatusLog();
 var saveStatusJSONUser = curUserEmail ;
     saveStatusJSON+=',{"Name":"'+saveStatusJSONUser+'","Update":"'+statusUpdateValue+'","Date":"'+saveDate+'"}';
 var commaIndex = saveStatusJSON.indexOf(',');
     if(commaIndex == 0){saveStatusJSON = saveStatusJSON.substring(1)};
 var SavePairs = [["statusLog", saveStatusJSON],
                  ["StatusDate",saveDate ]
                    ];
     
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: userSelectedRequest,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status){
															  if(currentStatusInput == 'Production Approved'){              
														             requestEmailAlerts('Status'); 
														             requestEmailAlerts('Status-Production');
														           }else{
														             requestEmailAlerts('Status');
																	 
														
														           }       
                                                           ///////////////////////////////
															}
														   })	
                                     /////////////////////////////////////////////
                                     
                           

 
 
 }
 /////////////////////////////////////
function displayRequestStatus(){


///empty list
$('#StatusSectionList').empty();
        var  StatusJSON = getStatusLog();
        var  statusList = "";
             if(StatusJSON != undefined){
               var  StatusJSONValues  = JSON.parse("["+StatusJSON+"]");
                    $.each( StatusJSONValues , function( index, value ) {
                    var logName = value.Name;
                    var logDate = value.Date;
                    var logUpdate = value.Update;
                        if(logUpdate != undefined){logUpdate = logUpdate.replace(/;br/g,"</br>")}
                        statusList += '<li class="list-group-item"><b style="font-weight:bold!important">'+logDate +' '+logName+'</b></br>'+logUpdate+' </li>'; 
                     })
             };
    
       $('#StatusSectionList').append(statusList );


   
                    


};
/////////get prod contacts
function getProdContacts(){
 $('#ProductonSectionList').empty();   
    $.each( requestProdPOCList , function( index, value ) {
                ///set POC data
                var pocName = value.Name;
                var pocRole = value.Role;
                $('#ProductonSectionList').append('<li class="list-group-item prodPOCItem"><b class="prodPOCRole" style="font-weight:bold!important">'+pocRole+'</b>: <span class="prodPOCName" >'+pocName+'</span></li>')
       });
  
              
}
/////////save prod contacts
function saveProdContacts(newUserPOCRole, newUserPOC ){
var updated_ProductionContacts = "";
var AssignedSAs = "";
var AssignedProductionTeamMembers = "";
var AssignedProductionManager = "";
if(newUserPOC == undefined ){
  newUserPOC = getPeoplePickerValue('prod-UserSelect');
  }else{
   newUserPOC = getPeoplePickerValue(newUserPOC );

  }
if(newUserPOCRole  == undefined){
    newUserPOCRole = $('#ProductionPOCRole').val();
    }
    var newPOCArry =[];
      if(newUserPOCRole != "" ){
          newPOCArry.push(newUserPOC);
          newPOCArry.push(newUserPOCRole);
         $('#ProductonSectionList').append('<li class="list-group-item prodPOCItem"><b class="prodPOCRole" style="font-weight:bold!important">'+newUserPOCRole +'</b>: <span class="prodPOCName" >'+newUserPOC +'</span></li>')
           }

           ///set POC Save Pairs                                          
                                ///generate Product Object
								     var POCArray =[];
								       $('.prodPOCItem').each(function(){
								          var pocName = $(this).find('.prodPOCName').html();
								          var pocRole = $(this).find('.prodPOCRole').html();
								          POCArray.push('{'+
								                             '"Name":"'+pocName+'",'+
								                              '"Role":"'+pocRole+'"'+
								                             '}')
								            if(pocRole == "Service Advisor"){
											AssignedSAs += pocName+';';
											}else if(pocRole == "Project Coordinator"){
											  AssignedProductionManager += pocName+';';
											}
											AssignedProductionTeamMembers += pocName+';';
											
								       });
								     var updated_ProductionContacts = POCArray.toString();
								         requestProdPOCList = JSON.parse("["+updated_ProductionContacts+"]");
                                 if(AssignedSAs != ""){
                                    AssignedSAs = AssignedSAs.substring(0,AssignedSAs.lastIndexOf(';'));                                     
                                 }
                                 if(AssignedProductionManager != ""){
                                    AssignedProductionManager = AssignedProductionManager.substring(0,AssignedProductionManager.lastIndexOf(';'));                                   
                                 }

                                 if(AssignedProductionTeamMembers != ""){
                                 AssignedProductionTeamMembers = AssignedProductionTeamMembers.substring(0,AssignedProductionTeamMembers.lastIndexOf(';'));
                                 }
                           
                                   //////////////////////////////////////////////////////////                  
                            var SavePairs = [["ProductionContacts",updated_ProductionContacts ],
                                             ["SA",AssignedSAs ],
                                             ["Status","Production Approved" ],
                                             ["SummaryFilter","Production" ],
                                             ["ProductionManager",AssignedProductionManager ],
                                             ["ProductionTeam",AssignedProductionTeamMembers ],
                                                   ]
                          
                                   //////////////////Sp Service Save

                                                  $().SPServices({
															operation: "UpdateListItems",
															listName: "Requests",
															ID: userSelectedRequest,
															batchCmd: 'Update',
															valuepairs: SavePairs,
															completefunc: function(xData, Status) {
															   if(Status == "success"){ 
															   ///reset assign to value
															     // SetUserFieldValue('ProductionPOCRole',"" ); 
															     clearProdRoleForm(); 
															     clearSAForm();
															     summaryAlerts('<b style="font-weight:bold!important">Success!</b> Your Production Contacts and Roles have been successfully Updated','success');
															     requestEmailAlerts('New Team Member',newPOCArry) 
															   }else{
															        summaryAlerts('<b style="font-weight:bold!important">Error!</b> There was an error while attempting to save your Producton Contacts and Roles','danger');
															   }
															}
														   })	

                        




};
////////////////Add new 
function createNewProductionTask(){
 var foundRole = $('#ProductionTaskRole').val();
 var productFormisValid =  validateProductionTaskForm();
 var taskEmailTitle= $('#ProductionTaskInput').val();
 var taskEmailBody= $('#ProductionTaskDesc').val();
 if(productFormisValid == "Yes"){
 $('.taskConfigPoc:checked').each(function(){
 ///set Workflows Active Variables
 var WFActive_AssignedTo = $(this).val(); 
 var WFActive_Title = $('#ProductionTaskInput').val();
 var WFActive_Desc = "This is a single Production Task assigned to this Request's "+foundRole+".";
 var WFActive_Logic = '{"WorkflowSteps":{"title":["Step 1"]},'+
                       '"WorkflowConditions":{"id":[""],'+
                       '"stepID":[""],'+
                       '"conditonMod":[""],'+
                       '"arg1":[""],'+
                       '"comparison":[""],'+
                       '"arg2":[""]},'+
                       '"WorkflowAction":{"id":["2"],'+
                       '"stepID":["workflowStep1"],'+
                       '"emailTo":["'+WFActive_AssignedTo+'"],'+
                       '"TaskName":["'+taskEmailTitle+'"],'+
                       '"TaskMode":["Production"],'+
                       '"emailBody":["'+taskEmailBody+'"],'+
                       '"status":[""],"step":[""]},'+
                       '"ApprovedAction":{"id":["1"],'+
                       '"ActionWrapID":["approvalActionID1Approval"],'+
                       '"status":[""],'+
                       '"emailTo":["'+WFActive_AssignedTo+'"],'+
                       '"emailBody":["Approved"],"step":[""]},'+
                       '"RejectionAction":{"id":["4"],'+
                       '"ActionWrapID":["approvalActionID1Reject"],'+
                       '"status":[""],'+
                       '"emailTo":[""],'+
                       '"emailBody":[""],'+
                       '"step":[""]}}';
 var WFActive_Request = userSelectedRequest;
 var WFActive_Action = "";
 var WFActive_Status = '{"currentStatus":{"Steps":["In Progress"],'+
						 '"Actions":["In Progress"],'+
						 '"subActionsApproved":["Not Started"],'+
						 '"subActionsRejected":["Not Started"]}}';
 var WFActive_WFStatus = "In Progress";
 var WFActive_TaskDetails = '{"Action":{"Date":["Pending"],'+
							 '"Time":[""],'+
							 '"AssignTo":["'+WFActive_AssignedTo+'"],'+
							 '"Comment":[""]},'+
							 '"ApprovalTask":{"Date":["Pending"],'+
							 '"Time":[""],'+
							 '"AssignTo":["'+WFActive_AssignedTo+'"]},'+
							 '"RejectTask":{"Date":["Pending"],'+
							 '"Time":[""],'+
							 '"AssignTo":["'+WFActive_AssignedTo+'"]}}';
 var WFActive_ProductionTask = "Yes";
  var WFActive_Product = $('.ProductionTask-RadionBtn:checked').val();
 

 var WFActive_SavePairs = [["Title",WFActive_Title],
			                 ["Description",WFActive_Desc],
			                 ["Logic",WFActive_Logic],  
			                 ["Status",WFActive_Status],
			                // ["Current_x0020_Step",WFActive_Action],
			                 ["Request",WFActive_Request],
			                 ["WorkflowStatus",WFActive_WFStatus], 
			                 ["TaskDetails",WFActive_TaskDetails],  
			                 ["ProductionTask",WFActive_ProductionTask], 
			                 ["Product",WFActive_Product ],
                                    	  									                                                 
			                 ];
  ///set Workflows Action Variables 
 var WFAction_Title = WFActive_Title;
 var WFAction_Request = userSelectedRequest;
 var WFAction_Action = "Approval Request";
 var WFAction_Comments = "";
 var WFAction_EmailTo = WFActive_AssignedTo;
 var WFAction_HTML = $('#ProductionTaskDesc').val();;
 var WFAction_Status = "In Progress";
 var WFAction_Subject = WFActive_Title;
 var WFAction_PrimaryAction = "Yes";
 var WFAction_SavedActiveID = "";
 var WFAction_Product = $('.ProductionTask-RadionBtn:checked').val();
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
	                         ["Product",WFAction_Product ],
	                         ["Workflow_x0020_Template",9 ],
                            ];

 
          
                     //////Save to Workflow Active
                     ////////////////////////////////////////////////////////////////
                     $().SPServices({
						operation: "UpdateListItems",
						listName: "Workflows Active",
						batchCmd: "New",
						valuepairs: WFActive_SavePairs,
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
												completefunc: function(xData, Status) {	
												////Save Sucessful 
							                      if(Status == 'success'){
							                      alert('Task Saved' );
							                      getCurrrentlyAssignedWorkflows(WFAction_Request)
							                     
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
         
                })
         //     $('#wfIFrame-wrap').empty(); 
        // $('#wfIFrame-wrap').html('<iframe id="wfIFrame" style="display:none"  src="WorkflowWizard.aspx?request='+userSelectedRequest+'&startWF=118&prodWF=Yes"></iframe>');
         }else{
          	//summaryAlerts('<b style="font-weight:bold!important">Error!</b> There was an error while attempting to save your new Task','danger');
         }
}
////////////////////////////////////////////////
function updateWFStatus(newActiveWFID,newActiveWFTitle){
     if(newActiveWFID != undefined){
       //Workflow Started
    
        // resetTaskConfigurationForm();
   $('#assignTask-form').hide();
   $('#prodTasks-wrap').show()
   getCurrrentlyAssignedWorkflows(userSelectedRequest) ;
    summaryAlerts('<b style="font-weight:bold!important">Success!</b> Your Production Task has been successfully Updated','success');

   //alert(newActiveWFTitle+" Started");
     }else if(newActiveWFID == undefined){
       //Workflow Not Started
     //  alert(newActiveWFTitle+" Not Started")
     summaryAlerts('<b style="font-weight:bold!important">Error!</b> There was an error while attempting to save your new Task','danger');



     }

}
////send Production Task data to the workflow wizard
function getProdTaskDesc(){
  var foundDetails = [];
  var foundRole = $('#ProductionTaskRole').val();
      foundDetails.push(foundRole );
  var foundDesc = $('#ProductionTaskDesc').val();  
      foundDetails.push(foundDesc);  
  return foundDetails ;
}
function getProdTaskTo(){
   var foundTo = []
   $('.taskConfigPoc').each(function(){
   if($(this).is(':checked')){
       foundTo.push($(this).val());
       }
   });  
   
 
  return foundTo ;

}
/////////////////////////////////////////////////////
function getProducts_radioOptions(){  

   /////empty Products and Services Optiuons
     $('#productRadio-Options').empty();
     $('#TaskFormValidation').empty();
     $('.isInValid').removeClass('isInValid')
          var optionCount = 0;
  //////set None Option
      $('#productRadio-Options').append('<div  class="custom-control custom-radio ">'+
	     '<input type="radio" value="None" class="custom-control-input ProductionTask-RadionBtn" id="ProductionTask-Radios-none" name="ProductionTask-Radios" >'+
           '<label class="custom-control-label"  for="ProductionTask-Radios-none">None</label>'+
          '</div>')
    
     
  ////////add a option for each 
  $('.ProductName-Header').each(function (){
      var optionValue = $(this).html();
      var OptionProductID =$(this).attr("ProductID") 
      optionCount +=1;
         $('#productRadio-Options').append('<div  class="custom-control custom-radio ">'+
	     '<input type="radio" value="'+OptionProductID+';#'+optionValue +'" class="custom-control-input ProductionTask-RadionBtn" id="ProductionTask-Radios'+optionCount +'" name="ProductionTask-Radios" >'+
          '<label class="custom-control-label"  for="ProductionTask-Radios'+optionCount +'">'+optionValue +'</label>'+
         '</div>')
         })

   
}
/////////////////////////////////
function goToProduct(currentProductIDAttr){
   /// open products tab
     $('#RequestDetail-tab5').click();
    
   ///expand selected Product
   $("div[productid*='"+currentProductIDAttr+"']").collapse('show')
   var element = document.getElementById("RequestDetail-tab5");
       element.scrollIntoView({behavior: "smooth"});
  


}/////////////////////////////////
function validateProductionTaskForm(){
$('#TaskFormValidation').empty();
$('.isInValid').removeClass('isInValid')
var validationResult = "Yes"
var Alertmsg = "";
var requestFormAlertHtml = "";
var ProductTask_NameInput = $('#ProductionTaskInput').val();
var ProductTask_InstructionInput = $('#ProductionTaskDesc').val();
var ProductTask_Products = "";
    $('.ProductionTask-RadionBtn:checked').each(function(){
       ProductTask_Products = $(this).val();
    });
var ProductTask_Users ="";    
    $('.taskConfigPoc:checked').each(function(){
       ProductTask_Users += $(this).val()+';';
    });
 
      /////check if Task Name exists 
      if(ProductTask_NameInput == ""){
      $('#ProductionTaskInput').addClass('isInValid')
      Alertmsg = '<span style="font-weight:bold">Error!</span> Please enter a Task Name';
      validationResult ="No"; 
	  requestFormAlertHtml +='<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
            Alertmsg+
			  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
			    '<span aria-hidden="true">&times;</span>'+
			  '</button>'+
			'</div>'
		}	 
			
   /////check if Task Instructions exists textarea-required
      if(ProductTask_InstructionInput == ""){
      $('#ProductionTaskDesc').addClass('isInValid')
      Alertmsg = '<span style="font-weight:bold">Error!</span> Please enter Task Instructions';
      validationResult ="No";
	  requestFormAlertHtml +='<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
            Alertmsg+
			  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
			    '<span aria-hidden="true">&times;</span>'+
			  '</button>'+
			'</div>'
		}	 
			
  /////check if Task Products exists
      if(ProductTask_Products  == ""){
      $('#productRadio-Options').addClass('isInValid')
      Alertmsg = '<span style="font-weight:bold">Error!</span> Please select a Product or Service';
      validationResult ="No";
	  requestFormAlertHtml +='<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
            Alertmsg+
			  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
			    '<span aria-hidden="true">&times;</span>'+
			  '</button>'+
			'</div>'
		}	 
			
   /////check if Task Products exists
      if(ProductTask_Users  == ""){
      $('#taskUserWrap').addClass('isInValid');
      Alertmsg = '<span style="font-weight:bold">Error!</span> Please assign a User to this Task';
      validationResult ="No";
	  requestFormAlertHtml +='<div class="alert alert-danger alert-dismissible fade show" role="alert">'+
            Alertmsg+
			  '<button type="button" class="close" data-dismiss="alert" aria-label="Close">'+
			    '<span aria-hidden="true">&times;</span>'+
			  '</button>'+
			'</div>'
		}	 
			

	
 
/////append alert
if(validationResult == "No"){
  $('#TaskFormValidation').append(requestFormAlertHtml);	
  }

return validationResult;
}////////////////////////////////////////

function spItemRedirect(){
 var currentSummaryLink = window.location.href.substring(0,window.location.href.indexOf('SiteAssets'));
 var currentRequesteditLink = currentSummaryLink+'Lists/Requests/AllItems.aspx?FilterField1=ID&FilterValue1='+userSelectedRequest +'&FilterType1=Counter' ;
 window.location.href = currentRequesteditLink;
}
function forceRequestCancel(){
 $('#RequestStatusInput').val('Canceled');
  saveStatusUpdates();

}


function toggleMangeSPBtn(showBtn){
   $('#requestSPEditLink').hide();

}
     //toggleMangeSPBtn(true)
</script>
 

    

 

<style type="text/css">

#Summary-cover{

     display:block!important;

     height:400px;  

     background:linear-gradient( rgba(0, 0, 1,.5),rgba(0, 0, 1,.2)),  url('img/Picture1.jpg') no-repeat; 

     background-size:cover;

      background-position: center center;

}

#details-tabs {

    margin-bottom: 0px;

    background-color: #F1F2F3;

     

}

#details-tabs .nav-link.active {

    box-shadow: 0px 2px 5px 0px rgba(0,0,0,0.16), 0px 2px 10px 0px rgba(0,0,0,0.12);

    background-color: #F1F2F3;

    color: #262626;

    font-weight: bold !important;

}

#details-tabs .nav-link {

    color: #6e6e6e;

}

#requestSummaryTBL th{

  font-weight:bold;

  color:#3b5998

}

@media only screen and (max-width: 1000px) {

#JobRequests-TBLWrap{

overflow-x:auto;

}

}

table.dataTable tbody > tr.selected, table.dataTable tbody > tr > .selected{

background-color:  #E0E6F3

}

.avatar {

width:50px;

height:50px;

}

.chat-body{

width:90%

}

.card-noShadow{

box-shadow: 0px 0px 0px 0px rgba(0,0,0,0.16), 0px 0px 0px 0px rgba(0,0,0,0.12);

border:2px solid #dee2e6!important;

}

.sp-peoplepicker-topLevel {

height:40px!important;

width: 100%;;

}



 .ms-dlgContent

{

  position:fixed! important;

}

.sp-peoplepicker-topLevel, .sp-peoplepicker-topLevelDisabled, .sp-peoplepicker-autoFillContainer, .ms-inputBox{

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

.sp-peoplepicker-autoFillContainer{

z-index:100!important

}

.style1 {
	margin-left: 40px;
}
#requestTitle-Display{
	font-size:26px;
	font-weight:400!important;
}
.requestDesc-Display{
	font-size:16px;
	font-weight:300;
}
.alert-form{
	border:2px solid #dee2e6!important;
}
#clock{
	font-size:30px;
	font-weight:bold!important;
}
.dt-button{
	color:black!important;
	font-weight:600!important;
}
.pastDueDate {
	color:red!important;
	font-weight:bold!important;
}
#requestWell.alert-secondary {
background-color: #F1F2F3!important;	
}

#requestWell.alert-RequestWaiting{
 background-color:#f80!important;	
}
#requestWell.alert-RequestProduction{
 background-color:#4285f4!important;	
}
#requestWell.alert-RequestRejected{
 background-color:#ff3547!important;	
}
#requestWell.alert-RequestCompleted{
 background-color:#00c851!important;
}
.isInValid {
  border: 2px solid red!important;
}
 #requestSummaryTBL .custom-checkbox{
  padding-left:1.5rem;	
}	
 

</style>

    

 

    

    

</div>

    

 

    

    

</div>
	</asp:Content>
 
 


