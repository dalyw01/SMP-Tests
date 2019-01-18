Feature: Checking SMP core functionality on BUMP 4

  As a tester of SMP
  I want to check core functionality of SMP works
  So that I can verify every feature of the player is working in all expected situations

  @bump4
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
    And I can interact with subtitles panel if "<type>"
    And I can enter fullscreen if "<type>"
    And I can click seekbar in fullscreen "<type>"
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I see controlbar hides instantly if "<type>"
    And I can interact with subtitles panel if "<type>"
    And I can exit fullscreen if "<type>"
    And I see controlbar hides instantly if "<type>"
    And I can seek in quarters to the end
    And I click CTA to begin playback

  Examples:
    | page                 | type               | device  |
    | https://is.gd/axohun | ident + vod + subs | phone   |
    | https://is.gd/axohun | ident + vod + subs | tablet  |
    | https://is.gd/axohun | ident + vod + subs | desktop |