Feature: Sample POST method in conduit

  Background:
    * def dataGenerator = Java.type('Helpers.DataGenerator')
    * url 'https://api.realworld.io'

  Scenario: USING TEST DATA GENERATOR (JAVA FILE)
    Given def DynamicUserData = {"email":"43aw03", "username":"43a30wa", "newArticleTitle":"aesa04w23"}

    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUserName()


    Given path 'api/users'
    Given params {'limit':10, 'offset':0}
    And request
    """
    {
      "user": {
        "email": #(randomEmail),
        "password": "bruno123",
        "username": #(randomUsername)
        }
     }
    """
    When method post
    Then status 200
    And print response
    And match response ==
    """
    {
      "user":{
      "email": #(randomEmail),
      "username": "#(randomUsername)",
      "bio": "##string",
      "image": "#string",
      "token": "#string"
             }
    }
    """
    And print response.user.token
    * def token =  response.user.token

    Given path 'api/articles'
    Given header Authorization = 'Token ' + token
    * def randomTitle = dataGenerator.getRandomTitle()
    And request
    """
    {
      "article": {"tagList": [],"title": #(randomTitle),
      "description": "supercalifragilisticexpiadilocious",
      "body": "sinsce birth tige"}
     }
    """

    When method post
    Then status 200
    And print response
    And print response.article.slug
    * def title = response.article.title
    * def articleId =  response.article.slug
    * def artID = articleId

    Given path 'api/articles', artID
    When method get
    Then status 200
    And print response
    And match response.article.title == title

    Given path 'api', 'articles', artID
    Given header Authorization = 'Token ' + token
    When method delete
    Then status 204
    And print response

    Given path 'api/articles', artID
    When method get
    Then status 200
    And print response
    And print response.article
    And match response..article == '#array'


