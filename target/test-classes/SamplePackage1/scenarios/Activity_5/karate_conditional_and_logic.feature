Feature: karate_conditional_and_logic
  Background:

    Scenario: True Condition
      * def filename = 'xyz' == 'xyz' ? 'file_1.feature' : 'file_2.feature'
      * print filename
      * def result = call read (filename)
      * print result

    Scenario: False Condition
      * def filename = 'xyz' == '123' ? 'file_1.feature' : 'file_2.feature'
      * print filename
      * def result = call read (filename)
      * print result

    Scenario: Comparative Condition
      * def responseCode = 404
      * def result = responseCode == 404 ? karate.call('file_1.feature') : {}
      * print result

    Scenario: If Condition
      * def responseCode = 404
      * if ( responseCode == 404 ) karate.call('file_1.feature')

    Scenario: Condition with JS function
      * def responseCode = 200
      * def myFunc =
      """
      function(){
        return 'HELLO WORLD!'
      }
      """
      * def result = responseCode == 200 ? myFunc() : {}
      * print result