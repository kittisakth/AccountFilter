public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String lastName) {
        List<List<sObject>> searchLists = [FIND :lastName IN NAME FIELDS RETURNING Contact(Name),Lead(FirstName)];
        system.debug(searchLists);
        return searchLists;
    }
}