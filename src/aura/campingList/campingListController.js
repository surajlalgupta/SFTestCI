({
    doInit : function(component, event, helper){
    	var action = component.get("c.getItems");
    	action.setCallback(this, function(response){
            if (component.isValid() && response.getState() === "SUCCESS"){
            	component.set("v.items", response.getReturnValue());    
            }
		});
        $A.enqueueAction(action);
    },
    handleAdditem : function(component, event, helper){
        var itm = event.getParam("item");
        var action = component.get("c.saveItem");
        action.setParams({
            'c': itm
        });
        action.setCallback(this, function(response){
            if(response.getState === "SUCCESS" && component.isValid()){
                console.log('success');
                var items = component.get("v.items");
                items.push(JSON.parse(JSON.stringify(itm)));
                component.set("v.items", items);
            }
        });
        $A.enqueueAction(action);
    }
})