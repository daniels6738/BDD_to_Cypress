Feature: Checkout Process

  Scenario: Complete a purchase successfully
    Given I have a product in my cart
    When I proceed to the checkout information page
    And I fill in my first name as "John", last name as "Doe", and postal code as "12345"
    And I continue to the checkout overview page
    And I finish the purchase
    Then I should see the order completion message