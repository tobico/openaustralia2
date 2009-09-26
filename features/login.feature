Feature: Login
  In order to allow users to login
  
  Scenario: Login form
    Given user is on the login page
    When user enters login name and password
    Then user should be returned to the referring page
    And the username should be displayed with a logout link