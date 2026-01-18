Feature: Shopping Cart Management

  @cart @add
  Scenario: Adding an item to the cart
    Given I am browsing the product catalog
    When I add "Sauce Labs Backpack" to my cart
    Then my cart should contain 1 item

  @cart @remove
  Scenario: Removing an item from the cart
    Given my cart contains the "Sauce Labs Backpack"
    When I remove "Sauce Labs Backpack" from the cart
    Then my cart should be empty