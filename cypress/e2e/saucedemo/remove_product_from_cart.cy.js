describe('Cart - Remove Product', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();
        
        // Add an item to the cart to set up the test state
        cy.get('.btn_inventory').first().click();
        cy.get('.shopping_cart_link').click();
    });

    it('should remove a product from the cart', () => {
        // Verify the item is in the cart
        cy.get('.cart_item').should('have.length', 1);
        
        // Remove the item
        cy.get('.cart_button').click();
        
        // Verify the cart is now empty
        cy.get('.cart_item').should('not.exist');
        cy.get('.shopping_cart_badge').should('not.exist');
    });
});