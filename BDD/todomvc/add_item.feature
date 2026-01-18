Feature: Task Management

  Background:
    # Ubiquitous: Establishes the business state rather than the specific page URL/App name.
    Given I have an empty task list

  @todo @core
  Scenario: Capturing a new task
    # Focused: Replaces "add... named..." with a clear business action.
    When I add the task "buy some cheese"
    # Singular/Essential: Verifies the core business outcome (persistence and visibility),
    # removing the UI verification of the input field clearing.
    Then "buy some cheese" should be listed in my active tasks
    And the total task count should be 1