public class MyClassName {
    public void fun(){
        list<string>ls=new list<string>();
        ls.add('REd');
        ls.add('Green');
        ls.add('Blue');
        System.debug('Size of list is:'+ls.size());
        for(string i:ls)
        {
            System.debug('Value:'+i);
        }
    }
}