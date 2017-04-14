public class CustomPageController {
    public String SearchText{get;set;}
    public List<Account> accounts{get;set;}
    public pageReference fetchAccounts(){        
        String query = 'select Name, type from account where name like' +'\''+'%'+SearchText+'%'+'\'';
        accounts = database.query(query);
        return null;
    }
}