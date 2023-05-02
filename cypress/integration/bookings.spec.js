/// <reference types="cypress" />

import { signUp, signIn, signOut } from '../support/authentication';

describe('Booking', () => {
  let booking, totalCost, totalVisibleCost;

  before(() => {
    cy.visit('/')
    signUp()
    signIn()

    cy.fixture('booking').then((bookingData) => {
      booking = bookingData.booking;
      totalCost = bookingData.fixed_cost + (booking.hours_requested * (booking.animal_type === 'dog' ? 10 : 5))
      totalVisibleCost = '$' + totalCost.toFixed(2)
    })
  })

  it('creates booking successfully', () => {
    cy.wrap(booking).then((b) => {
      cy.get('#booking_first_name').type(b.first_name).should('have.value', b.first_name)
      cy.get('#booking_last_name').type(b.last_name).should('have.value', b.last_name)
      cy.get('#booking_animal_type').select(b.animal_type).should('have.value', b.animal_type)
      cy.get('#booking_animal_name').type(b.animal_name).should('have.value', b.animal_name)
      cy.get('#booking_hours_requested').clear().type(b.hours_requested).should('have.value', b.hours_requested)
      cy.get('#booking_date_of_service').type(b.date_of_service).should('have.value', b.date_of_service)
    })

    cy.get('#create_booking').should('be.visible').click()
    cy.get('[role="alert"]', {timeout: 5000}).contains('Success! Booking added successfully!').should('be.visible')
  })

  it('verifies that booking is addedd successfully with correct cost', () => {
    cy.url().should('include', '/bookings')
    cy.get('table tbody tr').filter(':last').should('be.visible').within(() => {
      cy.contains(booking.first_name)
      cy.contains(booking.last_name)
      cy.contains(booking.animal_name)
      cy.contains(booking.animal_type)
      cy.contains(booking.hours_requested)
      cy.contains(booking.date_of_service)
      cy.contains(totalVisibleCost)
    })
  })

  after(() => {
    signOut()
  })
})
