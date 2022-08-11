Feature: sql_practice_using_1000_random_data.feature

  Background:
    # data generator
    * def dataGenerator = Java.type('Helpers.DataGenerator')

    # use jdbc
    * def config = {username: 'postgres', password: 'acernitro5', url: 'jdbc:postgresql://localhost:5432/uni_students', driverClassName: 'org.postgresql.Driver'}
    * def DbUtils = Java.type('DBUtils.DbUtils')
    * def db = new DbUtils(config)


  Scenario: SELECTING or DISPLAYING details  FROM database uni_students ; table "persons"

    * def malePersons = db.readRows("SELECT * FROM persons WHERE gender = 'Male';")
#    * print malePersons
    * def First100malePersons = db.readRows("SELECT * FROM persons WHERE gender = 'Male' ORDER BY last_name ASC LIMIT 100;")
    * print First100malePersons
    * def Last100malePersons = db.readRows("SELECT * FROM persons WHERE gender = 'Male' ORDER BY last_name DESC LIMIT 100;")
    * print Last100malePersons
    * def First100IDmalePersons = db.readRows("SELECT * FROM persons WHERE gender = 'Male' ORDER BY id ASC LIMIT 100;")
    * print First100IDmalePersons
    * def First100BornMalePersons = db.readRows("SELECT * FROM persons WHERE gender = 'Male' ORDER BY date_of_birth ASC LIMIT 100;")
    * print First100BornMalePersons

# using Distinct
    * def CountryOfBirth = db.readRows("SELECT country_of_birth FROM persons;")
    * print CountryOfBirth
    * def CountryOfBirthDistinct = db.readRows("SELECT DISTINCT country_of_birth FROM persons ORDER BY country_of_birth;")
    * print CountryOfBirthDistinct

# using Where, And, or
    * def FilipinoMales = db.readRows("SELECT *  FROM persons WHERE gender = 'Male' AND country_of_birth = 'Philippines';")
    * print FilipinoMales
    * print FilipinoMales.length

    * def FilipinoAndChineseMales = db.readRows("SELECT *  FROM persons WHERE gender = 'Male' AND (country_of_birth = 'Philippines' OR country_of_birth = 'China');")
    * print FilipinoAndChineseMales
    * print FilipinoAndChineseMales.length

# using IN
    * def FilipinoChineseBrazilian = db.readRows("SELECT *  FROM persons WHERE country_of_birth = 'Philippines' OR country_of_birth = 'China' OR country_of_birth = 'Brazil';")
    * print FilipinoChineseBrazilian

    * def IN_FilipinoChineseBrazilian = db.readRows("SELECT *  FROM persons WHERE country_of_birth IN ('Philippines', 'China', 'Brazil', 'Nigeria');")
    * print IN_FilipinoChineseBrazilian

# using between
    * def BornFrom2000to2010 = db.readRows("SELECT *  FROM persons WHERE date_of_birth BETWEEN '2000-01-01' AND '2010-12-30';")
    * print BornFrom2000to2010
    * def FilipinoBornFrom2000to2010 = db.readRows("SELECT *  FROM persons WHERE country_of_birth = 'Philippines' AND (date_of_birth BETWEEN '2000-01-01' AND '2010-12-30');")
    * print FilipinoBornFrom2000to2010
    * def MaleFilipinoBornFrom2000to2010 = db.readRows("SELECT *  FROM persons WHERE gender = 'Male' AND country_of_birth = 'Philippines' AND (date_of_birth BETWEEN '2000-01-01' AND '2010-12-30');")
    * print MaleFilipinoBornFrom2000to2010

# using like, ilike
    * def emailWithCom = db.readRows("SELECT *  FROM persons WHERE email LIKE '%.com';")
    * print emailWithCom
    * def emailWithGoogleCom = db.readRows("SELECT *  FROM persons WHERE email LIKE '%@google.com';")
    * print emailWithGoogleCom
    * def emailWithGoogle = db.readRows("SELECT *  FROM persons WHERE email LIKE '%@google.%';")
    * print emailWithGoogle
    * def emailWith8Chars = db.readRows("SELECT *  FROM persons WHERE email LIKE '________@%';")
    * print emailWith8Chars
    * def countryStartWithP = db.readRows("SELECT *  FROM persons WHERE country_of_birth LIKE 'P%';")
    * print countryStartWithP
    * def countryStartWithP = db.readRows("SELECT *  FROM persons WHERE country_of_birth ILIKE 'p%';")
    * print countryStartWithP

#  using Group by and Count
    * def NationalityGroupCount = db.readRows("SELECT country_of_birth, COUNT(*) FROM persons GROUP BY country_of_birth ORDER BY country_of_birth;")
    * print NationalityGroupCount
    * print NationalityGroupCount.length

# using Group by, count, having count, order by
    * def NationalityGroupMorethan30Count = db.readRows("SELECT country_of_birth, COUNT(*) FROM persons GROUP BY country_of_birth HAVING COUNT(*) > 30 ORDER BY country_of_birth;")
    * print NationalityGroupMorethan30Count
    * print NationalityGroupMorethan30Count.length

