Feature: Checking SMP HTML player base functionality
  As a tester of SMP
  I want to check base functionality of SMP HTML player
  So that I verify its working as expected

  Scenario: Check basic HTML functionality
    Given I am on a page with a HTML player
    When I click on CTA to begin playback
    Then I should be able to pause
    And play
    And unmute player
    And click each volume bar
    And mute again
    And enter full-screen
    And verify previous inputs work
    And exit full-screen again
    And seek in quarters to the end
    And be prompted with a clickable CTA again
