Feature: Login Functionality

  Scenario: Unsuccessful login with invalid credentials
    Given I am not logged on the application
    When I click the Log in button
    And I enter the username "bdd-auto-cypress"
    And I enter the password "12345"
    And I click the login button
    Then I should see an error message "User does not exist."