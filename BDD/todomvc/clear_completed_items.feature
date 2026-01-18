Feature: Bulk Task Management

  Background:
    Given I have the following tasks:
      | Task               | Status    |
      | feed the cat       | Completed |
      | buy some cheese    | Active    |

  @todo @cleanup
  Scenario: Removing completed tasks
    When I clear the completed items
    Then "feed the cat" should be removed from the list
    And "buy some cheese" should remain in the list