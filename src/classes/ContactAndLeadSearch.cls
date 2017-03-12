public with sharing class ContactAndLeadSearch {
 public static List<List< SObject>> searchContactsAndLeads(String flname){
 	String searchQuery = 'FIND \'' + flname + '\' IN NAME FIELDS RETURNING  Contact,Lead';
  List<List<sObject>> searchList = search.query(searchQuery);
                   return searchList;
                   
 }
}