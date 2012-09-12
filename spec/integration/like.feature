Feature: Like a shot

  @javascript
  Scenario: Making a like increment the counter
    Given there is a shot
    And I go to the homepage
    When I click at "0 likes"
    Then I should see "1 like"
