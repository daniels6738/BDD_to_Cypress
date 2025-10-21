Feature: Sidebar Menu

  Scenario: Open and close the sidebar menu
    Given I am logged in as a standard user
    When I click the burger menu button
    Then the sidebar menu should be visible
    When I click the close menu button
    Then the sidebar menu should not be visible