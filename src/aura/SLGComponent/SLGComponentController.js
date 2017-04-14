({
	calculate : function(component, event, helper) {
		var lbl = event.getSource().get("v.label");
        if (lbl == 'Calculate'){
            var num1 = parseInt(component.find("one").get("v.value"));
            var num2 = parseInt(component.find("two").get("v.value"));
            var num3 = parseInt(component.find("three").get("v.value"));
            var total = num1+num2+num3;
            component.find("total").set("v.value", total);
            var parentEvt = component.getEvent("totalSumEvent");
            parentEvt.setParams({
                "paramInt": total,
                "paramText": "Success"
            });
            parentEvt.fire();
        }
	}
})