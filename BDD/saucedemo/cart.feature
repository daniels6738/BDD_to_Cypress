Feature: Shopping Cart Management

  @cart @add
  Scenario: Adding an item to the cart
    # Essential: Removed the explicit "Given I am on the products page" navigation step.
    # The action implies the context.
    Given I am browsing the product catalog
    # Focused: Replaced the imperative "click the Add to cart button" with a declarative action.
    When I add "Sauce Labs Backpack" to my cart
    # Clear: Verifies the business rule (cart content), not the specific UI implementation (icon badge).
    Then my cart should contain 1 item

  @cart @remove
  Scenario: Removing an item from the cart
    # Essential/Focused: Condensed the setup. Instead of "Given I have item... When I go to page...", 
    # we declare the starting state directly.
    Given my cart contains the "Sauce Labs Backpack"
    # Focused: Replaced "click the Remove button" with the business action.
    When I remove "Sauce Labs Backpack" from the cart
    Then my cart should be empty