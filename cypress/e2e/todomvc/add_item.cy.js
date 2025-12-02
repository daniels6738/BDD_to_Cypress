describe('Todo List Management', function () {
  const TODO_ITEM_ONE = 'buy some cheese';

  beforeEach(function () {
    cy.visit('http://localhost:8888/');
  });

  afterEach(() => {
    cy.window().then((win) => {
      win.document.activeElement.blur();
    });
  });

  it('Add a new todo item', function () {
    // Action: Create the todo
    cy.get('.new-todo').type(`${TODO_ITEM_ONE}{enter}`);

    // Assertions
    cy.get('.todo-list li')
      .should('have.length', 1)
      .and('contain.text', TODO_ITEM_ONE);
    
    // Assert that the input field is cleared
    cy.get('.new-todo').should('have.text', '');
  });
});