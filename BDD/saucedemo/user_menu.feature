Feature: Application Navigation

  Background:
    Given I am an authenticated user

  @navigation @ui
  Scenario: Accessing the main menu
    When I open the main navigation
    Then the menu options should be displayed

  @navigation @ui
  Scenario: Dismissing the main menu
    Given the main navigation is currently open
    When I close the navigation
    Then the menu options should be hidden