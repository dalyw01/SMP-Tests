@cpFeature
Feature: Checking WATCH MORE for "Continious Play" plugin functionality works

  As a tester of SMP
  I want the CPP panel to load at the end of the current clip
  So that I am informed and prompted about other available BBC content

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Background:
    Given I am on a page with the HTML player and CP plugin installed
    When I press alwaysShowCarouselButton then page reloads
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    Then I move my cursor away

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @1
  Scenario Outline: Checking WATCH MORE works in a playing state
    Then I enter "<mode>"
    And I can click WATCH MORE
    And CPP shows WITHOUT cancel options

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @2
  Scenario Outline: Checking WATCH MORE works in a paused state
    Then I enter "<mode>"
    And I can pause
    And I can click WATCH MORE
    And CPP shows WITHOUT cancel options

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @3
  Scenario Outline: Checking WATCH MORE works in a playing state and can be dismissed
    Then I enter "<mode>"
    And I can click WATCH MORE
    And CPP shows WITHOUT cancel options
    And I press X of CP
    And I seek to end of programme
    And CPP shows

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @4
  Scenario Outline: Checking WATCH MORE works in a paused state and can be dismissed
    Then I enter "<mode>"
    And I can pause
    And I can click WATCH MORE
    And CPP shows WITHOUT cancel options

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @5
  Scenario Outline: Checking WATCH MORE not being used breaks carousel loading at the end
    Then I enter "<mode>"
    And I seek to end of programme
    And CPP shows

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |
