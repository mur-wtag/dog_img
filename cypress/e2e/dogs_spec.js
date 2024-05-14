describe("Dogs", () => {
  context("image found using input breed name", () => {
    it("loads dog image fetching image url from API", () => {
      cy.intercept("POST", "/fetch_breed_image").as("submitBreed");

      cy.visit("/");
      cy.get("[data-cy=image-container]").should("be.empty");
      cy.get("[data-cy=breed-input]").type("{selectAll}hound");
      cy.get("[data-cy=breed-submit]").click();
      cy.get("[data-cy=image-loader]").should("be.visible");
      cy.wait("@submitBreed");

      cy.get("[data-cy=image-container]").should("contain", "hound");
      cy.get("[data-cy=image-loader]").should("not.be.visible");
    });
  });

  context("image not found using input breed name", () => {
    it("show error message", () => {
      cy.intercept("POST", "/fetch_breed_image").as("submitBreed");

      cy.visit("/");
      cy.get("[data-cy=image-container]").should("be.empty");
      cy.get("[data-cy=breed-input]").type("{selectAll}abc");
      cy.get("[data-cy=breed-submit]").click();
      cy.get("[data-cy=image-loader]").should("be.visible");
      cy.wait("@submitBreed");

      cy.get("[data-cy=image-container]").should(
        "contain",
        "Breed not found (master breed does not exist)",
      );
      cy.get("[data-cy=image-loader]").should("not.be.visible");
    });
  });
});
