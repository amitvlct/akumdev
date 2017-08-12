public class Geocoder {
    public class NameException extends Exception{} 
 
    public static final Map<String,GeocodeService> strategies;

    static{
       
        // Populate a List Collection of strategy names e.g., googleMaps, mapQuest etc
        List<String> strategyNames = new List<String>();
        strategyNames.add('googlemaps');
        strategyNames.add('MapQuest');
        // Populate a map of strategy names to concrete implementations
        // using Type.forName for each strategy string
        strategies = new Map<String,GeocodeService>();
        for(String name : strategyNames){
            try{
			strategies.put(name, (GeocodeService)Type.forName(name + 'impl').newInstance());
			}
            catch(Exception e){continue;} //skip bad name silently
        }
    }

    private GeocodeService strategy;

    public Geocoder(String name){
        if(!strategies.containsKey(name)) throw new NameException(name);
        strategy = strategies.get(name);
    }

    public List<Double> getLatLong(String address){
        return strategy.getLatLong(address);
    }
}