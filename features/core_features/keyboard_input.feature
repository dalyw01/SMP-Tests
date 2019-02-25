@keyboard
Feature: Checking SMP HTML accessibility
  As a tester of SMP
  I want to check I can fully use SMP with just keyboard inputs
  So that its accessible for people unable to use the mouse

  Scenario Outline: Check basic HTML accessibility
    Given I visit "<page>" with a "<type>" player on "<device>"
    When I TAB
    And I press ENTER on CTA to begin playback
    And I TAB
    And I pause
    And I resume
    And I TAB
    And I unmute
    And I mute
    And I TAB
    And I TAB
    And I press UP arrow to seek forwards
    And I press DOWN arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I press LEFT arrow to seek backwards
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I fullscreen
    And I pause
    And I resume
    And I TAB
    And I unmute
    And I mute
    And I TAB
    And I TAB
    And I press UP arrow to seek forwards
    And I press DOWN arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I press LEFT arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I TAB
    And I TAB
    And I TAB
    And I fullscreen
    And I press ENTER on CTA to begin playback

  Examples:
    | page                 | type  | device  |
    | https://is.gd/egubug | video | desktop |