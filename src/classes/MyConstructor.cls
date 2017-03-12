public class MyConstructor {
    public integer a;
    public integer b;
      public myConstructor(){
        a=0;
        b=0;
    }
    public myConstructor(integer x,integer y){
        a=x;
        b=y;
    }
    public void display(){
        system.debug('Value of a:'+a);
        system.debug('Value of b:'+b);
    }
    
  }