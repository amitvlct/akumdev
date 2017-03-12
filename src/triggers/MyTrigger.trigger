trigger MyTrigger on Account (before update) {
for(Account temp:trigger.new)
{
    Account oldvalue=trigger.OldMap.get(temp.Id);
    if(temp.AnnualRevenue<=oldvalue.AnnualRevenue)
        temp.addError('Trigger Running--Cannot have value less than old value');
}
}