@ads
Feature: Checking SMP Ads work for various types of ads

    As a tester of SMP
    I want to check Ads work with SMP
    So that I verify SMP works during and after an Ad plays
    The different types of Ads are

    - Post roll ads
    - Skippable ads

    @pre_roll_ads
    Scenario Outline: Check pre roll ads work and SMP works after ad has finished

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click ADS CTA to begin playback
    And I can see AD controlbar
    And I can AD pause
    And I can see AD controlbar
    And I can AD play
    And I can wait for AD to finish
    And I see controlbar hides instantly if "<type>"
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
    | page                 | type  | device  |
    | https://is.gd/bezeye | video | desktop |
    | https://is.gd/ukewad | audio | desktop |

    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @skippable_ads
    Scenario Outline: Check skippable ads show and SMP works after ad has finished

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I load skippable ads by clicking html button
    And the COOKBOOK has loaded
    And I click ADS CTA to begin playback
    And I can see AD controlbar
    And I can AD pause
    And I can see AD controlbar
    And I can AD play
    And I can click Skip Add option
    And I see controlbar hides instantly if "<type>"
    And I can pause
    And I can play

    Examples:
    | page                 | type  | device  |
    | https://is.gd/bezeye | video | desktop |
    | https://is.gd/ukewad | audio | desktop |







