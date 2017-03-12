public class MyNestedList {
    public void fun(){
        list<string>country=new list<string>{'India','Bhutan','USA','Canada'};
             list<string>states=new list<string>{'Delhi','Xian','Washin','Lumar'};
                 list<string>capital=new list<string>{'D','X','W','L'};
                    list< list<string>>finallist=new list<list<string>>();
        				finallist.add(Country);
        				finallist.add(States);
        				finallist.add(Capital);
        system.debug(finallist.get(0));
        system.debug(finallist.get(1));                 
        system.debug(finallist.get(0).get(0));
            
    }
}