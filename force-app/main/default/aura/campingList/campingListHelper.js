({
	createItem : function(component, newCamping) {
		var action = component.get("c.saveItem");
        action.setParams({
            "camping": newCamping
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            console.log(state);
            if (state === "SUCCESS") {
                var campings = JSON.parse(JSON.stringify(component.get("v.items")));
            	var item = JSON.parse(JSON.stringify(newCamping));
            	campings.push(item);
                component.set("v.items", campings);
                component.set("v.newItem",{'sobjectType':'Camping_Item__c',
                    'Name': '',
                    'Quantity__c': 0,
                    'Price__c': 0,
                    'Packed__c': false});
                }
        });
        $A.enqueueAction(action);
	}
})