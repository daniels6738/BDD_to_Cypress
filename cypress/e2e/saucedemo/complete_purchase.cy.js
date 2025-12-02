describe('Checkout Process', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.login();
    });

    it('Complete a purchase successfully', () => {
        // Add a product to the cart
        cy.get('.btn_inventory').first().click();
        cy.get('.shopping_cart_link').click();
        
        // Proceed to checkout
        cy.get('.checkout_button').click();
        
        // Fill out the user information form
        cy.get('[data-test="firstName"]').type('John');
        cy.get('[data-test="lastName"]').type('Doe');
        cy.get('[data-test="postalCode"]').type('12345');
        cy.get('.cart_button').click();
        
        // Finish the purchase
        cy.get('.cart_button').click();
        
        // Assert the completion message
        cy.get('.complete-header').should('have.text', 'THANK YOU FOR YOUR ORDER');
        cy.get('.complete-text').should('exist');
    });
});