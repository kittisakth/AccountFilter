({
	packItem : function(component, event, helper) {
		var item = component.get(v.item);
        item.Packed__c = true;
        component.set("v.item", item);
        
        var btn1 = event.getsource();
        document.getElementById(btn1.id).disabled = true;
	}
})