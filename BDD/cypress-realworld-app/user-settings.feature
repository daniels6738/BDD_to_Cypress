Feature: User Profile Management

  Background:
    # Ubiquitous: Uses "I" for actor consistency and avoids technical "seeding/API" jargon
    Given I am on my User Settings page

  @settings @core
  Scenario: Updating profile details
    # Focused: Declarative step replacing the detailed data table of inputs
    When I update my profile with valid information
    # Singular/Clear: Verifies the business outcome (data saved), not the UI implementation (side nav)
    Then my profile should display the new details
    And I should see a confirmation that changes were saved

  @settings @validation
  Scenario Outline: Preventing invalid profile updates
    # Essential/Singular: Converted the "monster" chain of validation steps into an Outline.
    # Each row tests exactly one single thing.
    When I attempt to save with <condition>
    Then I should see the error "<error_message>"
    # Focused: Focuses on the business rule (prevent update), not the UI state (disabled button)
    And the profile update should be prevented

    Examples:
      | condition               | error_message                      |
      | a missing First Name    | Enter a first name                 |
      | a missing Last Name     | Enter a last name                  |
      | a missing Email         | Enter an email address             |
      | an invalid Email        | Must contain a valid email address |
      | a missing Phone Number  | Enter a phone number               |
      | an invalid Phone Number | Phone number is not valid          |