Feature: Feature connection to Database sampleUsingDataBase.feature

  Background:
    # data generator
    * def dataGenerator = Java.type('Helpers.DataGenerator')

    # use jdbc
    * def config = {username: 'postgres', password: 'acernitro5', url: 'jdbc:postgresql://localhost:5432/uni_students', driverClassName: 'org.postgresql.Driver'}
    * def DbUtils = Java.type('DBUtils.DbUtils')
    * def db = new DbUtils(config)


  Scenario: Scenario using database
    * def student = db.readRows('SELECT * FROM tableone')
    * print 'Students are --- ', student
    * print student[0]
    * print student[0].username

    * def student1Username = db.readRows('SELECT username FROM tableone WHERE userid = 1;')
    * print student1Username

    * def student1ID = db.readValue("SELECT userid FROM tableone WHERE username = 'Renz';")
    * print student1ID

    * def student1IDs = db.readRow("SELECT userid FROM tableone WHERE username = 'Renz';")
    * print student1IDs

    * def randomID = dataGenerator.getRandomID()
    * print randomID

    # userid cannot duplicate, change it all the time before run again
    * def write = db.insertRows("INSERT INTO tableone (userid, username, usercourse, userstream) VALUES (56, 'Pol', 'BS Mech Eng', 'Engineering');")
    * def updatedTableone = db.readRows('SELECT * FROM tableone')
    * print updatedTableone

@ignore
  Scenario: Scenario using database and data generator
    * def student = db.readRows('SELECT * FROM tableone')
    * print 'Students are --- ', student
    * print student[0]
    * print student[0].username

    * def student1Username = db.readRows('SELECT username FROM tableone WHERE userid = 1;')
    * print student1Username

    * def student1ID = db.readValue("SELECT userid FROM tableone WHERE username = 'Renz';")
    * print student1ID

    * def student1IDs = db.readRow("SELECT userid FROM tableone WHERE username = 'Renz';")
    * print student1IDs

    # Insert into database using data generator
#    * def randomID = dataGenerator.getRandomID()
    * def randomUsername = dataGenerator.getRandomUserName()
    * def write = db.insertRows("INSERT INTO tableone (userid, username, usercourse, userstream) VALUES (20, '#(randomUsername)', 'BS Mech Eng', 'Engineering');")





