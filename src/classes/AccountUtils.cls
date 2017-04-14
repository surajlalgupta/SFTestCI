public class AccountUtils{
    public static List<Account> accountsByState(String code){
        return [select id, name from account where billingstate =: code];
    }
}