public class MyContactListController {
	@AuraEnabled
    public static List<Contact> getContacts(){
        return [select id, Name, Email, Title, Phone from Contact];
    }
}