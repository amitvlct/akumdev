public with sharing class ContactSearch {
 public static list<Contact> searchForContacts(String lname,String Pcode){
 	List<Contact> conlist = new List<Contact>();
 	conlist = [select Id,Name from Contact where lastname =: lname and MailingPostalCode =: Pcode];
 	return conlist;
 }
}