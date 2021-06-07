public with sharing class AccountController {

    @AuraEnabled(cacheable=true)
    public static String getAccounts(){

        List<Account> accountsList = [Select Id, Name from Account];
        List<InputWrapper> listReturn = new List<InputWrapper>();

        for(Account a : accountsList){

            listReturn.add(new InputWrapper(a.Id, a.Name));

        }

        return JSON.serialize(listReturn);

    }

}
