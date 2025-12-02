Feature: Bank Accounts Management

  Background:
    Given the application state is seeded
    And the User is logged in

  @bank-accounts @creation
  Scenario: Creating a new bank account successfully
    Given the User navigates to the Bank Accounts page
    And the User clicks the "New" button to create an account
    Then the user should be redirected to the New Bank Account page
    When the User fills out the form with valid details:
      | Field          | Value         |
      | Bank Name      | The Best Bank |
      | Routing Number | 987654321     |
      | Account Number | 123456789     |
    And the User submits the form
    Then User should be redirected to the Bank Accounts page
    And the Bank Account list should contain "The Best Bank"

  @bank-accounts @validation @error-handling
  Scenario: Displaying bank account form validation errors
    Given the User is on the New Bank Account form
    When the User enters an invalid "Bank Name" (empty or less than 5 characters)
    Then the helper text "Enter a bank name" or "Must contain at least 5 characters" should appear
    When the User enters an invalid "Routing Number" (empty or less than 9 digits)
    Then the helper text "Enter a valid bank routing number" or "Must contain a valid routing number" should appear
    When the User enters a valid "Routing Number" of 9 digits
    Then the routing number error should disappear
    When the User enters an invalid "Account Number" (empty, less than 9, or more than 12 digits)
    Then the helper text should indicate the length requirements (9-12 digits)
    And the Submit button should be disabled throughout the validation errors

  @bank-accounts @delete
  Scenario: Soft deleting a bank account
    Given the User is on the Bank Accounts list page
    When the User clicks the delete button for the first bank account
    Then the Bank Account should have "Deleted" in its name

  @bank-accounts @empty-state @onboarding
  Scenario: Rendering empty state with onboarding modal
    Given the User has no bank accounts
    When the User navigates to the Bank Accounts page
    Then the Bank Account list should not exist
    And the empty state header "No Bank Accounts" should be displayed
    And the User Onboarding Dialog should be visible