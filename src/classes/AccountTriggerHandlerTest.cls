@isTest(seeAllData=true)
public class AccountTriggerHandlerTest{
    public static testMethod void testUpdateAccount(){
        Test.startTest();
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        Test.stopTest();
        acc = [select Name, (select LastName from contacts) from account where id = :acc.Id];
        System.assertEquals(acc.Name, 'TestAccount');
        System.assertEquals(acc.contacts.size(), 1);
        System.assertEquals(acc.contacts[0].LastName, acc.Name);
    }
}