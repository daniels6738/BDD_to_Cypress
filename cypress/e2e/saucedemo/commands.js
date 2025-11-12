Cypress.Commands.add('login', (username = 'standard_user', password = 'secret_sauce') => {
    cy.get('#user-name').type(username);
    cy.get('#password').type(password);
    cy.get('#login-button').click();
});
