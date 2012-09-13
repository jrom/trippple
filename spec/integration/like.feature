Feature: Like a shot

  @javascript
  Scenario: Counter increment
    Given there is a shot
    And I go to the homepage
    And I wait a second
    When I click at "0 likes"
    And I wait a second
    Then I should see "1 like"
    When I click at "1 like"
    And I wait a second
    Then I should see "2 likes"
