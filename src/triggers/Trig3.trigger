trigger Trig3 on Account (after insert)
{
     Account new_acc = trigger.new[0];
     integer i;
     for(i=0 ; i<new_acc.numberofemployees; i++)
     {
       Contact new_con = new Contact();
       new_con.LastName = new_acc.Name + '_' + i;
       new_con.AccountId= new_acc.ID;
       Database.insert(new_con);
         
     }
}