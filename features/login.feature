Feature: Login
  In order to identify myself
  As a registered user
  I need to be able to login
  
  Scenario: Successful login
    Given I am on the login page
    When I fill in "email" with "matthew@openaustralia.org"
    And I fill in "password" with "foobar"
    And I press "Login"
    Then I should be on the homepage
    And I should see "Log out"
    And I should see "Matthew Landauer"
    
  Scenario: Failed login
    Given I am on the login page
    When I fill in "email" with "nobody"
    And I fill in "password" with "meatpie"
    And I press "Login"
    Then I should see "There is no user registered with an email of nobody"
    
  Scenario: Blank login
    Given I am on the login page
    When I press "Login"
    Then I should see "Please enter you email address and password"