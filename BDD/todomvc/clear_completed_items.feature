Feature: Bulk Task Management

  Background:
    # Integrous: Explicitly defines the state of BOTH items. 
    # The original script checked for "buy some cheese" in the 'Then' step 
    # without ever defining it in the 'Given' step (magic data).
    Given I have the following tasks:
      | Task               | Status    |
      | feed the cat       | Completed |
      | buy some cheese    | Active    |

  @todo @cleanup
  Scenario: Removing completed tasks
    # Focused: Replaces the imperative "click the button" with a declarative business action.
    When I clear the completed items
    # Singular/Complete: Verifies the specific business rule: 
    # 1. Completed items are gone.
    # 2. Active items are untouched (preventing side effects).
    Then "feed the cat" should be removed from the list
    And "buy some cheese" should remain in the list