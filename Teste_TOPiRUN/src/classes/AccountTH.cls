/** 
 * @author liciavereda
 */

public virtual with sharing class AccountTH extends TriggerHandler{

    List<Account> newAccounts;
    
    Map<Id,Account> oldAccounts;

    AccountFilter filter;

    AccountValidator validator;



    public AccountTH () {
        this ( (List<Account>) Trigger.new, (Map<Id,Account>) Trigger.oldMap );
    }

    public AccountTH (List<Account> newAccounts , Map<Id,Account> oldAccounts) {
        
        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;

        this.filter = new AccountFilter();
        this.validator = new AccountValidator();
    
    }
    virtual
    override
    public void beforeInsert() {
        validateCnpj();
        validateCpf();
    }
    
    virtual
    override
    public void beforeUpdate() {
        validateCnpj();
        validateCpf ();
    }
   
   virtual
    public void validateCnpj () {

        List<Account> filterdAccounts = this.filter.filterByChangeCnpj(newAccounts
                                                                                  , oldAccounts);
        this.validator.validateCnpj(filterdAccounts);

    }

     
  virtual
   public void validateCpf () {

       List<Account> filterdAccounts = this.filter.filterByChangeCpf(newAccounts
                                                                                , oldAccounts);

       this.validator.validateCpf(filterdAccounts);

   }


}