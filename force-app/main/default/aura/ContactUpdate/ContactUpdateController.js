({
	doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getContact");
        var recordId = component.get("v.recordId");
        action.setParams({
            "ID": recordId
        });
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Contact", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    clickUpdate: function(component, event, helper) {
        var updateContact = component.get("v.Contact");
        var action = component.get("c.updateContact");
        action.setParams({
            "con": updateContact
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            console.log('test');
            if (state === "SUCCESS") {
                alert("Update success");
                location.reload();
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        $A.enqueueAction(action);
    }
})