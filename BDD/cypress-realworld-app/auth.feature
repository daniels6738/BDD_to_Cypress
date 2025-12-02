Feature: User Authentication and Onboarding

  Background:
    Given the application state is seeded
    And API requests for signup and bank account creation are intercepted

  @auth @security
  Scenario: Redirecting unauthenticated users
    When an unauthenticated user visits a protected page like the profile page
    Then they should be redirected to the sign-in page

  @auth @login
  Scenario: Successful login redirection
    Given an existing user
    When the user navigates to the login page
    And submits the form with valid credentials
    Then they should be redirected to the home page

  @auth @session
  Scenario: Persistent session and logout
    Given an existing user
    When the user logs in with "Remember Me" enabled
    Then a session cookie with an expiry date should be set
    When the user logs out
    Then they should be redirected to the sign-in page

  @auth @signup @onboarding @e2e
  Scenario: Visitor sign-up, login, onboarding, and logout flow
    Given a visitor is on the home page
    When they navigate to the Sign Up page
    And they fill in the registration form with valid details:
      | firstName | Bob          |
      | lastName  | Ross         |
      | username  | PainterJoy90 |
      | password  | s3cret       |
    And they submit the registration form
    And they log in with the newly created credentials
    Then the Onboarding Wizard should be displayed
    When they proceed to the "Create Bank Account" step
    And they enter valid bank account details
    And they submit the onboarding form
    Then the "You're all set!" success screen should be displayed
    When they complete the onboarding process
    Then the Transaction List should be visible on the dashboard
    When the user logs out
    Then they should be redirected to the sign-in page

  @auth @validation
  Scenario: Displaying login form validation errors
    Given a visitor is on the login page
    When they clear the username field and blur
    Then the username error "Username is required" should be displayed
    When they enter a short password "abc" and blur
    Then the password error "Password must contain at least 4 characters" should be displayed
    And the Sign In button should be disabled

  @auth @validation
  Scenario: Displaying sign-up form validation errors
    Given a visitor is on the Sign Up page
    When they interact with the form fields invalidly:
      | Field            | Action             |
      | First Name       | Clear and blur     |
      | Last Name        | Clear and blur     |
      | Username         | Clear and blur     |
      | Password         | Clear and blur     |
      | Confirm Password | Mismatch and blur  |
    Then appropriate error messages should be displayed for each field
    And the Sign Up button should be disabled

  @auth @error
  Scenario: Error handling for non-existent user login
    When a user attempts to log in with a non-existent username "invalidUserName"
    Then an error alert "Username or password is invalid" should be displayed

  @auth @error
  Scenario: Error handling for invalid password
    Given an existing user
    When the user attempts to log in with the correct username but an invalid password
    Then an error alert "Username or password is invalid" should be displayed