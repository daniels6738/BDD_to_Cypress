describe('Cart - Add Product', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();
    });

    it('should add a product to the cart', () => {
        // Add the first product to the cart
        cy.get('.btn_inventory').first().click();

        // Verify the cart badge shows '1'
        cy.get('.shopping_cart_badge').should('have.text', '1');

        // Go to the cart and verify the product is there
        cy.get('.shopping_cart_link').click();
        cy.get('.cart_item').should('have.length', 1);
        cy.get('.inventory_item_name').should('exist');
    });
});