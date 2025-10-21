describe('Login Functionality', () => {

    beforeEach(() => {
        // Visit the homepage before each test
        cy.visit('https://www.saucedemo.com/v1/');
    });

    it('should successfully log in with valid credentials', () => {
        // Type correct username and password
        cy.get('#user-name').type('standard_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();

        // Assert that the user is redirected to the inventory page
        cy.get('.product_label').should('exist');
        cy.url().should('include', '/inventory.html');
    });
});