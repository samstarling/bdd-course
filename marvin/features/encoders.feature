Feature: Check the encoders

  Scenario: Check than an encoder is free
    Given encoder "1A" is in a default state
    When I visit the server status page
    Then encoder "1A" should be free