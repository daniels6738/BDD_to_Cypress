Feature: Task Modification

  Background:
    # Essential: Establishes the existence of the specific task immediately.
    Given the task "feed the cat" exists

  @todo @update
  Scenario: Renaming a task
    # Focused: Replaces the generic/imperative "edit... to be" with a specific business action.
    When I rename the task to "buy some sausages"
    # Singular/Complete: Verifies the full business rule of an update:
    # 1. The new value is persisted.
    # 2. The old value is removed (ensuring it was an update, not an addition).
    Then the task "buy some sausages" should be visible
    And the task "feed the cat" should no longer be visible