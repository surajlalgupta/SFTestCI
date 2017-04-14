public class dataTableCon {

    List<Account> accounts;
    public String rendertype{get;set;}
    public List<Account> getAccounts() {
        if(accounts == null)
            accounts = [SELECT name, owner.name FROM account LIMIT 10];
        return accounts;
    }
    public pageReference saveAsPDF(){
        rendertype = 'pdf';
        return null;
    }
}