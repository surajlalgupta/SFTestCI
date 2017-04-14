public class BatchCreateBackupSObjects implements Database.Batchable<sObject>, Database.Stateful{
    public String query;
    public List<Schema.FieldSetMember> fs_SourceObj;
    public List<Schema.FieldSetMember> fs_TargetObj;
    public BatchCreateBackupSObjects (String name){
        String fs_name = name+'BatchFields'; 
        Map<String, Schema.sObjectType> gd = Schema.getGlobalDescribe();
        fs_SourceObj = gd.get(name).getDescribe().FieldSets.getMap().get(fs_name).getFields();          
        fs_TargetObj = gd.get('Backup__c').getDescribe().FieldSets.getMap().get(fs_name).getFields();
        query = 'Select ';
        for (Schema.FieldSetMember fs: fs_SourceObj){
            query += fs.getFieldPath() + ', ';
        }
        query = query.substring(0, query.length() - 2);
        query += ' from '+name; 
        system.debug(query);
    }
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator(query);
    }
    public void Execute(Database.BatchableContext bc, List<sObject> scope){
        system.debug(fs_SourceObj);
        List<Backup__c> bck_list = new List<Backup__c>();
        for (sObject obj: scope){
            Backup__c bck = new Backup__c();
            for (Integer i = 0; i < fs_SourceObj.size(); i++){
                bck.put((fs_TargetObj[i].getFieldPath()), obj.get(fs_SourceObj[i].getFieldPath()));
            }
            bck_list.add(bck);
        }
        system.debug(bck_list);
        insert bck_list;
    }
    public void Finish(Database.BatchableContext bc){
    }
}