trigger contactTest on Contact (before insert, before update) {
for(Contact ct: Trigger.new){
    
       Account acct = [select id, name, billingState from Account where Id=:ct.AccountId];
       if(acct.BillingState=='CA'){
           System.debug('found a contact related to an account in california...');
           ct.email = 'test_email@testing.com';
           //Apply more logic here....
       }
   }
}