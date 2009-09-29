Feature: Join
  In order to provide new users the ability to sign up to the site
  
  Scenario: Successful join
    Given the user is on the join page
    When the user enters the first name "John" and last name "Doe"
    And the user enters the email address "johndoe@nowhere.com"
    And the user correctly enters the password "foobar"
    And the user clicks the Join button
    And there should be a welcome message
    And an email should be sent containing a confirmation link
    
  Scenario: Failed join
    Given the user is on the join page
    When the user enters the first name "John" and last name "Doe"
    And the user enters the email address "johndoe.email"
    And the user mismatches the password "foobar" with "goobar"
    And the user clicks the Join button
    Then there should be an error message for the email field
    And there should be an error message for the password field