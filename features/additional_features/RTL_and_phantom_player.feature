@rtl
Feature: Checking SMP core functionality for RTL and Phantom Player

  As a tester of SMP
  I want pressing the fake Phantom CTA to prompt a validation pop-up
  I want a regular player to load once I've successfully been validated
  So I can verify a normal SMP loads and every feature of the player is working in all expected situations

  @phantomPlayer
  Scenario Outline: Check basic functionality of SMP for various players

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click phantom CTA to begin playback
    And I click phantom LOGIN button from pop up
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can click seekbar unless "<type>"
    And I can interact with subtitles panel if "<type>"
    And I can enter fullscreen if "<type>"
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can interact with subtitles panel if "<type>"
    And I can exit fullscreen if "<type>"
    And I can seek in quarters to the end
    And I replay if "<type>"

  Examples:
    | page                 | type               | device  |
    | https://is.gd/unaham | ident + vod + subs | phone   |
    | https://is.gd/unaham | ident + vod + subs | desktop |