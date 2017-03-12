public class RandomContactFactory {
 public static List<Contact> generateRandomContacts(Integer x,String y){
 	List<Contact> cList = new List<Contact>();
 	for(Integer i=0;i<x;i++){
 		Contact con = new Contact(firstname = 'Test'+i+1);
 		cList.add(con);
 	}
 	return cList;
 }
 
}