({  
clickCreateExpense : function(component, event, helper) {

    if(helper.validateExpenseForm(component)) {
        // Create a new Expense, if it is valid
        var newExpense = component.get("v.newExpense");
        console.log(newExpense);
        helper.createExpense(component, newExpense);
    }
},

// Load expenses from Salesforce
doInit: function(component, event, helper) {

// Create the action (remote method call)
var action = component.get("c.getExpenses");

// Add callback behavior for when response is received
action.setCallback(this, function(response) {
    var state = response.getState();
    if (component.isValid() && state === "SUCCESS") {
        component.set("v.expenses", response.getReturnValue());
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