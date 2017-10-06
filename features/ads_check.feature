Feature: Checking SMP Ads
  As a tester of SMP
  I want to check Ads work with SMP
  So that I verify SMP works during and after ad playback

  Scenario: Check basic HTML functionality
    Given I am on a page that plays an AD
    When I click on CTA to begin playback
    And I can see AD controlbar
    And I can AD pause
    And I can see AD controlbar
    And I can AD play
    And I can wait for AD to finish
    And I can see controlbar fade instantly when cursor hovers away
    And I can pause
    And I can see controlbar fade instantly when cursor hovers away
    And I can play
    And I can see controlbar fade instantly when cursor hovers away
    And I can unmute player
    And I can see controlbar fade instantly when cursor hovers away
    And I can click each volume bar
    And I can mute
    And I can click seekbar
    And I can see thumbnails
    And I can enter fullscreen
    And I can see controlbar
    And I can click seekbar in fullscreen
    And I can see thumbnails
    And I can pause
    And I can see controlbar fade instantly when cursor hovers away
    And I can unmute player
    And I can click each volume bar
    And I can mute
    And I can see controlbar fade instantly when cursor hovers away
    And I can play
    And I can seek in quarters to the end
    And I can see controlbar when finished
    And I can exit fullscreen
    And I can hover over a visible CTA again
    And I can restart by clicking anywhere in player hitbox