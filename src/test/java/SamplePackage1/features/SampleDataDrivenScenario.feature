Feature: Sample DataDriven Scenarios method in conduit

  Background:
    * url 'https://api.realworld.io'
    * def SelfGenData = {"email":"Karateadfgara211123@test.com", "username":"katedfUaaasera12321123"}
  Scenario Outline: Data driven scenarios (always change the SelfGenData since it is not auto generated)


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
      | eMail                              | passWord | userName                       | errorResponse                                                                       |
      | #(SelfGenData.email + '@test.com') | Test123  | karateUser123                  | {"errors": {"username": ["has already been taken"]}}                                |
      | KarateUser1@test.com               | Test123  | #(SelfGenData.username)        | {"errors": {"email": ["has already been taken"]}}                                   |
#      | KarateUser1testcom                | Test123  | #(SelfGenData.username)        | {"errors": {"email": ["is invalid"]}}                                                |
#      | #(SelfGenData.email + '@test.com') | Test123  | karateUser1231222asdfasdfsadfasdf2222222222211 | {"errors": {"username": ["is too long (maximum is 20 characters)"]}} |
#      | #(SelfGenData.email + '@test.com') | Tes      | #(SelfGenData.username)        | {"errors": {"password": ["is too short (minimum is 8 characters)"]}}                |
      |                                    | Test123  | #(SelfGenData.username)        | {"errors": {"email": ["can't be blank"]}}                                           |
      | #(SelfGenData.email + '@test.com') |          | #(SelfGenData.username)        | {"errors": {"password": ["can't be blank"]}}                                        |
      | #(SelfGenData.email + '@test.com') | Test123  |                                | {"errors": {"username": ["can't be blank"]}}                                        |


