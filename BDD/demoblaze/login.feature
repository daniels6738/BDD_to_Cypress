Feature: User Authentication

  Background:
    Given I am an unauthenticated visitor

  @auth @login
  Scenario: Successful login
    When I log in with valid credentials
    Then I should be authenticated
    And I should see the user dashboard

  @auth @error-handling
  Scenario Outline: Login failure handling
    When I attempt to log in with <condition>
    Then I should see the error "<error_message>"
    And I should remain unauthenticated

    Examples:
      | condition             | error_message       |
      | a non-existent user   | User does not exist.|
      | an incorrect password | Wrong password.     |