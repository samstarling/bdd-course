Feature: Greet the user in a pleasant manner
  This is so that we can say hello and be nice to people.
  
  Scenario: Greet users who are not logged in
    Given I am not logged in
    When I visit the homepage
    Then I should see "hello stranger"

