/*
 This is exception handling for outof bound problem type as in mst
 */

public class MyExceptionClass {
public void fun(){
        integer i;
    try{
        List<account>mst=[select name,rating from account];
        for(i=0;i<=mst.size();i++)
        {
            system.debug(mst.get(i));
        }
    }//try ends
    catch(listException e) 
    {
        system.debug('My Error'+e.getMessage());
    }
    finally{
        system.debug('Finally is working well');
    }
    }
}