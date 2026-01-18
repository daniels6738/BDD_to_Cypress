Feature: User Notifications

  Background:
    Given I am a logged-in user

  @notifications @social
  Scenario Outline: Receiving social interaction notifications
    Given "<Actor>" has <action> my transaction
    When I check my notifications
    Then I should see a notification that "<Actor>" <action> the transaction

    Examples:
      | Actor  | action    |
      | User A | liked     |
      | User A | commented |

  @notifications @financial
  Scenario Outline: Receiving transaction status notifications
    Given "<Actor>" has sent me a <type>
    When I check my notifications
    Then I should see a notification for the <type> from "<Actor>"

    Examples:
      | Actor  | type            |
      | User A | payment         |
      | User A | payment request |

  @notifications @context
  Scenario: Notifications for third-party engagement
    # Essential/Complete: Covers the "Two Receivers" logic from a single user's perspective
    # to maintain Singularity (avoiding user-switching in one scenario).
    Given I have a transaction with "User B"
    And "User C" has commented on this transaction
    When I check my notifications
    Then I should see a notification that "User C" commented

  @notifications @management
  Scenario: Marking notifications as read
    # Singular: Separated "Mark as Read" from the receiving scenario.
    Given I have unread notifications
    When I mark a notification as read
    Then my unread notification count should decrease

  @notifications @empty-state
  Scenario: Empty notifications state
    # Essential: "Configured to return no notifications" replaced with simple business state.
    Given I have no notifications
    When I view the notifications page
    Then I should see the "No Notifications" message