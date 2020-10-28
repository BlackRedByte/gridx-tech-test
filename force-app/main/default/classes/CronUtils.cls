public with sharing class CronUtils {
    // 0 15 12 ? * MON,TUE,FRI *
    public static String generateCron(String pickersJson) {
        PickersWrapper wrapper = (PickersWrapper)
            Json.deserialize(pickersJson, PickersWrapper.class);
        
        String cron = String.format('{0} ? * {1} *', new List<String> {
            generateTime(wrapper.timepicker),
            generateWeekdays(wrapper.weekdayspicker)
        });

        System.debug(cron);

        return cron;
    }

    private static String generateWeekdays(List<Object> weekdays) {
        try {
            return String.join(weekdays, ',');
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    private static String generateTime(String timeString) {
        
        // timeString has the following format 00:15:12.000

        try {
            timeString = timeString.substring(0, 8); // 00:15:12.000 -> 00:15:12
            List<String> timeParts = timeString.split(':');
            String seconds = timeParts[2];
            String minutes = timeParts[1];
            String hours = timeParts[0];

            return String.format('{0} {1} {2}', new List<String>{
                StringUtils.deleteFirstZero(seconds), 
                StringUtils.deleteFirstZero(minutes), 
                StringUtils.deleteFirstZero(hours)
            });
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    
}
