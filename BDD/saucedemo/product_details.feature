Feature: Product Details Navigation

  Background:
    # Ubiquitous: Sets up the domain data without UI navigation steps.
    Given the product "Sauce Labs Backpack" exists in the catalog

  @product @details
  Scenario: Viewing product details
    # Focused: Declarative action ("view details") replaces imperative clicks.
    Given I am browsing the product catalog
    When I view the details for "Sauce Labs Backpack"
    # Clear: Verifies the presence of detail information, not just the page URL.
    Then I should see the product description and price

  @product @navigation
  Scenario: Returning to the catalog
    # Singular: Separated the "Back" navigation into its own atomic test.
    # The 'Given' step establishes the specific precondition state.
    Given I am viewing details for "Sauce Labs Backpack"
    When I return to the catalog
    Then I should see the full list of products