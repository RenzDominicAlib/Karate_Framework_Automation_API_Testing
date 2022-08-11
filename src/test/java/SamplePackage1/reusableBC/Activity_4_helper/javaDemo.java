package SamplePackage1.reusableBC.Activity_4_helper;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

public class javaDemo {

    public void non_static_void_function(){
        System.out.println("This is a NON-Static Function");
    }

    public String stringArgs_NON_static_function(String Arg){
        System.out.println("This is a NON-Static Function but with String Arg");
        return "Hello " + Arg;
    }

    public static void static_void_function(){
        System.out.println("This is a Static Function");
    }

    public static String stringArgs_static_function(String Arg){
        System.out.println("This is a Static Function");
        return "Welcome " + Arg;
    }

    public static void writeData(String arg) throws FileNotFoundException, UnsupportedEncodingException {
        System.out.println("This is a Static Function");
        PrintWriter writer = new PrintWriter("newData.txt", "UTF-8");
        writer.println("The First line");
        writer.println("The Second line");
        writer.println(arg);
        writer.close();
    }

}
