package SamplePackage1.scenarios;

import com.intuit.karate.junit5.Karate;

class RunnerTestScenarios {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("sql_practice_using_1000_random_data").relativeTo(getClass());
    }


//    @Karate.Test
//    Karate testSample() {
//        return Karate.run().relativeTo(getClass());
//    }
//
//    @Karate.Test
//    Karate testTags() {
//        return Karate.run("tags").tags("@second").relativeTo(getClass());
//    }
//
//    @Karate.Test
//    Karate testSystemProperty() {
//        return Karate.run("classpath:karate/tags.feature")
//                .tags("@second")
//                .karateEnv("e2e")
//                .systemProperty("foo", "bar");
//    }

}
