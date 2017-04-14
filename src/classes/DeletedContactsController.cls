public class DeletedContactsController {
    public List<Contact> contacts{get;set;}
    public DeletedContactsController(){
        contacts = [select id, name, lastname, firstname, account.name from contact where isdeleted = true all rows];
    }
}