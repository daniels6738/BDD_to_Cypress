Feature: Product Cart

  Background:
    # Integrous/Clear: Defines the test data explicitly so the verification step (price) isn't a "magic number."
    Given the product "Samsung galaxy s6" exists with a price of "360"

  @cart @core
  Scenario: Adding a product to the cart
    # Essential/Focused: Replaces the imperative "navigate home -> select -> add" flow 
    # with a declarative state and action.
    Given I am viewing the "Samsung galaxy s6" product
    When I add the product to my cart
    # Singular: The verification focuses on the outcome (cart content), 
    # hiding the "navigate to cart page" UI detail inside the step definition.
    Then the cart should contain "Samsung galaxy s6"
    And the product price should display "360"