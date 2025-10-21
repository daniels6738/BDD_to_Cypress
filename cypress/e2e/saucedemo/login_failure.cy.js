describe('Login Functionality', () => {

    beforeEach(() => {
        // Visit the homepage before each test
        cy.visit('https://www.saucedemo.com/v1/');
    });

    it('should display an error message with invalid credentials', () => {
        // Type incorrect username and correct password
        cy.get('#user-name').type('wrong_user');
        cy.get('#password').type('secret_sauce');
        cy.get('#login-button').click();

        // Assert that the error message is displayed
        cy.get('[data-test="error"]').should('exist')
            .and('contain.text', 'Username and password do not match any user in this service');
    });
});