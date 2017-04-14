trigger AccountMasterTrigger on Account (before Insert, after insert){
    if (Trigger.isBefore){
        if (Trigger.isInsert){
            /*for (Account acc: Trigger.New){
                acc.Name = 'TestAccount';
            }*/
            AccountTriggerHandler.updateAccount();
        }
    }
    if (Trigger.isAfter){
        if (Trigger.isInsert){
            /*List<Contact> ct_list = new List<Contact>();
            Set<Id> accIds = new Set<Id>();
            for (Account acc: Trigger.New){
                Contact cnt = new Contact();
                cnt.AccountId = acc.Id;
                cnt.LastName = acc.Name;
                ct_list.add(cnt);
                accIds.add(acc.Id);
            }
            insert ct_list;
            List<Account> accs = [select id, name from account where id in :accIds];
            for (Account acc: accs){
                acc.Name = 'TestModifiedAccount';
            }
            update accs;*/
            AccountTriggerHandler.createContact();
        }
    }
}