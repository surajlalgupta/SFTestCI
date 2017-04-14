public class BatchRetrieveFieldDesc implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {
    public string query;
    public Map<String, Schema.sObjectType> gd;
    public Integer count;
    public BatchRetrieveFieldDesc(){
        query = 'select name from ObjectStore__c';
        gd = Schema.getGlobalDescribe();
        count = 0;
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    public void Execute (Database.BatchableContext bc, List<ObjectStore__c> scope){
        List<FieldStore__c> f_list = new List<FieldStore__c>();
        for (ObjectStore__c o: scope){
            Map<String, Schema.SObjectField> fields = gd.get(o.Name).getDescribe().fields.getMap();
            for (String s: fields.keySet()){
                if (fields.get(s).getDescribe().isCustom()){
                    FieldStore__c f = new FieldStore__c();
                    f.Name = o.Name.remove('__c') +s.remove('__c');
                    f.Help_Text__c = fields.get(s).getDescribe().getInlineHelpText();
                    f_list.add(f);
                }
            }
        }
        count += f_list.size();
        system.debug(count);
        List<Database.UpsertResult> results = Database.upsert(f_list, FieldStore__c.Name, true);
    }
    public void finish (Database.BatchableContext bc){    
        system.debug('Batch completed');
    }
}