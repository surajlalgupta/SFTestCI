public class searchExtension{
    public List<Account> accts{get;set;}
    public CustomPageController ctrl{get;set;}
    public Boolean hasEnoughAccounts{get;set;}
    public searchExtension(CustomPageController ctrl){
        this.ctrl = ctrl;
        hasEnoughAccounts = false;
    }
    public void testExt(){
        if (ctrl.accounts.size() > 10){
            hasEnoughAccounts = true;
        }
        else{
            hasEnoughAccounts = false;   
        }
    }
}