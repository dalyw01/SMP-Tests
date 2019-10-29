@Ads
Feature: Checking SMP ADs work for various types of ADs

    As a tester of SMP
    I want to check ADs work with SMP
    So that I verify SMP works during and after an AD plays
    The different types of ADS are

    - Post roll ADS
    - Skippable ADS

    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @pre_roll_ads
    Scenario Outline: Check pre roll ADS work and SMP works after AD has finished.
    If replaying content, AD should not show.

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click ADS CTA to begin playback
    And I can AD pause
    And I can AD play
    And I can wait for AD to finish
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can seek in quarters to the end
    And I replay if "<type>"
    And I can pause

    Examples:
    | page                 | type  | device  |
    | https://is.gd/afitip | video | desktop |
    | https://is.gd/visoti | audio | desktop |

    # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @skippable_ad
    Scenario Outline: Check skippable AD show, can be clicked and SMP works after AD has finished.
    If replaying content, AD should not show.

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I load skippable ADS by clicking html button
    And I click ADS CTA to begin playback
    And I can AD pause
    And I enter AD fullscreen if "<mode>"
    And I can AD play
    And I can click skip AD option
    And I can pause
    And I can play
    And I can seek in quarters to the end

    Examples:
    | page                 | type   | device  | mode   |
    | https://is.gd/afitip | video  | desktop | Inline |
    | https://is.gd/visoti | audio  | desktop | Inline |
