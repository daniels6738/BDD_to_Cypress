Feature: Task Filtering

  Background:
    # Integrous: Explicitly defines the mixed state required to validate the filter.
    # Defines both an Active and a Completed item so the test is deterministic.
    Given I have the following tasks:
      | Task               | Status    |
      | buy some cheese    | Active    |
      | feed the cat       | Completed |

  @todo @filtering
  Scenario: Filtering for active tasks
    # Focused: Replaces the imperative "filter by 'Active'" with a declarative action.
    When I view only the active tasks
    # Singular/Clear: Verifies the business rule by checking:
    # 1. The active item is present.
    # 2. The completed item is absent.
    Then "buy some cheese" should be visible
    And "feed the cat" should be hidden