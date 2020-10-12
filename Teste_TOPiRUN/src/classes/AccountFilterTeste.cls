/**
 * @author liciavereda
 */

@isTest
public with sharing class AccountFilterTeste {

    static void filterAccountsByCnpjTeste () {

        List <Account> accounts = new List <Account>{
            AccountFixtureFactory.createAccount('Teste 01','24661643000144', '36530525050', '16310970', '16310970')
        };
 
 
         AccountFilter filter = new AccountFilter();
 
         List<Account> filteredAccounts = filter.filterByChangeCnpj(accounts, null);
    
         System.assertEquals(accounts.size(), filteredAccounts.size());
         
         filteredAccounts = filter.filterByChangeCnpj(accounts, new Map<Id,Account>());
         
         System.assertEquals(accounts.size(), filteredAccounts.size());
 
         Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);
 
         Account changedAccount = accounts.get(0).clone(true, true, true, true);
         changedAccount.Cnpj__c = 'X';
         oldAccounts.put(changedAccount.Id, changedAccount);
         
         filteredAccounts = filter.filterByChangeCnpj(accounts, oldAccounts);
 
         System.assertNotEquals(accounts.size(), filteredAccounts.size());
         System.assert( filteredAccounts.size() == 1 );
 
         accounts = new List<Account>();
         accounts.add (new Account (Name = 'Teste 03' ) );
         accounts.add (new Account (Name = 'Teste 04' ) );
         
         
         filteredAccounts = filter.filterByChangeCnpj(accounts, null );
         
         System.assert( filteredAccounts.isEmpty() );
 
     }
 
     @isTest
     static void filterAccountsByCpfTeste () {
 
         List <Account> accounts = new List <Account>{
             AccountFixtureFactory.createAccount('Teste 05','78873087000107', '90463424093', '16310-970', '16310-970')
         };
 
         AccountFilter filter = new AccountFilter();
 
         List<Account> filteredAccounts = filter.filterByChangeCpf(accounts, null);
    
         System.assertEquals(accounts.size(), filteredAccounts.size());
         
         filteredAccounts = filter.filterByChangeCpf(accounts, new Map<Id,Account>());
         
         System.assertEquals(accounts.size(), filteredAccounts.size());
 
         Map<Id,Account> oldAccounts = new Map<Id,Account> (accounts);
         
         Account changedAccount = accounts.get(0).clone(true, true, true, true);
         changedAccount.Cpf__c = 'X';
         oldAccounts.put(changedAccount.Id, changedAccount);
 
         filteredAccounts = filter.filterByChangeCpf(accounts, oldAccounts);
         System.assert( filteredAccounts.size() == 1 );

         accounts = new List<Account>();
         accounts.add (new Account (Name = 'Teste 06' ) );
         accounts.add (new Account (Name = 'Teste 07' ) );
 
         
         filteredAccounts = filter.filterByChangeCpf(accounts, null );
         
         System.assert( filteredAccounts.isEmpty() );
 
     }
 
     
 
 }

