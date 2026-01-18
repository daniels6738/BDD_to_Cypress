Feature: Checkout Process

  Background:
    Given I have products in my shopping cart

  @checkout @happy-path
  Scenario: Successful order placement
    When I complete the checkout with valid shipping details
    Then my order should be successfully processed
    And I should see the order confirmation