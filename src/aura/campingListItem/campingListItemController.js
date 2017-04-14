({
	packItem : function(component, event, helper) {
        var a = componet.get("v.item", true);
        a.Packed__c = true;
		component.set("v.item", a);
        var btn = event.getSource();
        btn.set("v.disabled", true);
	}
})