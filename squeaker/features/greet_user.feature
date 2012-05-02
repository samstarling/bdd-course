Feature: Greet the user in a pleasant manner
  This is so that we can say hello and be nice to people.
  
  Scenario: Greet users who are not logged in
    Given I am not logged in
    When I visit the homepage
    Then I should see "Hello stranger"

  Scenario: Greet registered users who are logged in
    Given a user called "Sam" exists
    When I log in as "Sam"
    And I visit the homepage
    Then I should see "Hello Sam"

