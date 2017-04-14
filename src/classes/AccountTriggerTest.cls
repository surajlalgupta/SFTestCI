@isTest
private class AccountTriggerTest{
    @isTest static void test(){
        List<Account> acc_list = new List<Account>();
        for (Integer i = 0; i<200; i++){
            Account acc = new Account(Name='Test '+String.valueOf(i));
            acc.billingstate = 'CA';
            acc_list.add(acc);
        }
        insert acc_list;
        acc_list = [select billingstate, shippingstate from account where billingstate = 'CA'];
        system.assertequals(acc_list.size(), 200);
        for (Account acc: acc_list){
            system.assertequals(acc.shippingState, 'CA'); 
        }
    }
}