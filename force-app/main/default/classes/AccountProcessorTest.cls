@isTest
public class AccountProcessorTest {
    public static testmethod void TestAccountProcessorTest() {
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact c = new Contact();
        c.FirstName = 'Nick';
        c.LastName = 'Test';
        c.AccountId = a.Id;
        Insert c;
        
        set<Id> setId = new Set<Id>();
        setId.add(a.Id);
        
        Test.startTest();
        AccountProcessor.countContacts(setId);
        Test.stopTest();
        
        Account acc = [SELECT Number_of_Contacts__c FROM Account WHERE Id = :a.Id LIMIT 1];
        system.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);
    }
}