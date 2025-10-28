Feature: Product Cart
  As a user
  I want to add a product to my shopping cart
  So that I can purchase it

  Scenario: Add a specific product to the cart
    Given I am on the home page
    When I select the product "Samsung galaxy s6"
    And I add the product to the cart
    And I navigate to the cart page
    Then I should see "Samsung galaxy s6" in the cart
    And I should see the product price "360"