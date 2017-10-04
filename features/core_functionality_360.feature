Feature: Checking 360 player base functionality
  As a tester of SMP
  I want to check base functionality of 360 player
  So that I verify its working as expected

  Scenario: Check basic 360  accessibility
    Given I am on a page with a 360 player
    When I click on CTA to begin playback
    Then I click away
    
    And I tab to compass
    And I can press LEFT key
    And I can press RIGHT key
    And I can press UP key
    And I can press DOWN key
    And I can press ENTER key
    And I can click then hold left arrow
    And I can click then hold right arrow
    And I can click then hold up arrow
    And I can click then hold down arrow
    And I can click RESET

    And I click away
    And I tab to controlbar
    And I can pause
    And I can play
    And I can unmute player
    And I can click each volume bar
    And I can mute
    And I can click seekbar
    And I can enter fullscreen
    And I can click seekbar fullscreen

    And I tab to compass
    And I can press LEFT key
    And I can press RIGHT key
    And I can press UP key
    And I can press DOWN key
    And I can click then hold left arrow
    And I can click then hold right arrow
    And I can click then hold up arrow
    And I can click then hold down arrow
    And I can click RESET
    
    And I tab to controlbar
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




  