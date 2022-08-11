package SamplePackage1.reusableBC.Javautils;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class DateTime {

    private static ZonedDateTime zdtNow;
    private static LocalDateTime ldtNow;

    public static String formatDateTime(String dateTime, String currentFormat, String format){
        String formatted = "";
        try {
            SimpleDateFormat formatter = new SimpleDateFormat(currentFormat);
            Date tempFormat = formatter.parse(dateTime);
            SimpleDateFormat finalFormat = new SimpleDateFormat(format);
            formatted = finalFormat.format(tempFormat);
        } catch(Exception ex){
            formatted = "Invalid format";
        }
        return formatted;
    }

    public static String currentDateTimeUTC(){
        zdtNow = ZonedDateTime.now(ZoneOffset.UTC);
        //return date time in yyyy-MM-dd'T'HH:mm:ss'Z' format in UTC timezone: 2022-10-03T22:14:24.000Z
        return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'").format(zdtNow);
//        return zdtNow.toString();
    }

    public static long currentEpochTime(){
        zdtNow = ZonedDateTime.now(ZoneOffset.UTC);
        //return date time in Epoch time format: 1585030264009
        return zdtNow.toInstant().toEpochMilli();
    }

    public static String currentDateUTC(){
        ldtNow = LocalDateTime.now(ZoneOffset.UTC);
        //return date time in yyyy-MM-dd format: 2022-10-24
        DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        return df.format(ldtNow);
    }

    public static String currentTimeUTC(){
        ldtNow = LocalDateTime.now(ZoneOffset.UTC);
        //return time in HH:mm:ss.SSS format: 16:24:24.009
        DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm:ss.SSS");
        return tf.format(ldtNow);
    }

    public static String currentShortTimeUTC(){
        ldtNow = LocalDateTime.now(ZoneOffset.UTC);
        //return time in HH:mm:ss format: 16:24:24
        DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm:ss");
        return tf.format(ldtNow);
    }

    public static String currentTimeUTC6S(){
        ldtNow = LocalDateTime.now(ZoneOffset.UTC);
        //return time in HH:mm:ss.SSSSSS format: 16:24:24.000009
        DateTimeFormatter tf = DateTimeFormatter.ofPattern("HH:mm:ss.SSSSSS");
        return tf.format(ldtNow);
    }

}
