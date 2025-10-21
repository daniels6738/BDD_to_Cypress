Feature: Shopping Cart Management

  Scenario: Remove a product from the shopping cart
    Given I have the "Sauce Labs Backpack" in my cart
    When I am on the shopping cart page
    And I click the "Remove" button for the "Sauce Labs Backpack"
    Then the cart should be empty