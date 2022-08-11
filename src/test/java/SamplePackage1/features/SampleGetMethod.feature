Feature: Sample GET method in conduit

  Background:
    * url 'https://api.realworld.io'

  Scenario: get all users and then get the first user by id
    Given path 'api/articles'
    Given params {'limit':10, 'offset':0}
    When method get
    Then status 200
    And print response
    And match response.articlesCount == 1
    And match response.articles == '#array'