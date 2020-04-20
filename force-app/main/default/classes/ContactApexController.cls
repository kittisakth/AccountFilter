public with sharing class ContactApexController {
	@AuraEnabled
    public static Contact getContact(String ID) {
        return [SELECT Id, Name, LastName, FirstName FROM Contact WHERE Id=:ID];
    }
	
    @AuraEnabled
    public static Contact updateContact(Contact con) {
        update con;
        return con;
    }
}