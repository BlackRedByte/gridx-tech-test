public with sharing class CronJobDetailsService {

    public static Boolean isJobAlreadyScheduled(String jobName) {
        List<CronJobDetail> jobs = [
            SELECT Name FROM CronJobDetail WHERE Name = :jobName
        ];
        
        return jobs.size() > 0;
    }
    
}
