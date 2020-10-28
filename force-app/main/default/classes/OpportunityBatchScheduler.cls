public with sharing class OpportunityBatchScheduler implements Schedulable {    
    public void execute(SchedulableContext sc) {
        try {
            Database.executeBatch(new OpportunityBatch(), 1);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
