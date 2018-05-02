Feature: Checking SMP core functionality

  As a tester of SMP
  I want to check core functionality of SMP across various sized screens
  So that I can verify every feature of the player is working in all expected situations

  Scenario Outline: Check basic functionality of SMP for various players
    Given I visit "<page>" with a "<type>" player on "<device>"
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
    | page                 | type               | device  | 
    | https://is.gd/webilo | vod                | phone   |
    | https://is.gd/webilo | vod                | tablet  |
    | https://is.gd/webilo | vod                | desktop |
    | https://is.gd/wohoja | ident + vod + subs | phone   |
    | https://is.gd/wohoja | ident + vod + subs | tablet  |
    | https://is.gd/wohoja | ident + vod + subs | desktop |
    | https://is.gd/emiduz | vertical           | phone   |
    | https://is.gd/emiduz | vertical           | tablet  |
    | https://is.gd/emiduz | vertical           | desktop |
    | https://is.gd/wodovo | simulcast          | phone   |
    | https://is.gd/wodovo | simulcast          | tablet  |
    | https://is.gd/wodovo | simulcast          | desktop |
    | https://is.gd/sotuka | webcast            | phone   |
    | https://is.gd/sotuka | webcast            | tablet  |
    | https://is.gd/sotuka | webcast            | desktop |
    | https://is.gd/wequda | audio              | phone   |
    | https://is.gd/wequda | audio              | tablet  |
    | https://is.gd/wequda | audio              | desktop |
    | https://is.gd/ahekoj | minimode           | phone   |
    | https://is.gd/ahekoj | minimode           | tablet  |
    | https://is.gd/ahekoj | minimode           | desktop |


