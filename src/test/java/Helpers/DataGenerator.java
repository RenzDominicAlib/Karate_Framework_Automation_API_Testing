package Helpers;


import com.github.javafaker.Faker;

public class DataGenerator {

    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0, 100) + "@test.com";
        return email;

    }

    public static String getRandomUserName(){
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;

    }

    public static String getRandomTitle(){
        Faker faker = new Faker();
        String title = faker.pokemon().location();
        return title;

    }

    public static int getRandomID(){
        Faker faker = new Faker();
        int IDnum = faker.random().nextInt(10000, 99999);
        return IDnum;

    }

}




