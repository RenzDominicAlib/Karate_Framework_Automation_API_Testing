Feature: calling_reusable_BC_into_feature

  Description: Different ways to call feature / reusable BC into the feature file

  Background: Define URL

    * def ENVIRONMENT = env

  Scenario: Get List Users by calling reusable BC - "call read" NO parameter used

    * def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users.feature')
    * print ListUsers.response
    * assert ListUsers.responseStatus == 200
    * print ListUsers.timeRespond
    * assert ListUsers.timeRespond < 10001

  Scenario: Get List Users by calling reusable BC - "call read" WITH parameter used (single line)

    * def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users_with_params.feature') {page_number:2 , var1 : "sample parameter only", var2 :"another sample parameter only" }
    * print ListUsers.response
    * assert ListUsers.responseStatus == 200
    * print ListUsers.timeRespond
    * assert ListUsers.timeRespond < 10001

  Scenario: Get List Users by calling reusable BC - "call read" WITH parameter used (multiple line)

    * def params =
    """
    {
    page_number : 2,
    var1 : "sample parameter only",
    var2 : "another sample parameter only"
    }

    """
    * def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users_with_params.feature') params
    * print ListUsers.response
    * assert ListUsers.responseStatus == 200
    * print ListUsers.timeRespond
    * assert ListUsers.timeRespond < 10001