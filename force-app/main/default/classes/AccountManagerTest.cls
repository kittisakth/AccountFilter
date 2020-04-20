@isTest
private class AccountManagerTest {
    static testMethod void testMethod1() {
        Account acc = new Account(Name='Test Account');
        insert acc;
        
        Contact con = new Contact(LastName = 'Test Contact', AccountId = acc.Id);
        insert con;
        
        Id recordId = acc.Id;
        RestRequest request = new RestRequest();
        request.requestURI = 'https://brave-goat-km2kcp-dev-ed.my.salesforce.com/services/apexrest/Accounts/' + recordId + '/contacts';
    	request.httpMethod = 'GET';
        RestContext.request = request;
        
        Account thisAccount = AccountManager.getAccount();
        system.assert(thisAccount != null);
        system.assertEquals('Test Account', thisAccount.Name);
    }
}