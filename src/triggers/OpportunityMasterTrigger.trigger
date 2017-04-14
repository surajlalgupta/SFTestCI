trigger OpportunityMasterTrigger on Opportunity (before update) {
    if (Trigger.isBefore){
        if (Trigger.isUpdate){
            List<Opportunity> closedOpps = new List<Opportunity>();
            Set<Id> OwnerIds = new Set<Id>();
            for (Opportunity opp: Trigger.new){
                if (opp.isClosed == true && opp.isClosed != Trigger.oldMap.get(opp.Id).isClosed){
                    closedOpps.add(opp);
                    OwnerIds.add(opp.OwnerId);
                }
            }
            if (closedOpps.size() > 0){
                OpportunityTriggerHandler.sendEmails(closedOpps, OwnerIds);
            }
        }
    }
}