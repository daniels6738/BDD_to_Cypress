Feature: Checkout Process

  Background:
    Given I have products in my shopping cart

  @checkout @happy-path
  Scenario: Successful order placement
    # Focused/Essential: Replaces the imperative chain of navigation and data entry 
    # ("proceed", "fill in", "continue") with a single declarative business action.
    When I complete the checkout with valid shipping details
    # Clear/Singular: Verifies the clear business outcome (order processed), 
    # not just the UI confirmation message.
    Then my order should be successfully processed
    And I should see the order confirmation