describe('Logout Functionality', () => {

    beforeEach(() => {
        // Log in before running the test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();
    });

    it('should successfully log out', () => {
        // Open the burger menu and click logout
        cy.get('.bm-burger-button').click();
        cy.get('#logout_sidebar_link').click();

        // Assert that the user is returned to the login page
        cy.get('#login-button').should('be.visible');
        cy.url().should('not.include', '/inventory.html');
    });
});