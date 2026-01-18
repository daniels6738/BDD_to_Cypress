Feature: User Authentication and Onboarding

  Background:
    Given "Bob" is a registered user

  @auth @security
  Scenario: Restricting access to protected areas
    Given I am a visitor
    When I attempt to access the "Profile" page
    Then I should be required to log in

  @auth @login
  Scenario: Successful login
    Given I am on the login page
    When I log in with Bob's valid credentials
    Then I should be authenticated
    And I should be redirected to the Dashboard

  @auth @session
  Scenario: Persistent authentication ("Remember Me")
    Given I am on the login page
    When I log in with "Remember Me" enabled
    Then I should remain authenticated after restarting the browser

  @auth @logout
  Scenario: User logout
    Given I am currently logged in as "Bob"
    When I log out
    Then I should be returned to the public area

  @auth @signup @onboarding
  Scenario: New user registration and onboarding
    Given I am a new visitor
    When I register a new account with valid details
    Then I should be immediately prompted to set up my bank account

  @auth @onboarding
  Scenario: Completing the onboarding wizard
    Given I have just registered a new account
    When I complete the bank account setup
    Then I should see my empty Transaction List

  @auth @validation
  Scenario Outline: Registration form validation
    Given I am on the Sign Up page
    When I attempt to register with <condition>
    Then the system should prevent registration
    And show the error message "<error>"

    Examples:
      | condition          | error                                       |
      | missing username   | Username is required                        |
      | short password     | Password must contain at least 4 characters |
      | password mismatch  | Passwords do not match                      |

  @auth @error
  Scenario Outline: Login failure handling
    Given I am on the login page
    When I attempt to log in with <credentials>
    Then I should see the alert "Username or password is invalid"

    Examples:
      | credentials             |
      | a non-existent username |
      | an invalid password     |