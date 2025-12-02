describe('Product Sorting', () => {

    beforeEach(() => {
        // Log in before each test
        cy.visit('https://www.saucedemo.com/v1/');
        cy.login();
    });

    it('Sort products by name from Z to A', () => {
        // Verify the sort container exists
        cy.get('.product_sort_container').should('exist');
        
        // Get the name of the first item before sorting
        let firstItemNameBefore;
        cy.get('.inventory_item_name').first().then(($el) => {
            firstItemNameBefore = $el.text();
        });
        
        // Select the 'Name (Z to A)' option
        cy.get('.product_sort_container').select('za');
        
        // Verify the first item has changed and is now the correct one
        cy.get('.inventory_item_name').first().should(($el) => {
            const firstItemNameAfter = $el.text();
            expect(firstItemNameAfter).not.to.equal(firstItemNameBefore);
            expect(firstItemNameAfter).to.equal('Test.allTheThings() T-Shirt (Red)');
        });
    });
});