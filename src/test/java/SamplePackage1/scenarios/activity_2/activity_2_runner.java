package SamplePackage1.scenarios.activity_2;

import com.intuit.karate.junit5.Karate;

public class activity_2_runner {

    @Karate.Test
    Karate testFeature() { return Karate.run("calling_reusable_BC_into_feature").relativeTo(getClass());}

}
