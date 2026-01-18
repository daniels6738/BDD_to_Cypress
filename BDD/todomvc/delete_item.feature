Feature: Task Deletion Rules

  Background:
    # Essential: Establishes the specific data required for the test.
    Given the task "feed the cat" exists

  @todo @edge-case
  Scenario: Deleting a task via empty description
    # Focused: Replaces the imperative procedural steps ("edit... leave empty") 
    # with a declarative business action describing the data change.
    When I edit the task "feed the cat" so it has an empty name 
    # Singular/Clear: Verifies the specific business rule that 
    # empty descriptions trigger a deletion.
    Then the task should be removed from the list