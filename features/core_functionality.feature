Feature: Checking SMP core functionality

  As a tester of SMP
  I want to check core functionality of SMP
  So that I can use every feature of the player is working

  Scenario Outline: Check basic functionality of SMP for various players
    Given I visit "<page>" with a "<type>" player
    When I click CTA to begin playback
    Then I see controlbar hides instantly if "<type>"
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I see controlbar hides instantly if "<type>"
    And I can click seekbar unless "<type>"
    And I can interact with subtitles panel if present
    And I can enter fullscreen if "<type>"
    And I can see controlbar
    And I can click seekbar in fullscreen "<type>"
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I see controlbar hides instantly if "<type>"
    And I can interact with subtitles panel if present
    And I can exit fullscreen if "<type>"
    And I see controlbar hides instantly if "<type>"
    And I can seek in quarters to the end
    And I click CTA to begin playback

  Examples:
    | page                 | type                 |
    | https://is.gd/webilo | news                 |
    | https://is.gd/wohoja | ident + video + subs |
    | https://is.gd/emiduz | vertical             |
    | https://is.gd/wodovo | simulcast            |
    | https://is.gd/sotuka | webcast              |
    | https://is.gd/wequda | audio                |
    | https://is.gd/ahekoj | minimode             |