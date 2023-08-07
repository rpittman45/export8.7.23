  
  
  
  
  //toggleMangeSPBtn(true)
  function toggleReOpenButton() {
    var buttonIDSelector = document.getElementById('reOpen-LegacyBtn');
    if (queryStringView = "4") {
      ////Show Button
      buttonIDSelector.style.display = "inline-block";
    } else {
      ////Else hide button
      buttonIDSelector.style.display = "none";
    }
  }

  // Call the function to show or hide the button on page load or as needed
  toggleReOpenButton();

async  function updateStatus() {
            // SharePoint list URL ----- Update the URL to be relative
            var listUrl = "/teams/dev-nhtsa-occiwf"; 
            // Item ID to update
            var itemId = userSelectedRequest;
            // New status value
            var newStatus = "Production Approved";
            // SharePoint List I am writing to
            var splist = "Requests"
            // Construct the endpoint URL for the specific item
            var itemEndpointUrl = listUrl + "/_api/web/lists/getbytitle('"+splist+"')/items(" + itemId + ")";
            // Prepare the data for the update
            var itemData = {
                "__metadata": { "type": "SP.Data."+ splist + "ListItem" },
                "Status": newStatus
            };
            //get Digest
            async function getDigest() {
            var currentSite = window.location.href.substring(0, window.location.href.indexOf('/SiteAssets'));
              var fetchData = await fetch(currentSite + "/_api/contextinfo", {
               method: 'Post',
              headers: {
                "accept": "application/json; odata=verbose"
               }
              });
              var fetchJson = await fetchData.json();
               var FormDigestValue = fetchJson.d.GetContextWebInformation.FormDigestValue;
                return FormDigestValue;
            
                }
               var Digest = await getDigest()
              //console.log(Digest)
            // Perform the update operation using SharePoint REST API
          var getResponseData =  await fetch(itemEndpointUrl, {
                method: "PATCH",
                headers: {
                   
                    "Accept": "application/json; odata=verbose",
                    "Content-Type": "application/json; odata=verbose",
                    "X-RequestDigest": Digest,
                    "X-HTTP-Method": "MERGE",
                    "If-Match": "*"
                },
                body: JSON.stringify(itemData)
            })

           var responseData = await getResponseData ;
           console.log(responseData)
              if (responseData.ok) {
        // Success! Show the success message using summaryAlerts
        var alertMsgClass = 'success';
        var alertMsg = 'Update status successfully! Click <a href="' + listUrl + '/SiteAssets/RequestSummary.aspx?view=3" target="_blank"><b>here</b></a> to view in production.';
        
        summaryAlerts(alertMsg, alertMsgClass);
    } else {
        // Error! Show the error message using summaryAlerts
        var alertMsgClass = 'danger';
        var alertMsg = 'Failed to update status. Please try again later.';
        
        summaryAlerts(alertMsg, alertMsgClass);
    }
             
        }
