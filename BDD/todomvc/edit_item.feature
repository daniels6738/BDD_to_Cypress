Feature: Task Modification

  Background:
    Given the task "feed the cat" exists

  @todo @update
  Scenario: Renaming a task
    When I rename the task to "buy some sausages"
    Then the task "buy some sausages" should be visible
    And the task "feed the cat" should no longer be visible