package SamplePackage1.reusableBC.Javautils;

public class StringManipulation {

    public static String TextToUpper(String text){
        return text.toUpperCase();

    }

    public static String TextToLower(String text){
        return text.toLowerCase();

    }

    public static String RemoveLastChar(String str) {
        if (str != null && str.length() > 0 && Character.isLetter(str.charAt(str.length() - 1)) == true){
            str = str.substring(0, str.length() - 1);
        }
        return str;
    }

    public static String trimSpace(String str){
        return str.trim();
    }

    public static int checkSubstring(String str){
        return str.indexOf(".");
    }

}
