public class myMultiAnotherSyntax {
public void fun(){
        List<Department__c> obj=[select Name,DEP_ID__c from Department__c];
        for(Department__c x:obj)
        {
        system.debug(x.Name+'-------'+x.DEP_ID__c);
        }
}
}