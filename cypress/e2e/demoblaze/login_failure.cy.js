describe('Login Functionality', function () {

    beforeEach(() => {
        // Visit the homepage before each test
        cy.visit('https://demoblaze.com/')
    });
    it('should display a login failure message', () => {
        // Press login button
        cy.get('#login2').click();

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