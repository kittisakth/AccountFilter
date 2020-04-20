public class ContactSearch {
    public static List<Contact> searchForContacts(String LastName, String PostalCode) {
        List<Contact> contacts = [SELECT ID, Name FROM Contact WHERE LastName = :LastName AND MailingPostalCode = :PostalCode];
        return contacts;
    }
}