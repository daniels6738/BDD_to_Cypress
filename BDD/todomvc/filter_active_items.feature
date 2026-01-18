Feature: Task Filtering

  Background:
    Given I have the following tasks:
      | Task               | Status    |
      | buy some cheese    | Active    |
      | feed the cat       | Completed |

  @todo @filtering
  Scenario: Filtering for active tasks
    When I view only the active tasks
    Then "buy some cheese" should be visible
    And "feed the cat" should be hidden