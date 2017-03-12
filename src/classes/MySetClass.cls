public class MySetClass {
    public void fun(){
        set<integer>mySet=new set<integer>();
        mySet.add(10);
        mySet.add(20);
        mySet.add(30);
        mySet.add(40);
        for(integer x:mySet)
            system.debug('Value of Set is'+x);
        mySet.add(10);
        mySet.add(20);
        for(integer x:mySet)
            system.debug('Value of Set is'+x);
        system.debug('Size of my set is'+mySet.size());
        
    }
}