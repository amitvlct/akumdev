public class MynDataInsert {
    public void fun(){
        account ob1=new account(Name='record1');
        account ob2=new account(Name='record2');
        insert ob1;
        insert ob2;
        System.debug('record inserted');
    }
}