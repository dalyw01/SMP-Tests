Feature: Checking SMP Ads
  
  As a tester of SMP
  I want to check Ads work with SMP
  So that I verify SMP works during and after an Ad plays

  Scenario Outline: Check basic HTML functionality
    Given I visit "<page>" with a "<type>" player
    When I click CTA to begin playback
    And I can see AD controlbar
    And I can AD pause
    And I can see AD controlbar
    And I can AD play
    And I can wait for AD to finish
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can pause
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can play
    And I can mute
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can click each volume bar
    And I can unmute
    And I can click seekbar
    And I can enter fullscreen if "<type>"
    And I can see controlbar
    And I can click seekbar in fullscreen "<type>"
    And I can pause
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can play
    And I can seek in quarters to the end
    And I can see controlbar when finished if "<type>"
    And I can exit fullscreen if "<type>"
    And I click CTA to begin playback

  Examples:
    | page                 | type  |
    | https://is.gd/rukequ | video |
    | https://is.gd/ukewad | audio |
    | https://is.gd/nocutu | 360   |
