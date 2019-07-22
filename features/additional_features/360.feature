@360
Feature: Checking 360 player base functionality

  As a tester of SMP
  I want to check core functionality of 360 player
  So that I verify its working as expected

  Scenario Outline: Check basic 360  accessibility

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback of 360 player
    And I can press LEFT,RIGHT,UP,DOWN and ENTER keys on keyboard
    And I can click then hold LEFT,RIGHT,UP,DOWN and RESET on compass
    And I click away
    And I tab to controlbar
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can enter fullscreen if "<type>"
    And I can click seekbar unless "<type>"
    And I tab to compass
    And I can press LEFT,RIGHT,UP,DOWN and ENTER keys on keyboard
    And I can click then hold LEFT,RIGHT,UP,DOWN and RESET on compass
    And I tab to controlbar
    And I can pause
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can play
    And I can seek in quarters to the end
    And I can exit fullscreen if "<type>"
    And I click CTA to begin playback of 360 player

  Examples:
    | page                 | type | device  |
    | https://is.gd/zikivo | 360  | tablet  |
    | https://is.gd/zikivo | 360  | desktop |

@360MatchScreen
  Scenario Outline: Check Screen moves when pressed any button on compass
    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback of 360 player
    And I tab to controlbar
    And I can pause
    Then I enter "<mode>"
    Then I check screen moves using buttons of compass

  Examples:
    | page                 | type | device  | mode        |
    | https://is.gd/zikivo | 360  | tablet  | Inline      |
    | https://is.gd/zikivo | 360  | tablet  | Fullscreen  |
    | https://is.gd/zikivo | 360  | desktop | Inline      |
    | https://is.gd/zikivo | 360  | desktop | Fullscreen  |
