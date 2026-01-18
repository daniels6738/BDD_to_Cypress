Feature: Task Management

  Background:
    Given I have an empty task list

  @todo @core
  Scenario: Capturing a new task
    When I add the task "buy some cheese"
    Then "buy some cheese" should be listed in my active tasks
    And the total task count should be 1