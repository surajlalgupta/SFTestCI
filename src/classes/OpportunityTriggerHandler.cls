public class OpportunityTriggerHandler {
    public static void sendEmails(List<Opportunity> opps, Set<Id> OwnerIds){
        Map<Id, User> userMap = new Map<Id, User>([select id, Email from User where id in :OwnerIds]);  
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();   
        for (Opportunity opp: opps){           
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new List<String>{userMap.get(opp.OwnerId).Email});
            mail.setSubject('Opportunity: '+opp.Name+ ' has been closed!');
            mail.setPlainTextBody('Hi '+UserInfo.getFirstName()+ '\n\n\n'+ 'Opportunity: '+opp.Name+ ' has been closed.\n\n'+
                                 'Please Refer below Link to review Opportunity Details\n\n');
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
}