Feature: Sign Up

  Scenario: As a new user
  Given I am on the Homepage
  When I click on the Sign Up Button
  Then I should see the sign up form
  And I fill in the Sign Up form and submit it
  Then I should see the successfully sign up message
