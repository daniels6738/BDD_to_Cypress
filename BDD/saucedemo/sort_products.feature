Feature: Product Sorting

  Scenario: Sort products by name from Z to A
    Given I am on the products page
    When I select the "Name (Z to A)" sort option
    Then the "Test.allTheThings() T-Shirt (Red)" should be the first item listed