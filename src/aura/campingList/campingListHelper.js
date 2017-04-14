({
	createItem : function(component, event) {
		var action = component.get("c.saveItem");
        var itm = component.get("v.newItem");
        action.setParams({
            'c': itm
        });
        action.setCallback(this, function(response){
            if(response.getState === "SUCCESS" && component.isValid()){
                console.log('success');
                var items = component.get("v.items");
                var item = component.get("v.newItem");
                items.push(JSON.parse(JSON.stringify(item)));
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
	}
})