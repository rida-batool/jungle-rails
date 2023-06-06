/// <reference types="cypress" />

describe('Jungle app', () => {
  beforeEach(() => {
    // Cypress starts out with a blank slate for each test
    // so we must tell it to visit our website with the `cy.visit()` command.
    // Since we want to visit the same URL at the start of all our tests,
    // we include it in our beforeEach function so that it runs before each test
    cy.visit('/');
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });

  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  // We can go even further and check that the default todos each contain
  // the correct text. We use the `first` and `last` functions
  // to get just the first and last matched elements individually,
  // and then perform an assertion with `should`.
  // cy.get('.todo-list li').first().should('have.text', 'Pay electric bill')
  // cy.get('.todo-list li').last().should('have.text', 'Walk the dog')
});

