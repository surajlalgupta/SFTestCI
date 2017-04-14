({
	createCon : function(component, event, helper) {
        var method = component.get("c.createContact");
        var con = component.get("v.con");
        method.setParams({
            "con": con
        });
        method.setCallback(this, function(result){
            component.set("v.con.Id", result.getReturnValue());
        });
		$A.enqueueAction(method);
	},
    fetchCons : function(component, event, helper) {
        var method = component.get("c.fetchContacts");
        var lname = component.find("lname").get("v.value");
        var conList = component.get("v.conList");
        method.setParams({
            "lname": lname
        });
        method.setCallback(this, function(result){
            /*for (int i =0; i < result.getReturnValue().length; i++){
                var c = result.getReturnValue()[i];
                conList.push(c);
            }*/
            component.set("v.conList", result.getReturnValue());
        });
		$A.enqueueAction(method);
	}
})