public class MySalaryClass {
    public string name{
        get;
        set;
    }
    public integer salary{
        get;
        set;
    }
    public void fun(){
        try{
            if(salary<1000)
                throw(new SalaryException());
            else
                system.debug('Exception does not raised');
        }
        catch(SalaryException e){
            system.debug('My Error msg----'+e.getErrorMessage());
            system.debug('My Error Type---'+e.getExType());
        }
        system.debug('Back in main class');
    }
}//end of class