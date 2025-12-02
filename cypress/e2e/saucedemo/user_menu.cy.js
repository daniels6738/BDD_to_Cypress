describe('User Menu', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.login();
    });

    it('Open and close the sidebar menu', () => {
        // Open the menu and verify it is visible
        cy.get('.bm-burger-button').click();
        cy.get('.bm-menu').should('be.visible');
        cy.get('#logout_sidebar_link').should('be.visible');

        // Close the menu and verify it is not visible
        cy.get('.bm-cross-button').click();
        cy.get('.bm-menu').should('not.be.visible');
    });
});