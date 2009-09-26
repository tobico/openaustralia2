Feature: Login
  In order to allow users to login
  
  Scenario: Successful login
    Given user is on the login page
    When user enters login name matthew@openaustralia.org and password foobar
    Then user should be returned to the referring page
    And the username should be displayed with a logout link
    
  Scenario: Failed login
    Given user is on the login page
    When user enters login name badname and password meatpie
    Then there should be an error message regarding bad login