Feature: Login Functionality

  Scenario: Successful login with valid credentials
    Given I am not logged on the application
    When I click the Log in button
    And I enter the username "demoblaze"
    And I enter the password "demoblaze"
    And I click the Log in button
    Then the page should be refreshed
    And I should not see the Log in button anymore

  Scenario: Unsuccessful login with invalid credentials
    Given I am not logged on the application
    When I click the Log in button
    And I enter the username "bdd-auto-cypress"
    And I enter the password "12345"
    And I click the login button
    Then I should see an error message "User does not exist."