Feature: Checking SMP HTML player base functionality
  As a tester of SMP
  I want to check base functionality of SMP HTML player
  So that I verify its working as expected

  Scenario: Check basic HTML functionality
    Given I am on a page with a HTML player
    When I click on CTA to begin playback
    Then I can pause
    And I can verify controlbar fades instantly when hover away
    And I can play
    And I can unmute player
    And I can click each volume bar
    And I can mute
    And I can click seekbar
    And I can see thumbnails
    And I can enter fullscreen
    And I can click seekbar fullscreen
    And I can see thumbnails
    And I can pause
    And I can unmute player
    And I can click each volume bar
    And I can mute
    And I can play
    And I can seek in quarters to the end
    And I can see controlbar when finished
    And I can exit fullscreen
    And I can hover over a visible CTA again
    And I can restart by clicking anywhere in player hitbox