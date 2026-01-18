Feature: Bank Accounts Management

  Background:
    Given I am a logged-in user

  @bank-accounts @creation
  Scenario: Adding a new bank account
    Given I am on the Bank Accounts page
    When I add a new bank account with valid details
    Then the account "The Best Bank" should be listed in my accounts

  @bank-accounts @validation
  Scenario Outline: Preventing invalid account details
    Given I am adding a new bank account
    When I attempt to save with <condition>
    Then I should see the error "<error_message>"
    And the account should not be created

    Examples:
      | condition                         | error_message                       |
      | a missing bank name               | Enter a bank name                   |
      | a short bank name                 | Must contain at least 5 characters  |
      | a short routing number            | Must contain a valid routing number |
      | an account number with 8 digits   | Account number must be 9-12 digits  |
      | an account number with 13 digits  | Account number must be 9-12 digits  |

  @bank-accounts @delete
  Scenario: Deleting an existing bank account
    Given I have a bank account named "Old Bank"
    When I delete the account "Old Bank"
    Then "Old Bank" should no longer appear in my active account list

  @bank-accounts @onboarding
  Scenario: New user onboarding prompt
    Given I have no bank accounts
    When I visit the Bank Accounts page
    Then I should be prompted to create my first account