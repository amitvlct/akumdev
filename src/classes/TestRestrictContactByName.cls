@isTest 
private class TestRestrictContactByName {

    static testMethod void myUnitTest1() {
        Contact con = new Contact(lastname = 'INVALIDNAME');
        insert con;
    }
}