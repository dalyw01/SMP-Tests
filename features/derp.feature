Feature: Checking "Continious Play" plugin core functionality works
  
  As a tester of SMP
  I want the CPP panel to load at the end of the current clip
  So that the main interactions are working as expected...

  - CPP displays
  - CPP loads next item if user does nothing
  - CPP loads an item if user selects it
  - CPP can be halted when loaded
  - CPP can be dimissed when loaded
  - CPP has a catalogue of items which can be scrolled across
  - CPP still loads when final item has been played
  - CPP displays without timer if autoplay cookie is OFF

  Background:
    Given I am on a page with the HTML player and CP plugin installed
    When I click CTA to begin playback
    And I seek to end of programme
    Then I move my cursor away

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @preventPlayback
  Scenario Outline: Check pressing icons dismiss or halt CPP
    Then I enter "<mode>" with CP
    And CPP shows
    And I press "<button>"

  Examples:
    | button | mode       |
    | X      | Inline     |
    | X      | Fullscreen |
    | Cancel | Inline     |
    | Cancel | Fullscreen |
    | Circle | Inline     |
    | Circle | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @initiatePlayback
  Scenario Outline: Check pressing icons initiates next clip
    Then I enter "<mode>" with CP
    And CPP shows
    And I press "<button>"
    And I can pause the new programme

  Examples:
    | button         | mode       |
    | Mini Thumbnail | Inline     |
    | Mini Thumbnail | Fullscreen |
    | Mini CTA       | Inline     |
    | Mini CTA       | Fullscreen |