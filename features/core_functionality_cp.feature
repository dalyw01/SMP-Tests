Feature: Checking SMP HTML player base functionality with CP
  As a tester of SMP
  I want to check base functionality of Continious Play (CP) works as expected
  So that I can interact with each part

  Background:
    Given I am on a CP page with a HTML player
    When I click on CTA to begin playback
    When I seek to end of programme
    Then I can see cp controlbar fade instantly when cursor hovers away

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 
  
  @x
  Scenario: Check core CP functionality
  Then I can press X of CP

  @xFullscreen
  Scenario: Check core CP functionality
    When I can enter fullscreen of CP
    Then I can press X of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @cancelString
  Scenario: Check core CP functionality
    Then I can press cancel of CP

  @cancelStringFullscreen
  Scenario: Check core CP functionality
    When I can enter fullscreen of CP
    Then I can press cancel of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @cancelCircle
  Scenario: Check core CP functionality
    Then I can press cancel circle of CP

  @cancelCircleFullscreen
  Scenario: Check core CP functionality
    When I can enter fullscreen of CP
    Then I can press cancel circle of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @miniCTA
  Scenario: Check core CP functionality
    Then I can press mini CTA of CP

  @miniCTAFullscreen
  Scenario: Check core CP functionality
    When I can enter fullscreen of CP
    Then I can press mini CTA of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @miniThumbnail
  Scenario: Check core CP functionality
    Then I can press thumbnail of CP

  @miniThumbnailFullscreen
  Scenario: Check core CP functionality
    And I can enter fullscreen of CP
    And I can press thumbnail of CP

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 



  @xThenX
  Scenario: Check core CP functionality
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press X of CP

  @xThenMiniCancelString
  Scenario: Check core CP functionality
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press cancel of CP

  @xThenMiniCancelCircle
  Scenario: Check core CP functionality
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press cancel circle of CP

  @xThenMiniCTA
  Scenario: Check core CP functionality
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press mini CTA of CP

  @xThenMiniThumbnail
  Scenario: Check core CP functionality
    When I seek to end of programme
    And I can press X of CP
    And I seek to end of programme
    And I can play
    And I can press thumbnail of CP



