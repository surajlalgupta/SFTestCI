public class BatchBackupCustomSettings implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {
    public string query;
    public Map<String, Schema.sObjectType> gd;
    public Integer count;
    public BatchBackupCustomSettings(){
        query = 'select name from CSList__c';
        gd = Schema.getGlobalDescribe();
        count = 0;
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        List<CSList__c> cslst = new List<CSList__c>();
        for (Schema.sObjectType s: gd.values()){
            Schema.DescribesObjectResult dsc = s.getDescribe();
            String nm = dsc.getName();
            if (dsc.isCustomSetting() && nm != 'CSList__c'){
                CSList__c cs = new CSList__c(name=nm);
                cslst.add(cs);
            }
        }
        upsert cslst;
        return Database.getQueryLocator(query);
    }
    public void Execute (Database.BatchableContext bc, List<CSList__c> scope){
        /*List<FieldStore__c> f_list = new List<FieldStore__c>();
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
        List<Database.UpsertResult> results = Database.upsert(f_list, FieldStore__c.Name, true);*/
    }
    public void finish (Database.BatchableContext bc){    
        system.debug('Batch completed');
    }
}