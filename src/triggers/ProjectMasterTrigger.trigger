trigger ProjectMasterTrigger on Project__c (after insert){
    List<Project__share> pshares = new List<Project__share>();
    for (Project__c p: Trigger.New){
        Project__share ps = new Project__share();
        ps.ParentId = p.Id;
        ps.UserOrGroupId = '00590000006TDdJ';
        ps.AccessLevel = 'Read';
        ps.RowCause = 'Manual';
        pshares.add(ps);
    }
    insert pshares;
}