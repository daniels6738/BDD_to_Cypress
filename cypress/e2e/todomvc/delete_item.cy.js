describe('Todo Item Deletion', function () {
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

  it('Delete an item by editing it to be empty', function () {
    // Action: Edit the second item and clear its text
    cy.get('.todo-list li')
      .eq(1)
      .find('label')
      .dblclick();

    cy.get('.todo-list li')
      .eq(1)
      .find('.edit')
      .clear()
      .type('{enter}');

    // Assertion
    cy.get('.todo-list li').should('have.length', 2);
    cy.get('.todo-list').should('not.contain.text', 'feed the cat');
  });
});