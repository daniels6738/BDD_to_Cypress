describe('Product Cart', () => {
  const product = "Samsung galaxy s6";
  const productPrice = "360";
  const cartCallToAction = "Add to cart";
  const cartButtonDashboard = '[id="cartur"]';

  beforeEach(() => {
    // Visit the homepage before each test
    cy.visit('https://www.demoblaze.com/');
  });

  it('should add a product to the cart', () => {
    // Select the product, then add it to the cart
    cy.get("a").contains(product).click();
    cy.get("a").contains(cartCallToAction).click();

    // Go to cart and check product is displayed correctly
    cy.get(cartButtonDashboard).click();
    cy.get("td").contains(product).should('be.visible');
    cy.get("td").contains(productPrice).should('be.visible');
  });
});