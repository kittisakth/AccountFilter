({
	doInit: function(component, event, helper) {
		var action = component.get("c.getAccounts");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log(response.getReturnValue());
                component.set("v.accounts", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        })
        $A.enqueueAction(action);
	}
})