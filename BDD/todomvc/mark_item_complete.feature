Feature: Task Completion Status

  Background:
    Given I have the following active tasks:
      | Task               |
      | buy some cheese    |
      | feed the cat       |

  @todo @status
  Scenario: Completing a task
    When I complete the task "buy some cheese"
    Then "buy some cheese" should be listed as completed
    And "feed the cat" should remain active