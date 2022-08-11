Feature: reading_different_file_formats

  Description: Ways to read different file format using feature file

  Background: Define URL

    * def ENVIRONMENT = env

  Scenario: Read json's files - Using * def + varName
    * def ListUsers = read('classpath:SamplePackage1/reusableBC/Activity_4_helper/api_list_users.json')
    * print ListUsers
    * print ListUsers.page
    * print ListUsers.data[0]
    * print ListUsers.data[1].email

    * set ListUsers.newObject = 'Im a new object'
    * set ListUsers.data[*].addedObject = 'Im a new ADDED object'
    * print ListUsers

  Scenario: Read json's files - Using * json + varName
    * json ListUsersJson = read('classpath:SamplePackage1/reusableBC/Activity_4_helper/api_list_users.json')
    * print ListUsersJson
    * print ListUsersJson.page
    * print ListUsersJson.data[0]
    * print ListUsersJson.data[1].email
    * set ListUsersJson.newObject = 'Im a new object'
    * set ListUsersJson.data[*].addedObject = 'Im a new ADDED object'
    * print ListUsersJson

  Scenario: Read XML files / converting format
    * def sampleXml = read('classpath:SamplePackage1/reusableBC/Activity_4_helper/sample_XML_file.xml')
    * print sampleXml
    * set sampleXml /catalog/books/author = 'Jose Ibarra'
    * print sampleXml
    * def convertedFormat = call read('classpath:SamplePackage1/reusableBC/Activity_4_helper/converter_xml_to_json_format.feature') {var1: #(sampleXml)}
    * print convertedFormat

  Scenario: Read XML files / DIRECT convert
    * def sampleXml = read('classpath:SamplePackage1/reusableBC/Activity_4_helper/sample_XML_file.xml')
    * print sampleXml
    * set sampleXml /catalog/books/author = 'Jose Ibarra'
    * print sampleXml
    * json convertedXML = sampleXml
    * print convertedXML

  Scenario: Iteration of Response JSON format - simplified - using BC

    * def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users.feature')
    * print ListUsers.response
    * def Iteration_result = call read('classpath:SamplePackage1/reusableBC/Activity_4_helper/Iteration_feature.feature') ListUsers.response.data
    * print Iteration_result

  Scenario: Iteration of Response JSON format - simplified - NOT using BC

    * url 'https://reqres.in'
    * path 'api/users'
    * param page = 2
    * method get
    * status 200
    * def Iteration_result = call read('classpath:SamplePackage1/reusableBC/Activity_4_helper/Iteration_feature.feature') response.data
    * print Iteration_result

  Scenario: Read Java files / data generator, Static Java Functions

    * def datagenerator = Java.type('SamplePackage1.reusableBC.Activity_4_helper.DataGenerator')
    * def randomEmail = datagenerator.getRandomEmail()
    * def randomUsername = datagenerator.getRandomUserName()
    * print randomEmail
    * print randomUsername


  Scenario: Read Java files / Date Time and reformat, Static Java Functions

    * def DateTimeClass = Java.type('SamplePackage1.reusableBC.Javautils.DateTime')
    * def currentDateTime = DateTimeClass.currentDateTimeUTC()
    * print currentDateTime
    * def formattedDateTime = DateTimeClass.formatDateTime(currentDateTime, "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'", "yyyy-MM-dd'T'HH:mm:ss")
    * print formattedDateTime

  Scenario: Read Java files / calling Static and Non-Static Java functions

    * def java_class = Java.type('SamplePackage1.reusableBC.Activity_4_helper.javaDemo')

    * def nonStaticFunc_1 = new java_class().non_static_void_function()
    * print nonStaticFunc_1

    * def nonStaticFunc_2 =  new java_class().stringArgs_NON_static_function("PHILIPPINES!")
    * print nonStaticFunc_2
    * match nonStaticFunc_2 == "Hello PHILIPPINES!"

    * def StaticFunc1 = java_class.static_void_function()
    * print StaticFunc1

    * def StaticFunc2 = java_class.stringArgs_static_function("EVERYONE!")
    * print StaticFunc2
    * match StaticFunc2 == "Welcome EVERYONE!"

  Scenario: Create/Write new txt file using java functions

    * def textFileCreator = Java.type('SamplePackage1.reusableBC.Activity_4_helper.javaDemo')
    * def result = textFileCreator.writeData("String Args Content")

  Scenario: Calling Simple Javascript Function

    * url 'https://reqres.in'
    * path 'api/users'
    * param page = 2
    * method get
    * status 200

    * def JS_func1 = function(){ return 'Hello World!'}
    * def return_1 = JS_func1()
    * print return_1

    * def JS_func2 =
          """
          function(){
           return 'GOOD DAY!!!'
           }
          """
    * def return_2 = JS_func2()
    * print return_2

  Scenario: Calling Simple Javascript Function WITH MULTIPLE ARGUMENTS

    * def summation =
          """
          function(a,b){
           return a+b;
           }
          """

    * def result_1 = summation(20,7)
    * print result_1

  Scenario: Calling RESPONSE using Javascript Function

    * url 'https://reqres.in'
    * path 'api/users'
    * param page = 2
    * method get
    * status 200
    * print response.data
    * def datas = response.data

    * def myFun1 =
          """
          function(arg){
                 return arg.length;
                 }
          """
    * def number_of_users = myFun1(datas)
    * print number_of_users

    * def myFun1 =
          """
          function(arg){
                 return arg[0].email;
                 }
          """
    * def firstUser_email = myFun1(datas)
    * print firstUser_email

  Scenario: Calling RESPONSE using Javascript Function with LOOPS and CONDITIONS

    * url 'https://reqres.in'
    * path 'api/users'
    * param page = 2
    * method get
    * status 200
    * print response.data
    * def datas = response.data

    * def myFun1 =
          """
          function(arg){
               for(i=0; i<arg.length; i++){
                  if(arg[i].id == 9){
                    return arg[i]
                  }
               }
          }
          """
    * def user_ID_9_datas = myFun1(datas)
    * print user_ID_9_datas

    * def myFun2 =
          """
          function(arg){
               for(i=0; i<arg.length; i++){
                  if(arg[i].id == 12){
                    return arg[i]
                  }
               }
          }
          """
    * def user_ID_12_datas = myFun2(datas)
    * print user_ID_12_datas


