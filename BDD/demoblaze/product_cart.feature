Feature: Product Cart

  Background:
    Given the product "Samsung galaxy s6" exists with a price of "360"

  @cart @core
  Scenario: Adding a product to the cart
    Given I am viewing the "Samsung galaxy s6" product
    When I add the product to my cart
    Then the cart should contain "Samsung galaxy s6"
    And the product price should display "360"