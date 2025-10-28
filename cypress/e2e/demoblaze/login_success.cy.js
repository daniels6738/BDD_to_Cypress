describe('Login Functionality', function() {

    beforeEach(() => {
        // Visit the homepage before each test
        cy.visit('https://demoblaze.com/')
    });
    it('should succesfully login with valid credentials', () => {
        // Press login button
        cy.get('#login2').click();
    
        // Enter credentials
        cy.get('#loginusername').type('demoblaze');
        cy.get('#loginpassword').type('demoblaze');

        // Submit form
        cy.get('#logInModal button.btn-primary').click();

        // Check that the logout button is visible to ensure user is logged in
        cy.get('#logout2').should('be.visible');

        // Check that login button is no longer there
        cy.get('#login2').should('not.be.visible');
        
    });
});