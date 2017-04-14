public class AccountTriggerHandler{
    private Static String str;
    public static void updateAccount(){
        for (Account acc: (List<Account>)Trigger.New){
            acc.Name = 'TestAccount';
        }
        str = 'Test';
    }
    public static void createContact(){
        List<Contact> ct_list = new List<Contact>();
        for (Account acc: (List<Account>)Trigger.New){
            Contact cnt = new Contact();
            cnt.AccountId = acc.Id;
            cnt.LastName = acc.Name;
            ct_list.add(cnt); 
        }
        insert ct_list;
    }
    public void printAccounts(){
        str = 'Test';
        system.debug((List<Account>)Trigger.New);
    }
    public class argumentList{
        public List<Account> act_list;
        public Boolean bool;
    }
}