@coreFuntionality
Feature: Checking SMP core functionality

  As a tester of SMP
  I want to check core functionality of SMP works
  So that I can verify every feature of the player is working in all expected situations

  @core
  Scenario Outline: Check basic functionality of SMP for various players

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
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
    | https://is.gd/egubug | vod                | phone   |
    | https://is.gd/egubug | vod                | desktop |
    | https://is.gd/sabiwu | ident + vod + subs | phone   |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
    | https://is.gd/ejocas | vertical           | phone   |
    | https://is.gd/ejocas | vertical           | desktop |
    | https://is.gd/wetese | simulcast          | phone   |
    | https://is.gd/wetese | simulcast          | desktop |
    | https://is.gd/desusa | webcast            | phone   |
    | https://is.gd/desusa | webcast            | desktop |
    | https://is.gd/ubofek | audio              | phone   |
    | https://is.gd/ubofek | audio              | desktop |

  @subs
  Scenario Outline: Check resizing of the Subtitles

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    Then I can change subtitles font size if "<type>"

  Examples:
    | page                 | type               | device  |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
