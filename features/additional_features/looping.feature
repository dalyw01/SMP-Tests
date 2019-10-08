@looping
Feature: Checking looping of content on SMP works correctly

    As a tester of SMP
    I want to check SMP loops video content continually
    So that a CTA is never visible once playback starts

    @loopingPlayer
    Scenario Outline: Check basic looping works
    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I seek to end of programme
    And I can mute
    And I can pause
    And I can play
    And I can unmute
    And I seek to end of programme
    And I can mute
    And I can pause
    And I can play
    And I can unmute
    And I seek to end of programme
    And I can mute
    And I can pause
    And I can play
    And I can unmute

    Examples:
    | page                 | type | device  |
    | https://is.gd/cutele | vod  | desktop |
