trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    list<Task> tlist = new list<Task>();
    for(Opportunity opp : Trigger.new){
        if(opp.StageName == 'Closed Won'){ 
            Task taskObj = new Task();
            taskObj.Subject = 'Follow Up Test Task';
            taskObj.Priority = 'High';
            taskObj.WhatId = opp.id;
            taskObj.Status = 'Completed';
            //insert taskObj;
            tlist.add(taskObj);
        }
    }
    insert tlist; 
}