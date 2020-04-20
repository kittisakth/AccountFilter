({
	updateContact: function(componet, contact) {
		var action = component.get("c.updateContact");
        action.setParams({
            "con": contact
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