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
    And I wait
    And I seek to end of programme
    And I wait
    And I seek to end of programme
    And I wait
    And I seek to end of programme

    Examples:
    | page                 | type | device  |
    | https://is.gd/jabece | vod  | desktop |
