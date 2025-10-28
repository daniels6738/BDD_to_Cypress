Feature: Login Functionality

  Scenario: Successful login with valid credentials
    Given I am not logged on the application
    When I click the Log in button
    And I enter the username "demoblaze"
    And I enter the password "demoblaze"
    And I click the Log in button
    Then the page should be refreshed
    And I should not see the Log in button anymore