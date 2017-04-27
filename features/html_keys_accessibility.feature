Feature: Checking SMP HTML accessibility
  As a tester of SMP
  I want to check acessibility with keyboard
  So that I can use every part of SMP via keyboard

  Scenario: Check basic HTML functionality
    Given I am on a page with a HTML player
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
