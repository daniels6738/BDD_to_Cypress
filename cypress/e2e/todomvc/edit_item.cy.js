describe('TodoMVC - Editing', function () {
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

  it('should allow me to edit an item', function () {
    // Action: Double-click the second item and edit it
    cy.get('.todo-list li')
      .eq(1) // eq(1) targets the second item
      .find('label')
      .dblclick();

    cy.get('.todo-list li')
      .eq(1)
      .find('.edit')
      .clear()
      .type('buy some sausages')
      .type('{enter}');

    // Assertion
    cy.get('.todo-list li')
      .eq(1)
      .should('contain.text', 'buy some sausages');
  });
});