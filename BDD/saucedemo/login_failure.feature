Feature: Login Functionality

  Scenario: Unsuccessful login with invalid credentials
    Given I am on the login page
    When I enter the username "wrong_user"
    And I enter the password "secret_sauce"
    And I click the login button
    Then I should see an error message "Username and password do not match any user in this service"