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

  it("Add item to cart and cart count shows 1", () => {
    cy.contains("My Cart (0)");
    cy.contains("Add").first().click({ force: true });
    cy.contains("My Cart (1)");

    // cy.get(".products article .btn").first().click();
    // cy.get(".nav-item .nav-link").should("conatin.text", "My Cart (1)");
  });

});