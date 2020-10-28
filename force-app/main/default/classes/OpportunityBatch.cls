public with sharing class OpportunityBatch implements Database.Batchable<sObject>, Database.AllowsCallouts {

    public Iterable<sObject> start(Database.BatchableContext bc) {
        System.debug('Opportunities mapping is start');
        return OpportunitiesService.getAllMappedCountries();
    }

    public void execute(Database.BatchableContext bc, List<Opportunity> scope) {
        Schema.SObjectField externalIdField = Opportunity.Fields.ExtId__c;
        List<Database.UpsertResult> upsertResults = OpportunitiesService.upsertOppsByExternalId(scope, externalIdField);
        OpportunitiesService.logErrorUpsertResults(upsertResults);
    }

    public void finish(Database.BatchableContext bc) {
        // postprocessing
        System.debug('Opportunities are mapped');
    }
}
