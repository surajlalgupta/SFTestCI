({
	submitExpense : function(component, event, helper) {
        var expensesList = component.get("v.Expenses");
        var newExp = component.get("v.NewExpense");
        expensesList.push(newExp);
		component.set("v.Expenses", expensesList);
        component.set("v.Num", component.get("v.Num") + 1);
        component.set("v.Total", component.get("v.Total") + component.get("v.NewExpense.Amount__c"));
	}
})