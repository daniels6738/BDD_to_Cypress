Feature: Todo List Management
  As a user
  I want to add new items to my todo list
  So that I can track what I need to do

  Scenario: Add a new todo item
    Given I am on the TodoMVC page
    When I add a new todo item named "buy some cheese"
    Then the todo list should contain 1 item
    And the item should be named "buy some cheese"
    And the new todo input field should be empty
