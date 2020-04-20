public class AddPrimaryContact implements Queueable {
	private Contact c;
    private String state;
    
    public AddPrimaryContact(Contact c, String state) {
        this.c = c;
        this.state = state;
    }
    
    public void execute(QueueableContext context) {
        List<Account> lst_accs = [SELECT Id, Name, (SELECT Id, FirstName, LastName FROM Contacts) FROM Account WHERE BillingState =:state LIMIT 200];
        List<Contact> lst_contacts = new List<Contact>();
        for(Account acc: lst_accs){
            Contact cont = c.clone(false, false, false, false);
            cont.AccountId = acc.id;
            lst_contacts.add(cont);
        }
        if (lst_contacts.size() > 0) {
            insert lst_contacts;
        }
    }
}