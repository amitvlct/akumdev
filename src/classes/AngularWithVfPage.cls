public with sharing class AngularWithVfPage {
  
 public static String getContacts() {
       return JSON.serialize([select id, name, email
           from contact ]);
   }
}