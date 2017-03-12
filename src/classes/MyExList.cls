public class MyExList {
public void fun(){
       list<string>lobj=new list<string>();
       list<string>dobj=new list<string>();
       lobj.add('Red');
       lobj.add('Green');
       lobj.add('Blue');
         system.debug('Size of list:'+lobj.size());
          for(String i:lobj)
            {
             system.debug('Value Stored'+i);
            } 
       lobj.remove(2);
       dobj=lobj.clone();
      system.debug('Size of list  dobj '+dobj.size());
     // lobj.remove(2);
      system.debug('Second Size of list:'+lobj.size());
    
      for(String j:dobj)
            {
             system.debug('Value Stored in dobj'+j);
            } 
    }
}