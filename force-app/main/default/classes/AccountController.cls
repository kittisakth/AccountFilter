public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getAccounts() {
      return [SELECT Id, Name, Type, Industry, Phone FROM Account];
    }
  }