public class CampingListController {
    @AuraEnabled
    public static List<Camping_Item__c> getItems(){
        return [select name from camping_item__c];
    }
    @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c c){
        upsert c;
        return c;
    }
}