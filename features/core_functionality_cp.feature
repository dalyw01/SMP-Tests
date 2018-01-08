Feature: Checking SMP HTML player base functionality with CP (Continious Play) plugin
  As a tester of SMP
  I want to check base functionality of CP works as expected
  So that I can interact with each part

  Background:
    Given I am on a CP page with a HTML player
    When I click on CTA to begin playback
    When I seek to end of programme
    Then I can see cp controlbar fade instantly when cursor hovers away

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  
  @x
  Scenario: Check X icon works
  Then I can press X of CP

  @xFullscreen
  Scenario: Check X icon works in fullscreen
    When I can enter fullscreen of CP
    Then I can press X of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @cancelString
  Scenario: Check cancel icon works
    Then I can press cancel of CP

  @cancelStringFullscreen
  Scenario: Check cancel icon works in fullscreen
    When I can enter fullscreen of CP
    Then I can press cancel of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @cancelCircle
  Scenario: Check cancel circle works
    Then I can press cancel circle of CP

  @cancelCircleFullscreen
  Scenario: Check cancel circle works in fullscreen
    When I can enter fullscreen of CP
    Then I can press cancel circle of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @miniCTA
  Scenario: Check mini cta works
    Then I can press mini CTA of CP

  @miniCTAFullscreen
  Scenario: Check mini cta works in fullscreen
    When I can enter fullscreen of CP
    Then I can press mini CTA of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @miniThumbnail
  Scenario: Check mini clickable thumbnail works
    Then I can press thumbnail of CP

  @miniThumbnailFullscreen
  Scenario: Check mini clickable thumbnail works in fullscreen
    And I can enter fullscreen of CP
    And I can press thumbnail of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @xThenX
  Scenario: Press X then X of CP
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press X of CP

  @xThenMiniCancelString
  Scenario: Press X then Cancel of CP
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press cancel of CP

  @xThenMiniCancelCircle
  Scenario: Press X then Cancel Circle of CP
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press cancel circle of CP

  @xThenMiniCTA
  Scenario: Press X then Mini CTA of CP
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press mini CTA of CP

  @xThenMiniThumbnail
  Scenario: Press X then Thumbnail of CP
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press thumbnail of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @cp
  Scenario: Check core CP functionality
    When I seek to end of programme
    And I can press mini CTA of CP
    And I seek to end of programme
    And I can press thumbnail of CP
    And I seek to end of programme
    And I can press mini CTA of CP
    And I seek to end of programme
    And I can press thumbnail of CP
    And I seek to end of programme
    And I can press mini CTA of CP
    And I seek to end of programme
    And I can press thumbnail of CP
    And I seek to end of programme
    And I can press mini CTA of CP
    And I seek to end of programme
    And I can press thumbnail of CP
    And I seek to end of programme
    And I can press thumbnail of CP




