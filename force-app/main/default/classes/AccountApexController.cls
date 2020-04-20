public with sharing class AccountApexController {
	@AuraEnabled
    public static List<Account> getAccount(String ID) {
        return [SELECT Name FROM Account WHERE Id=:ID];
    }
}