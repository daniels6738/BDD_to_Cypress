describe('Login Functionality', function () {

    beforeEach(() => {
        // Visit the homepage before each test
        cy.visit('https://demoblaze.com/')
    });
    it('Successful login with valid credentials', () => {
        // Press login button
        cy.get('#login2').click();

        // Wait for modal form to appear
        cy.wait(3000);

        // Enter credentials
        cy.get('#loginusername').type('demoblaze');
        cy.get('#loginpassword').type('demoblaze');

        // Submit form
        cy.get('#logInModal button.btn-primary').click();

        // Check that the logout button is visible to ensure user is logged in
        cy.get('#logout2', { timeout: 6000 }).should('be.visible');

        // Check that login button is no longer there
        cy.get('#login2').should('not.be.visible');

    });

    it('Unsuccessful login with invalid credentials', () => {
        // Press login button
        cy.get('#login2').click();

        // Wait for modal form to appear
        cy.wait(3000);

        // Enter wrong credentials
        cy.get('#loginusername').type('bdd-auto-cypress');
        cy.get('#loginpassword').type('12345');

        // Submit form
        cy.get('#logInModal button.btn-primary').click();

        // Check that the login was unsuccesful and alert is displayed
        cy.on('window:alert', (text) => {
            expect(text).to.equal('User does not exist.');
        });

        // Check that logout button is not there
        cy.get('#logout2').should('not.be.visible');

    });
});