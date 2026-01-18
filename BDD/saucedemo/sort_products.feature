Feature: Product Catalog Sorting

  Background:
    Given I am viewing the product catalog

  @catalog @sorting
  Scenario Outline: Organizing products by attribute
    When I sort the inventory by "<criteria>"
    Then the products should be displayed in <expected_order>

    Examples:
      | criteria      | expected_order       |
      | Name (Z to A) | reverse-alphabetical |
      | Name (A to Z) | alphabetical         |
      | Price (Low)   | ascending price      |