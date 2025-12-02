describe('Product Details Page', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.login();
    });

    it("View a product's details and return to the inventory page", () => {
        // Click on the first product's title
        cy.get('.inventory_item_name').first().click();
        
        // Assert that the details container is visible
        cy.url().should('include', 'inventory-item.html');
        cy.get('.inventory_details_desc_container').should('be.visible');
        
        // Click the 'Back to products' button
        cy.get('.inventory_details_back_button').click({ force: true });
        
        // Assert that the main inventory page is visible again
        cy.get('.product_label').should('be.visible');
        cy.url().should('include', 'inventory.html');
    });
});