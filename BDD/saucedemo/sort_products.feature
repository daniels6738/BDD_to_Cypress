Feature: Product Catalog Sorting

  Background:
    # Ubiquitous: Establishes context without UI navigation steps.
    Given I am viewing the product catalog

  @catalog @sorting
  Scenario Outline: Organizing products by attribute
    # Focused: Replaces the specific UI interaction ("select option") 
    # with a declarative business action.
    When I sort the inventory by "<criteria>"
    # Integrous/Clear: Verifies the *behavior* of the list (the sorting logic),
    # rather than checking for a specific hardcoded item which makes the test brittle.
    Then the products should be displayed in <expected_order>

    Examples:
      | criteria      | expected_order       |
      | Name (Z to A) | reverse-alphabetical |
      # Complete: The Outline structure easily supports other sorting requirements
      # without duplicating scenarios.
      | Name (A to Z) | alphabetical         |
      | Price (Low)   | ascending price      |