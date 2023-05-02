export function signUp(){
  cy.get('[href="/users/sign_up"]').should('be.visible').click()
  cy.fixture('user').then((userData) => {
    cy.get('#user_email', { timeout: 5000 }).type(userData.email)
    cy.get('#user_password').type(userData.password)
    cy.get('#user_password_confirmation').type(userData.password)

    cy.get('form').submit()
    cy.get('[role="alert"]', { timeout: 5000 }).contains('Notice! Welcome! You have signed up successfully.').should('be.visible')
    signOut()
  })
}

export function signIn() {
  cy.fixture('user').then((userData) => {
    cy.get('#sign_in_user').should('be.visible').click()
    cy.url().should('include', '/users/sign_in')

    cy.get('#user_email', { timeout: 5000 }).type(userData.email)
    cy.get('#user_password').type(userData.password)

    cy.get('form').submit()
    cy.get('[role="alert"]', { timeout: 5000 }).contains('Notice! Signed in successfully.').should('be.visible')
  })
}

export function signOut() {
  cy.get('[type="submit"]').contains('Sign Out').should('be.visible').click()
  cy.url().should('include', '/users/sign_in')
  cy.get('[role="alert"]', { timeout: 5000 }).contains('Alert! You need to sign in or sign up before continuing.').should('be.visible')
}