Feature: Sign up
  Scenario: There's a link in the homepage
    When I go to the homepage
    Then I should see a "Sign up" link

  Scenario: Needs a user name
    When I go to the sign up page
    And I fill in "Email" with "user@example.com"
    And I fill in "Password" with "password"
    And I click on "Sign up"
    Then I should see "Name can't be blank"

  Scenario: Successful sign up
    When I go to the sign up page
    And I fill in "Email" with "user@example.com"
    And I fill in "Name" with "Jony Cash"
    And I fill in "Password" with "password"
    And I click on "Sign up"
    Then I should see "Welcome! You have signed up successfully."
    And I should see "Jony Cash" in the preheader
