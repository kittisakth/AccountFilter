public class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer numContact, String LastNameGen) {
        List<Contact> contacts = new List<Contact>();
        for(Integer i = 0; i < numContact; i++) {
            LastNameGen = 'Test' + i;
            Contact c = new Contact(FirstName = LastNameGen, LastName = LastNameGen);
            contacts.add(c);
        }
        return contacts;
    }
}