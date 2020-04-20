({
    
    doInit : function(component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    },
	clickCreateItem : function(component, event, helper) {
		var validCamping =component.find('expenseform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        
        if(validCamping) {
            var newCamping = component.get("v.newItem");
            helper.createItem(component, newCamping);
        }
	}
})