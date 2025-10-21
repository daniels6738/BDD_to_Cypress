Feature: Shopping Cart Management

  Scenario: Add a product to the shopping cart
    Given I am on the products page
    When I click the "Add to cart" button for the "Sauce Labs Backpack"
    Then the cart icon should show a count of "1"