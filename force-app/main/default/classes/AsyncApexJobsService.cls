public with sharing class AsyncApexJobsService {

    public static List<AsyncApexJob> getAllJobs() {
        return [
            SELECT
                Id, Status, TotalJobItems, JobItemsProcessed, NumberOfErrors
            FROM AsyncApexJob
            ORDER BY CreatedDate DESC
            LIMIT 50000 
        ];
    }
}
