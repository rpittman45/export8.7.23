const filterAll_RoutingCodes = (RoutingCodeItem) => {
    let newRoutingCode = RoutingCodeItem;
  
    // Check if the RoutingCodeItem starts with "NHTSA-" or "NHTSA "
    if (RoutingCodeItem.startsWith("NHTSA-") || RoutingCodeItem.startsWith("NHTSA ")) {
      // Use regular expression to replace "NHTSA-" or "NHTSA " with an empty string
      newRoutingCode = newRoutingCode.replace(/NHTSA-/, "");
      newRoutingCode = newRoutingCode.replace(/NHTSA\s-\s/, "");
      newRoutingCode = newRoutingCode.replace(/NHTSA\s/, "");
    }
  
    // Shorten the character to match our standard
    if (newRoutingCode.length >= 6 && newRoutingCode.indexOf("N") === 0) {
      // Remove routing codes description
      if (newRoutingCode.lastIndexOf("-") > 3) {
        const descLastIndex = newRoutingCode.lastIndexOf("-");
        // Check if it has more than 2 hyphens
        if (descLastIndex >= 6) {
          newRoutingCode = newRoutingCode.substring(0, descLastIndex);
          const new_descLastIndex = newRoutingCode.lastIndexOf("-");
  
          // If remaining string still has a hyphen in the description
          if (new_descLastIndex > 3) {
            newRoutingCode = newRoutingCode.substring(0, new_descLastIndex);
          }
        }
      }
  
      // Add hyphen
      if (newRoutingCode.indexOf("-") !== 3 && newRoutingCode.indexOf("-") !== 4) {
        newRoutingCode = newRoutingCode.slice(0, 3) + "-" + newRoutingCode.slice(3);
      }
    }
  
    // Remove the "National Highway Traffic Safety Administration" after "NCO-200"
    if (newRoutingCode.startsWith("NCO-200")) {
      const descriptionIndex = newRoutingCode.indexOf("National Highway Traffic Safety Administration");
      if (descriptionIndex !== -1) {
        newRoutingCode = newRoutingCode.slice(0, descriptionIndex);
      }
    }
  
    // Remove the "OFFICE OF REGIONAL SERVICES" after "FTA-TRS-1"
    if (newRoutingCode.startsWith("FTA-TRS-1")) {
      const descriptionIndex = newRoutingCode.indexOf("OFFICE OF REGIONAL SERVICES");
      if (descriptionIndex !== -1) {
        newRoutingCode = newRoutingCode.slice(0, descriptionIndex);
      }
    }
  
    return newRoutingCode;
  };
  
  const modifiedRoutingCodes = routingCodes.map(filterAll_RoutingCodes);
  
  // Output the modified routing codes
  //console.log(modifiedRoutingCodes);
  
  ///////for Testing the filter function /////Not for Prod
    routingCodes.forEach(function(routingOption,routingIndex){    
      var newRoutingCode = filterAll_RoutingCodes(routingOption);
      console.log(routingIndex+ " " +newRoutingCode)
    })
   