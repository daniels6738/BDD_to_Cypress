Feature: User Profile Management

  Background:
    Given I am on my User Settings page

  @settings @core
  Scenario: Updating profile details
    When I update my profile with valid information
    Then my profile should display the new details
    And I should see a confirmation that changes were saved

  @settings @validation
  Scenario Outline: Preventing invalid profile updates
    When I attempt to save with <condition>
    Then I should see the error "<error_message>"
    And the profile update should be prevented

    Examples:
      | condition               | error_message                      |
      | a missing First Name    | Enter a first name                 |
      | a missing Last Name     | Enter a last name                  |
      | a missing Email         | Enter an email address             |
      | an invalid Email        | Must contain a valid email address |
      | a missing Phone Number  | Enter a phone number               |
      | an invalid Phone Number | Phone number is not valid          |