@isTest
private class TestRestrictContactByName {
    @isTest static void testInsert() {
        Contact c = new Contact(LastName = 'INVALIDNAME', FirstName = 'Error');
        Test.startTest();
        try {
            insert c;
        } catch (Exception err) {
            Test.stopTest();
            
        }
    }
}