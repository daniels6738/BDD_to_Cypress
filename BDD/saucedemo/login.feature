Feature: User Authentication

  Background:
    # Ubiquitous: Uses clear, non-technical language to establish context.
    Given I am on the login screen

  @auth @login
  Scenario: Successful login
    # Focused: Replaces imperative steps (enter user, enter pass, click button)
    # with a single declarative business action.
    When I log in with valid credentials
    # Clear/Ubiquitous: Verifies the business goal (accessing the catalog), 
    # rather than the technical implementation (URL redirection).
    Then I should be authenticated
    And I should see the product catalog

  @auth @error-handling
  Scenario: Login failure with invalid credentials
    # Essential/Focused: Abstracts specific bad data ("wrong_user") into a clear condition.
    When I attempt to log in with invalid credentials
    Then I should see the error "Username and password do not match any user in this service"

  @auth @logout
  Scenario: User logout
    # Essential: Uses a precondition to skip the login steps for this specific test.
    Given I am already logged in
    # Focused: Removes the brittle UI steps ("open sidebar", "click link").
    When I log out of the application
    Then I should be returned to the login screen