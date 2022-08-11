Feature: api_list_users

  Description:
  Reusable BC to get list of users in reqres.in

  Used in:
  activity_2.calling_reusable_BC_into_feature

  Parameters:
  none

  Background: Define URL

    * url p_base_url

  Scenario: api_list_users

    Given path '/api/users'
    And param page = 2
    When method get

    * def timeRespond = responseTime
    * print timeRespond