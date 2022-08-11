Feature: Validation_of_list_of_users_in_reqres

  Description: List of users in Reqres.in sample website (used env: 'default')

    Background: Define URL

    * def ENVIRONMENT = env

    Scenario: Validation_of_list_of_users_in_reqres

      * print ENVIRONMENT

      * def params = {page_number: 2}
      * def jsonResponse = call read('classpath:SamplePackage1/reusableBC/BC_for_users.feature') params
      * print jsonResponse.response
      * print jsonResponse.responseStatus
      * print jsonResponse.responseTime
      * print jsonResponse.responseType
      * print jsonResponse.responseBytes
      * print jsonResponse.responseHeaders
      * print jsonResponse.responseCookies
      * assert jsonResponse.responseStatus == 200

#      Validation

      * match jsonResponse.response contains {"data" : "#array", "page" : 2}
      * match jsonResponse.response contains {"data" : "#present", "page" : "#number"}
      * match jsonResponse.response.page == 2
      * match jsonResponse.response.per_page == 6

      * match jsonResponse.response.data == '#array'
      * match jsonResponse.response.data[0].id == 7
      * match jsonResponse.response.data == '#notnull'
      * match jsonResponse.response.data contains
      """
      [
        {
          "id": 7,
          "email": "michael.lawson@reqres.in",
          "first_name": "Michael",
          "last_name": "Lawson",
          "avatar": "https://reqres.in/img/faces/7-image.jpg"
        }
      ]
      """

      * print jsonResponse.response.data
      * match jsonResponse.response.data == '#[6]'
      * assert jsonResponse.response.data.length == 6
      * match jsonResponse.response.data[0].email == '#string'

      * def parameter1 = { page:2 }
      * eval parameter1.column = 'column value'
      * print parameter1
#    {"page": 2, "column": "column value" } || eval used to add object in the parameter

    Scenario: Convert Number to String: 1) add(+) variable by ''
      * def foo = 10
      * def json = {"bar" : #(foo + '')}
      * match json == {"bar" : '10'}

    Scenario: Convert String to Number: 1) multiply variable by '1' ; 2) use js ~~parseInt(var)
      * def foo = '999'
      * def json = {"bar" : #(foo * 1)}
      * match json == {"bar" : 999}

      * def json2 = {"bar" : #(~~parseInt(foo))}
      * match json2 == {"bar" : 999}

    Scenario: TABLE- Simple way to create JSON

      * table cats
      |name    |age|
      |'Bob'   |2  |
      |'Wild'  |3  |
      |'Nyan'  |8  |

      * print cats
      * match cats == [{name: 'Bob', age: 2}, {name: 'Wild', age: 3}, {name: 'Nyan', age: 8}]

  Scenario: TABLE- Simple way to create JSON Arrays

    * def one = 'hello'
    * def two = { baz: 'world'}
    * table tabs
      |foo      |bar           |
      |one      |{baz:1}       |
      |two.baz  |['baz', 'ban']|


    * print tabs
    * match tabs == [{ "foo": "hello", "bar": {"baz": 1} },{"foo": "world","bar": [ "baz","ban"]}]