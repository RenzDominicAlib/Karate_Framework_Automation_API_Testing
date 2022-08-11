package SamplePackage1.scenarios.activity_1;

import com.intuit.karate.junit5.Karate;

public class activity_1_runner {

    @Karate.Test
    Karate testFeature() { return Karate.run("validation_of_list_of_users_in_reqres").relativeTo(getClass());}

}
