public class BatchCreateShadowCase implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful{
    public String query = '';
    public BatchCreateShadowCase(){
        query = 'select casenumber, status from case';
    }
    public Database.QueryLocator start(Database.batchableContext bc){
        return Database.getQueryLocator(query);
    }
    public void execute (Database.batchableContext bc, List<Case> scope){
        List<Shadow_Case__c> scases = new List<Shadow_Case__c>();
        for (Case cs: scope){
            Shadow_Case__c sc = new Shadow_Case__c();
            sc.CaseStatus__c = cs.Status;
            sc.CaseNumber__c = cs.casenumber;
            sc.Case__c = cs.Id;
            scases.add(sc);
        }
        List<Database.SaveResult> results = Database.insert(scases, false);
    }
    public void finish (Database.batchableContext bc){
        system.debug('Finished Batch execution');
    }
}