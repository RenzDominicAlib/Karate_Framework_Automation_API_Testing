Feature: api_list_users

  Description:
  Reusable BC to get list of users in reqres.in

  Used in:
  activity_2.calling_reusable_BC_into_feature

  Parameters:
  page_number (required)
  var_1 (required)
  var_2 (required)
  x_limit (optional)

  Background: Define URL

    * url p_base_url
    * def withXLimit = {"X-Limit" : #(x_limit)}
    * def requestHeader = typeof x_limit != 'undefined' ? withXLimit : {}
    * print requestHeader

  Scenario: api_list_users

    Given path '/api/users'
    And param page = page_number
    When method get
    And headers requestHeader
    * print var1
    * print var2

    * def timeRespond = responseTime
    * print timeRespond

