@360
Feature: Checking 360 player base functionality

  As a tester of SMP
  I want to test core functionality of 360 player
  So that can I verify it's working as expected for different inputs - Mouse click, Keyboard And Touch

  NOTE - @360Click doesn't visually reflect what's happening
         However it covers a bug that happened on LIVE 
         A bug where users could not click the compass as it was not accessible but could use keyboard

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Background:
    Given I visit page with a 360 player
    When the COOKBOOK has loaded
    And I click CTA to begin playback of 360 player

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @360Click
  Scenario Outline: Check basic 360 functionality using CLICK input

    Then I can CLICK LEFT, RIGHT, UP, DOWN and RESET on compass
    And I click away
    And I tab to controlbar
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can click seekbar unless "<type>"
    And I can enter fullscreen if "<type>"
    And I tab to compass
    And I can CLICK LEFT, RIGHT, UP, DOWN and RESET on compass
    And I tab to controlbar
    And I can pause
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can play
    And I can seek in quarters to the end
    And I can exit fullscreen if "<type>"
    And I click CTA to begin playback of 360 player

  Examples:
    | type |
    | 360  |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @360Touch
  Scenario Outline: Check basic 360 functionality using TOUCH input

    Theen I can TOUCH then hold LEFT, RIGHT, UP, DOWN and RESET on compass
    And I click away
    And I tab to controlbar
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can click seekbar unless "<type>"
    And I can enter fullscreen if "<type>"
    And I tab to compass
    And I can TOUCH then hold LEFT, RIGHT, UP, DOWN and RESET on compass
    And I tab to controlbar
    And I can pause
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can play
    And I can seek in quarters to the end
    And I can exit fullscreen if "<type>"
    And I click CTA to begin playback of 360 player

  Examples:
    | type |
    | 360  |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @360Keyboard
  Scenario Outline: Check basic 360 functionality

    Then I can press LEFT, RIGHT, UP, DOWN and ENTER keys on keyboard to use compass
    And I click away
    And I tab to controlbar
    And I can pause
    And I can play
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can click seekbar unless "<type>"
    And I can enter fullscreen if "<type>"
    And I tab to compass
    And I can press LEFT, RIGHT, UP, DOWN and ENTER keys on keyboard to use compass
    And I tab to controlbar
    And I can pause
    And I can mute
    And I can click each volume bar
    And I can unmute
    And I can play
    And I can seek in quarters to the end
    And I can exit fullscreen if "<type>"
    And I click CTA to begin playback of 360 player

  Examples:
    | type |
    | 360  |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  