Feature: New Transaction Functionality

  Background:
    Given a user is logged in
    And the application state is seeded
    And API requests for users, transactions, and notifications are intercepted
    And the test context contains a logged-in User (Sender) and a Contact (Receiver)

  @payment @deposit
  Scenario: Submitting a Transaction Payment and Verifying Deposit
    Given the Sender clicks the New Transaction button in the navigation bar
    When the Sender searches for the Contact by their first name
    And the Sender selects the Contact from the user list
    And the Sender enters a valid amount "35"
    And the Sender enters a description "Sushi dinner 🍣"
    And the Sender clicks the Pay button
    Then a "Transaction Submitted!" success alert should be displayed
    And the Sender's account balance should be updated, reflecting the payment deduction
    And the transaction should appear in the Sender's Personal Transactions list with the description "Sushi dinner 🍣"
    And the Contact's account balance in the database should be increased by the payment amount

  @request
  Scenario: Submitting a Transaction Request
    Given the Sender clicks the New Transaction button in the navigation bar
    When the Sender selects the Contact from the user list
    And the Sender enters a valid amount "95"
    And the Sender enters a description "Fancy Hotel 🏨"
    And the Sender clicks the Request button
    Then a "Transaction Submitted!" success alert should be displayed
    And the transaction request should appear in the Personal Transactions list with the description "Fancy Hotel 🏨"

  @validation @error
  Scenario: Displaying New Transaction Errors
    Given the Sender clicks the New Transaction button in the navigation bar
    When the Sender selects the Contact from the user list
    And the Sender clears the amount input field and blurs
    Then the amount input should display the error "Please enter a valid amount"
    When the Sender clears the description input field and blurs
    Then the description input should display the error "Please enter a note"
    And the Pay button should be disabled
    And the Request button should be disabled

  @payment @verification
  Scenario: Submitting a Transaction Payment and Verifying the Receiver's Deposit
    Given the Sender clicks the New Transaction button in the navigation bar
    When the Sender creates a payment transaction of amount "25" with description "Indian Food" to the Contact
    Then a "create another transaction" button should be visible
    And the Sender's displayed balance should be updated
    When the Contact logs in
    Then the Contact's account balance should contain the updated balance, reflecting the deposit

  @request @acceptance
  Scenario: Submitting a Transaction Request and Accepting it as the Receiver
    Given the Sender clicks the New Transaction button in the navigation bar
    When the Sender creates a request transaction of amount "100" with description "Fancy Hotel" from the Contact
    Then a "create another transaction" button should be visible
    When the Contact logs in
    And the Contact navigates to the Personal Transactions tab
    And the Contact clicks on the transaction item with description "Fancy Hotel"
    And the Contact accepts the request
    Then the request should be updated successfully
    When the Sender logs in
    Then the Sender's account balance should be updated, reflecting the request payment deposit

  @search
  Scenario Outline: Searching for a User by Different Attributes
    Given the Sender navigates to the New Transaction form
    When the Sender searches for a user by their "<attribute>"
    Then the user list should display at least one result
    And the first result should contain the searched "<attribute>" value
    When the Sender clears the search input
    Then the user list should be empty

    Examples:
      | attribute     |
      | firstName     |
      | lastName      |
      | username      |
      | email         |
      | phoneNumber   |