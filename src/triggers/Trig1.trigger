/*
 Synopsis:insert contact name on the basis of Account Name and Number of Employees
         List of Contact should be inserted in one go.0000000000000000
 */
trigger Trig1 on Account (before insert) {

    LIst<Contact> conList = new List<Contact>();
    Integer counter=1;

    for(Account new_acc: trigger.new)
    {
        Contact new_con = new Contact();
        new_con.LastName = new_acc.Name + '_' + counter;
        counter++;
        conList.add(new_con);
    }
    
    Database.insert(conList);
}