Feature: Logout Functionality

  Scenario: Successfully log out from the application
    Given I am logged in as a standard user
    When I open the sidebar menu
    And I click the logout link
    Then I should be on the login page