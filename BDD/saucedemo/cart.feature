Feature: Shopping Cart Management

  Scenario: Add a product to the shopping cart
    Given I am on the products page
    When I click the "Add to cart" button for the "Sauce Labs Backpack"
    Then the cart icon should show a count of "1"

  Scenario: Remove a product from the shopping cart
    Given I have the "Sauce Labs Backpack" in my cart
    When I am on the shopping cart page
    And I click the "Remove" button for the "Sauce Labs Backpack"
    Then the cart should be empty