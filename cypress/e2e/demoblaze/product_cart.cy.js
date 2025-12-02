describe('Product Cart', () => {

  beforeEach(() => {
    // Visit the homepage before each test
    cy.visit('https://www.demoblaze.com/');
  });

  it('Add a specific product to the cart', () => {
    // Select the product, then add it to the cart
    cy.get("a").contains("Samsung galaxy s6").click();
    cy.get("a").contains("Add to cart").click();

    // Go to cart and check product is displayed correctly
    cy.get('[id="cartur"]').click();
    cy.get("td").contains("Samsung galaxy s6").should('be.visible');
    cy.get("td").contains("360").should('be.visible');
  });
});