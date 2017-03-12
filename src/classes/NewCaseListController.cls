Public class NewCaseListController {
public List<Case> results {get; set;}

Public NewCaseListController(){
getNewCases();
}

private String sortOrder = 'CaseNumber';
public List<Case> getNewCases() {
    results = new List<Case>();        
    results = [SELECT Id, CaseNumber FROM Case WHERE Status = 'New'];
    system.debug('results::'+results);
    return results;
    
    }
    
}