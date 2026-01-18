Feature: User Authentication

  Background:
    Given I am on the login screen

  @auth @login
  Scenario: Successful login
    When I log in with valid credentials
    Then I should be authenticated
    And I should see the product catalog

  @auth @error-handling
  Scenario: Login failure with invalid credentials
    When I attempt to log in with invalid credentials
    Then I should see the error "Username and password do not match any user in this service"

  @auth @logout
  Scenario: User logout
    Given I am already logged in
    When I log out of the application
    Then I should be returned to the login screen