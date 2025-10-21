Feature: Product Viewing

  Scenario: View a product's details and return to the main page
    Given I am on the products page
    When I click on the "Sauce Labs Backpack"
    Then I should be on that product's detail page
    When I click the "Back to products" button
    Then I should be returned to the main products page