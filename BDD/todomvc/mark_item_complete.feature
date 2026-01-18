Feature: Task Completion Status

  Background:
    # Integrous: Uses a data table to clearly define the test data state,
    # avoiding the "wordy" parsing of the original single-line Given step.
    Given I have the following active tasks:
      | Task               |
      | buy some cheese    |
      | feed the cat       |

  @todo @status
  Scenario: Completing a task
    # Focused: Replaces the procedural "mark item... as complete" with the business action.
    When I complete the task "buy some cheese"
    # Complete: Verifies the full scope of the business logic:
    # 1. The target item status changes.
    # 2. Other items are unaffected (preventing regression/side effects).
    Then "buy some cheese" should be listed as completed
    And "feed the cat" should remain active