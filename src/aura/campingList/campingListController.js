({  
clickCreateItem : function(component, event, helper) {
  
        // Create a new Expense, if it is valid
        var newItem = component.get("v.newItem");
        console.log(':::Below New item');
       var newItemRef = component.get("v.newItem");
       console.log("Create Camping Item: " + JSON.stringify(newItemRef));
        helper.createItem(component, newItem);

},

// Load expenses from Salesforce
doInit: function(component, event, helper) {

// Create the action (remote method call)
var action = component.get("c.getItems");

// Add callback behavior for when response is received
action.setCallback(this, function(response) {
    var state = response.getState();
    if (component.isValid() && state === "SUCCESS") {
        component.set("v.items", response.getReturnValue());
    }
    else {
        console.log("Failed with state: " + state);
        console.log(response + " ");
    }
});

    // Send action off to be executed (server request)
    $A.enqueueAction(action);
},

})