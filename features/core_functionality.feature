Feature: Checking SMP HTML player core functionality

  As a tester of SMP
  I want to check core functionality of the HTML player is working
  So that I can access and use every available feature of the player

  Scenario Outline: Check basic HTML functionality for various SMP players
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
    And I can click seekbar unless "<type>"
    And I can enter fullscreen if "<type>"
    And I can see controlbar
    And I can click seekbar in fullscreen "<type>"
    And I can pause
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can exit fullscreen if "<type>"
    And I can see controlbar fade instantly when cursor hovers away if "<type>"
    And I can play
    And I can seek in quarters to the end
    And I click CTA to begin playback

  Examples:
    | page                 | type      |
    | https://is.gd/isoyeh | video     |
    | https://is.gd/emiduz | vertical  |
    | https://is.gd/wodovo | simulcast |
    | https://is.gd/akekag | webcast   |
    | https://is.gd/wequda | audio     |
    | https://is.gd/ahekoj | minimode  |