/** 
 * @author liciavereda
 */

public with sharing class AccountValidator {

    public List<Account> validateCnpj (List<Account> accounts) {

            BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

            for (Account account : accounts) {

                if ( !validator.isCNPJ( account.Cnpj__c )) {
                    account.Cnpj__c.addError('Inválido');
                    account.Cpf__c.addError('Inválido');
                  
                }     

            }

            return accounts;

    }

    public List<Account> validateCpf (List<Account> accounts) {

        BrazilianDocumentValidator validator = new BrazilianDocumentValidator();

        for (Account account : accounts) {

            if (!validator.isCPF(account.Cpf__c)) {
                account.Cpf__c.addError('Inválido');
            }     

        }

        return accounts;

}

}