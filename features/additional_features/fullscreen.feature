@fullScreen
Feature: Checking fullscreen functionality works when using icons or double-click

    As a tester of SMP
    I want to test fullscreen functionality of SMP is working
    So that I can enter/exit fullscreen using multiple methods - double-clicking and using icons

    @double_click
    Scenario Outline: Check double clicking player enters and double click exits fullscreen

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I can pause
    And I can play
    And I can double click anywhere in the player hitbox to enter fullscreen
    And I can pause
    And I can play
    And I can double click anywhere in the player hitbox to exit fullscreen
    And I can pause
    And I can play
    And I can seek in quarters to the end
    And I replay if "<type>"
    And I can pause
    And I can play
    And I can double click anywhere in the player hitbox to exit fullscreen
    And I can double click anywhere in the player hitbox to exit fullscreen

    Examples:
    | page                 | type               | device  |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
    | https://is.gd/wetese | simulcast          | desktop |


  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @double_click_and_icons
    Scenario Outline: Check double clicking player works in combination with pressing icons

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I can pause
    And I can play
    And I can double click anywhere in the player hitbox to enter fullscreen
    And I can exit fullscreen if "<type>"

    Examples:
    | page                 | type               | device  |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
    | https://is.gd/wetese | simulcast          | desktop |


  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @icon_and_double_click
    Scenario Outline: Check double pressing icons and then using double click works

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I can pause
    And I can play
    And I can enter fullscreen if "<type>"
    And I can double click anywhere in the player hitbox to exit fullscreen

    Examples:
    | page                 | type               | device  |
    | https://is.gd/sabiwu | ident + vod + subs | desktop |
    | https://is.gd/wetese | simulcast          | desktop |

