package SamplePackage1.reusableBC.Javautils;

import java.io.File;

public class FileChecker {

    public static boolean fileExist(String filePathString) throws Exception {
        File f = new File(filePathString);

        return f.exists();

    }

}
