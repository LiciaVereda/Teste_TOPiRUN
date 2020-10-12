/**
 * @author liciavereda
 */

@isTest
public  class AccountFixtureFactory {

    public static Account newAccount (String name, String cnpj, String cpf
                                        , String billingPostalCode , String shippingPostalCode ) {

        return new Account(Name= name, Cnpj__c = cnpj, Cpf__c = cpf, BillingPostalCode = billingPostalCode, ShippingPostalCode = shippingPostalCode);
        
    }
        
    public static Account createAccount (String name, String cnpj, String cpf
                                                , String billingPostalCode, String shippingPostalCode  ) {

        return createAccount ( newAccount(name, cnpj, cpf, billingPostalCode, shippingPostalCode) );
    
    }
        
    public static Account createAccount ( Account account ) {
        insert account;
        return account;
    }





}