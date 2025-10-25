describe('TodoMVC - Clear Completed', function () {
  beforeEach(function () {
    cy.visit('http://localhost:8888/');

    // Setup: Create default todos by inlining the createDefaultTodos command
    const TODO_ITEM_ONE = 'buy some cheese';
    const TODO_ITEM_TWO = 'feed the cat';
    const TODO_ITEM_THREE = 'book a doctors appointment';
    cy.get('.new-todo')
      .type(`${TODO_ITEM_ONE}{enter}`)
      .type(`${TODO_ITEM_TWO}{enter}`)
      .type(`${TODO_ITEM_THREE}{enter}`);
  });

  afterEach(() => {
    cy.window().then((win) => {
      win.document.activeElement.blur();
    });
  });

  it('should remove completed items when clicked', function () {
    // Setup: Mark the second item as complete
    cy.get('.todo-list li')
      .eq(1)
      .find('.toggle')
      .check();

    // Action: Click the "Clear completed" button
    cy.get('.clear-completed').click();

    // Assertions
    cy.get('.todo-list li').should('have.length', 2);
    cy.get('.todo-list li').eq(0).should('contain.text', 'buy some cheese');
    cy.get('.todo-list li').eq(1).should('contain.text', 'book a doctors appointment');
  });
});