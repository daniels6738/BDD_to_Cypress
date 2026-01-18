Feature: Task Deletion Rules

  Background:
    Given the task "feed the cat" exists

  @todo @edge-case
  Scenario: Deleting a task via empty description
    When I edit the task "feed the cat" so it has an empty name 
    Then the task should be removed from the list