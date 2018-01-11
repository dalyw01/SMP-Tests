Feature: Checking SMP HTML player base functionality with CP (Continious Play) plugin
  As a tester of SMP
  I want to interact with each component of CP
  So that I load and view content continuously

  Background:
    Given I am page with the HTML player and CP plugin
    When I click on CTA to begin playback
    And I seek to end of programme
    Then CP controlbar fades when I hover away

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @X
  Scenario: Check X icon works
    Then I press X of CP
    And I can replay

  @XFullscreen
  Scenario: Check X icon works in fullscreen
    Then I enter fullscreen of CP
    And I press X of CP
    And I can replay

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @CancelString
  Scenario: Check cancel string works
    Then I press cancel of CP
    And I can replay

  @CancelStringFullscreen
  Scenario: Check cancel string works in fullscreen
    Then I enter fullscreen of CP
    And I press cancel of CP
    And I can replay

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @CancelCircle
  Scenario: Check cancel circle works
    Then I press cancel circle of CP
    And I can replay

  @CancelCircleFullscreen
  Scenario: Check cancel circle works in fullscreen
    Then I enter fullscreen of CP
    And I press cancel circle of CP
    And I can replay

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @MiniCTA
  Scenario: Check mini cta works
    Then I press mini CTA of CP
    And I can pause

  @MiniCTAFullscreen
  Scenario: Check mini cta works in fullscreen
    Then I enter fullscreen of CP
    Then I press mini CTA of CP
    And I can pause

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @MiniThumbnail
  Scenario: Check mini clickable mini thumbnail works
    Then I press mini thumbnail of CP
    And I can pause

  @MiniThumbnailFullscreen
  Scenario: Check mini clickable mini thumbnail works in fullscreen
    Then I enter fullscreen of CP
    And I press mini thumbnail of CP
    And I can pause

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @XThenX
  Scenario: Checking CP appears again and pressing X works
    Then I seek to end of programme
    And I press X of CP
    And I seek to end of programme
    And I can play
    And I press X of CP
    And I can replay

  @XThenCancelString
  Scenario: Checking CP appears again and pressing Cancel works
    Then I seek to end of programme
    And I press X of CP
    And I can play
    And I seek to end of programme
    And I press cancel of CP
    And I can replay

  @XThenCancelCircle
  Scenario: Checking CP appears again and pressing Cancel Circle works
    Then I seek to end of programme
    And I press X of CP
    And I can play
    And I seek to end of programme
    And I press cancel circle of CP
    And I can replay

  @XThenMiniCTA
  Scenario: Checking CP appears again and pressing Mini CTA works
    Then I seek to end of programme
    And I press X of CP
    And I can play
    And I seek to end of programme
    And I press mini CTA of CP
    And I can pause

  @XThenMiniThumbnail
  Scenario: Checking CP appears again and pressing mini thumbnail works
    Then I seek to end of programme
    And I press X of CP
    And I can play
    And I seek to end of programme
    And I press mini thumbnail of CP
    And I can pause

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @CpAndControls
  Scenario: Check CP does not break core SMP functionality
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And I press mini thumbnail of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And I press mini thumbnail of CP
    And I use core functionality of SMP

  @CpAndControlsFullscreen
  Scenario: Check CP does not break core SMP functionality in Fullscreen
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And I press mini thumbnail of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And I press mini thumbnail of CP
    And I use core functionality of SMP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @ToggleON
  Scenario: Check CP shows if toggle ON
    Then CP shows

  @ToggleONFullscreen
  Scenario: Check CP shows if toggle ON in fullscreen
    And I enter fullscreen of CP
    And CP shows

  @ToggleOFF
  Scenario: Check CP does not show if toggle OFF
    Then I toggle CP OFF
    And I press mini CTA of CP
    And I seek to end of programme
    And CP does NOT show

  @ToggleOFFFullscreen
  Scenario: Check CP does not show if toggle OFF in fullscreen
    Then I toggle CP OFF
    And I press mini CTA of CP
    And I enter fullscreen of CP
    And I seek to end of programme
    And CP does NOT show



