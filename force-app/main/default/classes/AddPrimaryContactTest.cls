@isTest
public class AddPrimaryContactTest {
	@isTest
    static void TestList() {
        List<Account> lst_accs = new List<Account>();
        for(Integer i=0; i<50;i++) {
            lst_accs.add(new Account(BillingState = 'CA', name = 'Test ' + i));
        }
        for(Integer i=0; i<50;i++) {
            lst_accs.add(new Account(BillingState = 'NY', name = 'Test ' + i));
        }
        insert lst_accs;
        
        Contact cont = new Contact();
        cont.FirstName = 'demo';
        cont.LastName = 'demo';
        insert cont;
        String state = 'CA';
        AddPrimaryContact apc = new AddPrimaryContact(cont, state);
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
    }
}