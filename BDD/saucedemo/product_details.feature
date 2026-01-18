Feature: Product Details Navigation

  Background:
    Given the product "Sauce Labs Backpack" exists in the catalog

  @product @details
  Scenario: Viewing product details
    Given I am browsing the product catalog
    When I view the details for "Sauce Labs Backpack"
    Then I should see the product description and price

  @product @navigation
  Scenario: Returning to the catalog
    Given I am viewing details for "Sauce Labs Backpack"
    When I return to the catalog
    Then I should see the full list of products