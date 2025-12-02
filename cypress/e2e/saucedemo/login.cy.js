import './commands';

describe('Login Functionality', () => {

    beforeEach(() => {
        // Visit the homepage before each test
        cy.visit('https://www.saucedemo.com');
    });

    it('Successful login with valid credentials', () => {
        // Type correct username and password
        cy.login();

        // Assert that the user is redirected to the inventory page
        cy.get('#inventory_container').should('exist');
        cy.url().should('include', '/inventory.html');
    });

    it('Unsuccessful login with invalid credentials', () => {
        // Type incorrect username and correct password
        cy.login('wrong_user', 'secret_sauce');

        // Assert that the error message is displayed
        cy.get('[data-test="error"]').should('exist')
            .and('contain.text', 'Username and password do not match any user in this service');
    });

    it('Successfully log out from the application', () => {
        // Log in before running the test
        cy.login();

        // Open the burger menu and click logout
        cy.get('.bm-burger-button').click();
        cy.get('#logout_sidebar_link').click();

        // Assert that the user is returned to the login page
        cy.get('#login-button').should('be.visible');
        cy.url().should('not.include', '/inventory.html');
    });
});