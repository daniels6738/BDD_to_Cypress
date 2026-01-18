Feature: User Authentication

  Background:
    # Ubiquitous: Clearly defines the actor ("visitor") instead of a generic "I"
    Given I am an unauthenticated visitor

  @auth @login
  Scenario: Successful login
    # Focused: Replaces 4 imperative steps (click, enter, enter, click) with 1 declarative action
    When I log in with valid credentials
    # Clear/Ubiquitous: Verifies the business outcome (access granted), not technical side effects (page refresh)
    Then I should be authenticated
    And I should see the user dashboard

  @auth @error-handling
  Scenario Outline: Login failure handling
    # Complete/Singular: Uses an Outline to cover different failure modes (wrong user vs wrong password)
    When I attempt to log in with <condition>
    Then I should see the error "<error_message>"
    And I should remain unauthenticated

    Examples:
      | condition             | error_message       |
      | a non-existent user   | User does not exist.|
      # Added to ensure Completeness regarding invalid credentials
      | an incorrect password | Wrong password.     |