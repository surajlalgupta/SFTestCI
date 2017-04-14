({
	assignVals : function(component, event, helper) {
        var textVal = event.getParam("paramText");
        var intVal = event.getParam("paramInt");
        component.set("v.TextParam", textVal);
        component.set("v.IntegParam", intVal);
	}
})