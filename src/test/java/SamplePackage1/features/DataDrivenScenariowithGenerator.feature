Feature: Sample DataDriven Scenarios method in conduit with Test generator

  Background:
    * url 'https://api.realworld.io'
    * def dataGenerator = Java.type('Helpers.DataGenerator')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUserName()
  Scenario Outline: Data driven scenarios (Using Data Generator)


    Given path 'api/users'
    Given params {'limit':10, 'offset':0}

    And request
    """
    {
      "user": {
        "email": "<eMail>",
        "password": "<passWord>",
        "username": "<userName>"
        }
     }
    """
    When method post
    Then status 422
    And print response
    And match response == <errorResponse>

    Examples:
      | eMail               | passWord | userName                                       | errorResponse                                                        |
      | #(randomEmail)      | Test123  | karateUser123                                  | {"errors": {"username": ["has already been taken"]}}                 |
      | KarateUser1@test.com| Test123  | #(randomUsername)                              | {"errors": {"email": ["has already been taken"]}}                    |
      | KarateUser1testcom  | Test123  | #(randomUsername)                              | {"errors": {"email": ["has already been taken"]}}                                |
      | #(randomEmail)      | Test123  | karateUser1231222asdfasdfsadfasdf2222222222211 | {"errors": {"username": ["has already been taken"]}} |
#      | #(randomEmail)      | Tes      | #(randomUsername)                              | {"errors": {"password": ["is too short (minimum is 8 characters)"]}} |
      |                     | Test123  | #(randomUsername)                              | {"errors": {"email": ["can't be blank"]}}                            |
      | #(randomEmail)      |          | #(randomUsername)                              | {"errors": {"password": ["can't be blank"]}}                         |
      | #(randomEmail)      | Test123  |                                                | {"errors": {"username": ["can't be blank"]}}                         |


