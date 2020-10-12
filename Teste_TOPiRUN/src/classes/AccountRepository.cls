/**
 * @author liciavereda
 */

public virtual class AccountRepository {

    virtual
        public List<Account> findByName ( String name ) {

            return [ SELECT Id, Name, Type, BillingCity, BillingState
                , BillingPostalCode, BillingCountry, CreatedDate 
                FROM Account 
                WHERE Name like :name ];

        }

        virtual
        public List<Account> findByExternalIds ( String[] externalIds ) {

            return [ SELECT BillingStreet, BillingCity, BillingState, BillingPostalCode, BillingCountry
                , BillingLatitude, BillingLongitude, BillingGeocodeAccuracy, BillingAddress
                , ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, ShippingCountry, ShippingLatitude
                , ShippingLongitude, ShippingGeocodeAccuracy, ShippingAddress, Name, Id , ExternalId__c
                FROM Account 
                WHERE ExternalId__c in : externalIds ];

        }

        virtual
        public List<Account> findWithContactsByName ( String name ) {

            return [ SELECT Id, Name, Type, BillingCity, BillingState
                , BillingPostalCode, BillingCountry, CreatedDate, CreatedBy.Name
                , ( SELECT Id, FirstName, LastName FROM Contacts )
                FROM Account 
                WHERE Name like :name ];

        }

        virtual
        public List<Account> create (List<Account> accounts) {
            insert accounts;
            return accounts;
        }

        virtual
        public List<Account> store (List<Account> accounts) {
            update accounts;
            return accounts;
        }

        virtual
        public void remove (List<Account> accounts) {
            delete accounts;
        }


        virtual
        public List<Account> save ( List<Account> accounts ) {

            upsert accounts ExternalId__c;

            return accounts;

        }




}