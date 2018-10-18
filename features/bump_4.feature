Feature: Checking SMP core functionality on BUMP 4

  As a tester of SMP
  I want to check core functionality of SMP across various sized screens
  So that I can verify every feature of the player is working in all expected situations

  Scenario Outline: Check basic functionality of SMP for various players
    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
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
    | page                 | type               | device  |
    | https://is.gd/golixa | vod                | phone   |
    | https://is.gd/golixa | vod                | tablet  |
    | https://is.gd/golixa | vod                | desktop |
    | https://is.gd/axohun | ident + vod + subs | phone   |
    | https://is.gd/axohun | ident + vod + subs | tablet  |
    | https://is.gd/axohun | ident + vod + subs | desktop |
    | https://is.gd/afarem | vertical           | phone   |
    | https://is.gd/afarem | vertical           | tablet  |
    | https://is.gd/afarem | vertical           | desktop |
    | https://is.gd/toxisi | simulcast          | phone   |
    | https://is.gd/toxisi | simulcast          | tablet  |
    | https://is.gd/toxisi | simulcast          | desktop |
    | https://is.gd/efijen | webcast            | phone   |
    | https://is.gd/efijen | webcast            | tablet  |
    | https://is.gd/efijen | webcast            | desktop |
    | https://is.gd/keneri | audio              | phone   |
    | https://is.gd/keneri | audio              | tablet  |
    | https://is.gd/keneri | audio              | desktop |
    | https://is.gd/asogad | minimode           | phone   |
    | https://is.gd/asogad | minimode           | tablet  |
    | https://is.gd/asogad | minimode           | desktop |
