public with sharing class StringUtils {

    // deleteFirstZero('07') -> '7'
    public static String deleteFirstZero(String str) {
        if (str.substring(0, 1) == '0') {
            return str.substring(1);
        } else {
            return str;
        }
    }
    
}
