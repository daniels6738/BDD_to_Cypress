Feature: Todo Item Completion
  As a user
  I want to mark an item as complete
  So that I can track my progress

  Scenario: Mark an item as complete
    Given I have two todo items: "buy some cheese" and "feed the cat"
    When I mark the item "buy some cheese" as complete
    Then the item "buy some cheese" should be marked as complete
    And the item "feed the cat" should not be marked as complete
