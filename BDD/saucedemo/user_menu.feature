Feature: Application Navigation

  Background:
    # Ubiquitous: Establishes context using business terms.
    Given I am an authenticated user

  @navigation @ui
  Scenario: Accessing the main menu
    # Focused: Replaces the imperative "click burger menu" with a declarative action.
    When I open the main navigation
    # Clear: Verifies the visibility of options/links, not just the container.
    Then the menu options should be displayed

  @navigation @ui
  Scenario: Dismissing the main menu
    # Singular: Separated the "Close" action into its own atomic scenario.
    # The 'Given' step explicitly sets the necessary precondition.
    Given the main navigation is currently open
    When I close the navigation
    Then the menu options should be hidden