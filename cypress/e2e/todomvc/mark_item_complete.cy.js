describe('Todo Item Completion', function () {
  const TODO_ITEM_ONE = 'buy some cheese';
  const TODO_ITEM_TWO = 'feed the cat';

  beforeEach(function () {
    cy.visit('http://localhost:8888/');
  });

  afterEach(() => {
    cy.window().then((win) => {
      win.document.activeElement.blur();
    });
  });

  it('Mark an item as complete', function () {
    // Setup: Create two todos by inlining the createTodo command
    cy.get('.new-todo').type(`${TODO_ITEM_ONE}{enter}`);
    cy.get('.new-todo').type(`${TODO_ITEM_TWO}{enter}`);

    // Action: Mark the first item as complete
    cy.get('.todo-list li')
      .first()
      .find('.toggle')
      .check();

    // Assertions
    cy.get('.todo-list li')
      .first()
      .should('have.class', 'completed');

    cy.get('.todo-list li')
      .last()
      .should('not.have.class', 'completed');
  });
});