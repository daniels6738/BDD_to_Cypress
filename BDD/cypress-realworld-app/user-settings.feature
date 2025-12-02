Feature: User Profile Settings

  Background:
    Given the application state is seeded
    And the User is logged in
    And API requests for User updates and Notifications are intercepted
    And the User navigates to the User Settings page

  @settings @ui
  Scenario: Rendering the User Settings form
    Then the User Settings form should be visible

  @settings @validation
  Scenario: Displaying User Settings form validation errors
    When the User clears the "First Name" input and blurs
    Then the helper text "Enter a first name" should be visible
    When the User clears the "Last Name" input and blurs
    Then the helper text "Enter a last name" should be visible
    When the User clears the "Email" input and blurs
    Then the helper text "Enter an email address" should be visible
    When the User enters an invalid email "abc@bob." and blurs
    Then the helper text "Must contain a valid email address" should be visible
    When the User clears the "Phone Number" input and blurs
    Then the helper text "Enter a phone number" should be visible
    When the User enters an invalid phone number "615-555-" and blurs
    Then the helper text "Phone number is not valid" should be visible
    And the Submit button should be disabled

  @settings @update
  Scenario: Successfully updating user profile information
    When the User updates the profile form with new details:
      | Field        | Value           |
      | First Name   | New First Name  |
      | Last Name    | New Last Name   |
      | Email        | email@email.com |
      | Phone Number | 6155551212      |
    And the User submits the form
    Then the side navigation should display the updated name "New First Name"