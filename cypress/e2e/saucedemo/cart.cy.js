import './commands';

describe('Shopping Cart Management', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com');
        cy.login();
    });

    it('Add a product to the shopping cart', () => {
        // Add the first product to the cart
        cy.get('.btn_inventory').first().click();

        // Verify the cart badge shows '1'
        cy.get('.shopping_cart_badge').should('have.text', '1');

        // Go to the cart and verify the product is there
        cy.get('.shopping_cart_link').click();
        cy.get('.cart_item').should('have.length', 1);
        cy.get('.inventory_item_name').should('exist');
    });

    it('Remove a product from the shopping cart', () => {
        
        // Add the first product to the cart
        cy.get('.btn_inventory').first().click();
        
        // Go to the cart
        cy.get('.shopping_cart_link').click();

        // Verify the item is in the cart
        cy.get('.cart_item').should('have.length', 1);
        
        // Remove the item
        cy.get('.cart_button').click();
        
        // Verify the cart is now empty
        cy.get('.cart_item').should('not.exist');
        cy.get('.shopping_cart_badge').should('not.exist');
    });
});