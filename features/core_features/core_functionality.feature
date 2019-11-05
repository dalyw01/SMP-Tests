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
    And I can click seekbar unless "<type>"
    And I can interact with subtitles panel if "<type>"
    And I can change subtitles font size if "<type>"
    And I can enter fullscreen if "<type>"
    And I can click seekbar in fullscreen "<type>"
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
    | https://is.gd/golixa | vod                | phone   |
    | https://is.gd/golixa | vod                | desktop |
    | https://is.gd/asayap | ident + vod + subs | phone   |
    | https://is.gd/asayap | ident + vod + subs | desktop |
    | https://is.gd/muxene | vertical           | phone   |
    | https://is.gd/muxene | vertical           | desktop |
    | https://is.gd/toxisi | simulcast          | phone   |
    | https://is.gd/toxisi | simulcast          | desktop |
    | https://is.gd/ulibar | webcast            | phone   |
    | https://is.gd/ulibar | webcast            | desktop |
    | https://is.gd/ifedil | audio              | phone   |
    | https://is.gd/ifedil | audio              | desktop |