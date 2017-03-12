public class MyMapClass {
    public void fun(){
        Map<String, String> keyMap = new Map<String, String>();
          keyMap.put('white', 'house');
          keyMap.put('purple', 'garage');
          keyMap.put('blue', 'trunk');
		  keyMap.put('green', '');
		  System.debug(keyMap.get('blue'));
		  System.debug(keyMap.containsKey('green'));
          System.debug(keyMap.containsKey('yellow'));
          System.debug(keyMap.keySet());
    }
}