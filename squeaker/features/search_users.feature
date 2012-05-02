Feature: Searching for users

  Scenario: Finding a single user
    Given a user called "Sam" exists
    When I search for "Sam"
    Then I should see "Sam" in the list of results
