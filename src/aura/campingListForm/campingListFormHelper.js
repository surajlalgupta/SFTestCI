({
	createItem : function(component, event) {
        var evt = component.getEvent("addItemEvent");
        evt.setParams({
            "item": component.get("v.newItem");
        });
        evt.fire();
		component.set("v.newItem", {'sobjectType': 'Camping_Item__c', 'Name': '', 'Price__c': 0.00, 'Quantity__c': 0});
	}
})