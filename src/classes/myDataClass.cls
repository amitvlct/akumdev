/*For fetching single value*/
public class myDataClass {
    public void fun(){
        Department__c obj=[select Name,DEP_ID__c from Department__c where id='a009000001ST9nh'];
        system.debug(obj.Name+'-------'+obj.DEP_ID__c);
    }
}//end of class