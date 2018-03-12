Feature: Checking 360 player base functionality

  As a tester of SMP
  I want to check core functionality of 360 player
  So that I verify its working as expected

  Scenario Outline: Check basic 360  accessibility
    Given I visit "<page>" with a "<type>" player
    When I click CTA to begin playback
    Then I click away
    And I tab to compass
    And I can press LEFT key
    And I can press RIGHT key
    And I can press UP key
    And I can press DOWN key
    And I can press ENTER key
    And I can click then hold LEFT arrow
    And I can click then hold RIGHT arrow
    And I can click then hold UP arrow
    And I can click then hold DOWN arrow
    And I can click RESET button
    And I click away
    And I tab to controlbar
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can click seekbar
    And I can enter fullscreen
    And I can click seekbar in fullscreen "<type>"
    And I tab to compass
    And I can press LEFT key
    And I can press RIGHT key
    And I can press UP key
    And I can press DOWN key
    And I can click then hold LEFT arrow
    And I can click then hold RIGHT arrow
    And I can click then hold UP arrow
    And I can click then hold DOWN arrow
    And I can click RESET button
    And I tab to controlbar
    And I can pause
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can play
    And I can seek in quarters to the end
    And I can see controlbar when finished if "<type>"
    And I can exit fullscreen if "<type>"
    And I click CTA to begin playback

  Examples:
    | page                 | type |
    | https://is.gd/ukiyiv | 360  |


    