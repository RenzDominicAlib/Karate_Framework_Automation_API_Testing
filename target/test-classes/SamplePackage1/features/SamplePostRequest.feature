Feature: Sample POST method in conduit

  Background:
    * url 'https://api.realworld.io'

  Scenario: ALWAYS adjust the email, uname and title
    Given def DynamicUserData = {"email":"43aw03", "username":"43a30wa", "newArticleTitle":"aesa04w23"}

    Given path 'api/users'
    Given params {'limit':10, 'offset':0}
    And request
    """
    {
      "user": {
        "email": #(DynamicUserData.email + '@ya.com'),
        "password": "bruno123",
        "username": #('testUname' + DynamicUserData.username)
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
      "email": #(DynamicUserData.email + '@ya.com'),
      "username": "#string",
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
    And request
    """
    {
      "article": {"tagList": [],"title": #('testTitle' + DynamicUserData.newArticleTitle),
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


