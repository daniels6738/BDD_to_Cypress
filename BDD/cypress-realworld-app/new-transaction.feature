Feature: P2P Transaction Processing

  Background:
    # Ubiquitous/Integrous: Establishes actors clearly without technical API/Seeding jargon
    Given I am logged in as "Sender"
    And "Receiver" is an existing contact

  @payment @core
  Scenario: Sending a payment
    # Focused: Replaces 6 imperative UI steps (click, type, select) with 1 declarative action
    When I pay "Receiver" $35 for "Sushi dinner"
    # Singular: Verifies the direct business outcome (Sender's view)
    Then my account balance should decrease by $35
    And the transaction "Sushi dinner" should appear in my history

  @request @core
  Scenario: Requesting money
    # Essential/Focused: Focuses on the "what" (Request), not the "how" (UI clicks)
    When I request $95 from "Receiver" for "Fancy Hotel"
    Then the request "Fancy Hotel" should appear in my pending transactions

  @request @acceptance
  Scenario: Accepting a transaction request
    # Singular/Essential: Decoupled from the creation step.
    # Assumes the precondition (Given) instead of forcing the user to create it first.
    Given I am logged in as "Receiver"
    And I have a pending request for $100 from "Sender"
    When I accept the transaction request
    Then the request should be marked as paid
    And my account balance should decrease by $100

  @validation
  Scenario Outline: Preventing invalid transaction submissions
    # Essential: Uses Outline to avoid repetition
    Given I am creating a new transaction
    When I attempt to submit with <condition>
    Then I should see the error "<error_message>"
    # Focused: Focuses on the business rule (buttons disabled), not technical DOM events like "blur"
    And the submission actions should be disabled

    Examples:
      | condition             | error_message               |
      | a missing amount      | Please enter a valid amount |
      | a missing description | Please enter a note         |

  @search
  Scenario Outline: User search capability
    # Singular: Removed the "Clear Search" step to ensure the scenario tests only one specific behavior
    Given I am on the transaction recipient search
    When I search by "<attribute>"
    Then I should see "Receiver" in the results
    And the result should match the "<attribute>" value

    Examples:
      | attribute    |
      | First Name   |
      | Last Name    |
      | Username     |
      | Email        |
      | Phone Number |