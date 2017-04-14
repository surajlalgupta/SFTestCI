({
	submitForm : function(component, event, helper) {
        var price = component.find("price").get("v.value");
        var qt = component.find("quant").get("v.value");
        var name = component.find("itemName").get("v.value");
        var isValid = true;
        if ($A.util.isEmpty(price)){
            component.find("price").set("v.errors", [{message: "Please Enter Price"}]);
            isValid = false;
        }
        if ($A.util.isEmpty(qt)){
            component.find("quant").set("v.errors", [{message: "Please Enter Quantity"}]);
            isValid = false;
        }
        if ($A.util.isEmpty(name)){
            component.find("itemName").set("v.errors", [{message: 'Please Specify a Name'}]);
            isValid = false;
        }
        if (isValid){
            helper.createItem(component, event);       
        }
	}
})