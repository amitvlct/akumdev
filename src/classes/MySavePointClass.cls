public class MySavePointClass {
    public void fun(){
    account acc=new account(name='subway');
    insert acc;
    //system.assertEquals(null,[select accountnumber from account where id=:acc.id].accountnumber);
    system.debug('MY-Check----->'+[select accountnumber from account where id=:acc.id].accountnumber);
    savepoint sp1=database.setSavepoint();
    system.debug('Save Point Establised');
    acc.AccountNumber='999';
    update acc;
    system.debug('Record updated with 999');
        savepoint sp2=database.setSavepoint();
    //system.assertEquals('999',[select accountnumber from account where id=:acc.id].accountnumber);
    system.debug([select accountnumber from account where id=:acc.id]);
        acc.Rating='Warm';
        update acc;
        database.rollback(sp2);
    }
  
}