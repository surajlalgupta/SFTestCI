public class BatchTutorialClass implements Database.Batchable<sObject>{
    public string query = '';
    public BatchTutorialClass(){
        query = 'Select Id, Name from Account';
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    public void execute(Database.BatchableContext bc, List<Account> scope){
        List<Contact> ct_list = new List<Contact>();
        for (Account acc: scope){
            Contact ct = new Contact();
            ct.LastName = acc.Name;
            ct.AccountId = acc.Id;
            ct_list.add(ct);
        }
        insert ct_list;
    }
    public void finish(Database.BatchableContext bc){
        system.debug('End of Batch');
    }
}