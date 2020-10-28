public with sharing class GridXInterviewLauncherController {

    @AuraEnabled
    public static String launchNow(){
        try {
            return Database.executeBatch(new OpportunityBatch(), 1);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static List<AsyncApexJob> getJobs(){
        try {
            return AsyncApexJobsService.getAllJobs();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static String scheduleJob(String pickersJson) {
        String jobName = 'Mapping Countries to Opportunities Job';
        if (CronJobDetailsService.isJobAlreadyScheduled(jobName)) {
            throw new AuraHandledException('The job \'' + jobName + '\' is already scheduled');
        }
        OpportunityBatchScheduler scheduler = new OpportunityBatchScheduler();
        String cron = CronUtils.generateCron(pickersJson);
        return System.schedule('Mapping Countries to Opportunities Job', cron, scheduler);
    }
}
