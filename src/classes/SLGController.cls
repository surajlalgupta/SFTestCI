public class SLGController {
	@AuraEnabled
    public static String createContact (Contact con){
        if (con != null){
            insert con;
        }
        return string.valueOf(con.id);
    }
    @AuraEnabled
    public static List<Contact> fetchContacts (String lname){
        List<Contact> con_list = [select id, LastName from Contact where lastname =: lname];
        return con_list;
    }
}