Feature: User Notifications

  Background:
    Given the application state is seeded with users and transactions
    And API requests for notifications, transactions, and comments are intercepted
    And the test context contains User A, User B, and User C

  @like
  Scenario: User A likes User B's transaction, and User B is notified
    Given User A is logged in
    And User A navigates to a transaction belonging to User B
    Then the notifications badge should display the current count
    When User A clicks the like button on the transaction
    Then the like count should increment by 1
    And the like button should be disabled
    When User B logs in
    And User B navigates to the notifications page
    Then User B should have a notification that User A "liked" their transaction
    When User B marks the first notification as read
    Then the total number of notifications should be less than the previous count

  @like @two-receivers
  Scenario: User C likes a transaction between User A and User B, and both A and B are notified
    Given User C is logged in
    And User C navigates to a transaction between User A (receiver) and User B (sender)
    When User C clicks the like button on the transaction
    Then the like count should increment by 1
    When User A logs in
    And User A navigates to the notifications page
    Then User A should have a notification that User C "liked" the transaction
    When User B logs in
    And User B navigates to the notifications page
    Then User B should have a notification that User C "liked" the transaction

  @comment
  Scenario: User A comments on User B's transaction, and User B is notified
    Given User A is logged in
    And User A navigates to a transaction belonging to User B
    When User A enters the comment "Thank You" and submits
    Then the comment is posted successfully
    When User B logs in
    And User B navigates to the notifications page
    Then User B should have a notification that User A "commented" on their transaction

  @comment @two-receivers
  Scenario: User C comments on a transaction between User A and User B, and both A and B are notified
    Given User C is logged in
    And User C navigates to a transaction between User A (receiver) and User B (sender)
    When User C enters the comment "Thank You" and submits
    Then the comment is posted successfully
    When User A logs in
    And User A navigates to the notifications page
    Then User A should have a notification that User C "commented" on the transaction
    When User B logs in
    And User B navigates to the notifications page
    Then User B should have a notification that User C "commented" on the transaction

  @payment @transaction-notification
  Scenario: User A sends a payment to User B, and User B is notified
    Given User A is logged in
    When User A creates a payment transaction of amount "30" with description "Pizza" to User B
    Then the transaction is created successfully
    When User B logs in
    And User B navigates to the notifications page
    Then User B should have a notification that User A "received payment"

  @request @transaction-notification
  Scenario: User A sends a payment request to User C, and User C is notified
    Given User A is logged in
    When User A creates a request transaction of amount "300" with description "Airfare" from User C
    Then the transaction is created successfully
    When User C logs in
    And User C navigates to the notifications page
    Then User C should have a notification that User A "requested payment"

  @empty-state
  Scenario: Renders an empty notifications state
    Given the application is configured to return no notifications
    When User A logs in
    And User A navigates to the Notifications page
    Then the notification list should not be visible
    And an empty list header should contain the text "No Notifications"