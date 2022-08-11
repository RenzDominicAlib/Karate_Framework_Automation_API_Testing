Feature: BC_for_users

  Description:
  Reusable BC for users in reqres.in

  Used in:
  activity_1.Validation_of_list_of_users_in_reqres

  Parameters:
  page_number (required)

  Background: Define URL

    * url p_base_url

  Scenario: BC_for_users

    Given path '/api/users'
    And param page = page_number
    When method get
