Feature: Check the encoders

  Scenario: Check than an encoder is free
    Given encoder "1A" is in a default state
    When I visit the server status page
    Then encoder "1A" should be free
  
  Scenario: Check that problematic encoders are reported
    Given all the odd encoders have errors
    When I visit the server status page
    Then I should be told there is a problem with encoders "04,06,08,10,12,14,1B"
    