Feature: Checking SMP HTML player base functionality
  As a tester of SMP
  I want to check base functionality of SMP HTML player
  So that I verify its working as expected

  Scenario Outline: Check basic HTML functionality
    Given I visit "<page>" with a "<type>" player
    When I click CTA to begin playback
    Then I can see controlbar fade instantly when cursor hovers away if "<type>"
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
    And I can unmute
    And I can click each volume bar
    And I can mute
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can exit fullscreen if "<type>"
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can play
    And I can seek in quarters to the end
    And I click CTA to begin playback

  Examples:
    | page                 | type      |
    | https://is.gd/webilo | video     |
    | https://is.gd/emiduz | vertical  |
    | https://is.gd/wequda | audio     |
    | https://is.gd/ahekoj | minimode  |
    | https://is.gd/dizehe | webcast   |