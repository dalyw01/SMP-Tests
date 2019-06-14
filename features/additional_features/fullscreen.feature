@fullScreen
Feature: Checking fullscreen functionality works when using icons or double-click

    As a tester of SMP
    I want to fullscreen functionality of SMP works
    So that I can enter and exit fullscreen using multiple methods

    @double_click
    Scenario Outline: Check double clicking player enters and double click exits fullscreen

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I can pause
    And I can play
    And I can double click to enter fullscreen
    And I can pause
    And I can play
    And I can double click to exit fullscreen
    And I can pause
    And I can play

    Examples:
    | page                 | type               | device  |
    | https://is.gd/sabiwu | ident + vod + subs | tablet  |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
    | https://is.gd/wetese | simulcast          | desktop |


    @double_click_and_icons_mix
    Scenario Outline: Check double clicking player works with pressing icons

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I can pause
    And I can play
    And I can double click to enter fullscreen
    And I can exit fullscreen if "<type>"
    And I can pause
    And I can play
    And I can enter fullscreen if "<type>"
    And I can double click to exit fullscreen
    And I can pause
    And I can play

    Examples:
    | page                 | type               | device  |
    | https://is.gd/sabiwu | ident + vod + subs | tablet  |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
    | https://is.gd/wetese | simulcast          | desktop |

