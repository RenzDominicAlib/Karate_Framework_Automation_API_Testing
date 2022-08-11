Feature: demonstration_of_scenario_outline

Description: Demonstration of using scenario outline

Background: Define URL

* def ENVIRONMENT = env


Scenario Outline: Get List Users by calling reusable BC - "call read" WITH parameter used (single line) - Scenario outline - NO iteration

* def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users_with_params.feature') {page_number:<pageParameter> , var1 : <variable1>, var2 :<variable2> }
* print ListUsers.response
* assert ListUsers.responseStatus == 200
* print ListUsers.timeRespond
* assert ListUsers.timeRespond < 10001

  Examples:
  | pageParameter |    variable1        | variable2 |
  |      2        | "sample Variable 1" | 1995      |


  Scenario Outline: Get List Users by calling reusable BC - "call read" WITH parameter used (single line) - Scenario outline - WITH iteration

    * def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users_with_params.feature') {page_number:<pageParameter> , var1 : <variable1>, var2 :<variable2> }
    * print ListUsers.response
    * assert ListUsers.responseStatus == 200
    * print ListUsers.timeRespond
    * assert ListUsers.timeRespond < 10001

    Examples:
      | pageParameter |    variable1        | variable2 |
      |      2        | "sample Variable 1" | 1995      |
      |      1        | ""                  | ''        |
      |      2        | 1                   | '"aaa"'   |
      |      2        | '#present'          | null      |


  Scenario Outline: Match Validation

    * def ListUsers = call read('classpath:SamplePackage1/reusableBC/api_list_users_with_params.feature') {page_number:<pageParameter> , var1 : <variable1>, var2 :<variable2> }
    * print ListUsers.response
    * assert ListUsers.responseStatus == 200
    * print ListUsers.timeRespond
    * assert ListUsers.timeRespond < 10001

#    * print ListUsers.response.data[*].email >>> " * " can only allowed in 'match each' & 'set'
    * match each ListUsers.response.data[*].email == '#string'
    * match each ListUsers.response.data[*].email contains '@'
    * set ListUsers.response.newObject = 'Im a new object'
    * set ListUsers.response.data[*].addedObject = 'Im a new ADDED object'
    * print ListUsers.response
    * def expectedData =
    """
    {
      "id": '#number',
      "email": '#present',
      "first_name": '#string',
      "last_name": '#present',
      "avatar": '#present',
      "addedObject": '#present'
    }
    """
    * match each ListUsers.response.data[*] contains expectedData

    * print karate.jsonPath(ListUsers.response, "$.data[?(@.first_name=='Lindsay')]")
    * def count = karate.jsonPath(ListUsers.response, "$.data[?(@.first_name=='Lindsay')]").length
    * print count

    Examples:
      | pageParameter |    variable1        | variable2 |
      |      2        | "sample Variable 1" | 1995      |
