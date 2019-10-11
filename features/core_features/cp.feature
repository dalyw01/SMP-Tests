@cp
Feature: Checking "Continious Play" plugin core functionality works

  As a tester of SMP
  I want the CPP panel to load at the end of the current clip
  So that I am informed and prompted about other available BBC content

  The main properties of CPP are...

  - A black panel displays
  - Next item loads if user does nothing after 10 seconds
  - Next item loads if user selects one from carousel
  - CPP can be halted by selecting cancel options
  - CPP can be dimissed when loaded by selecting X icon
  - CPP has a catalogue of items which can be scrolled across
  - CPP still loads when final item has finished
  - CPP displays without timer if autoplay cookie is OFF

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Background:
    Given I am on a COOKBOOK page with the HTML player and CP plugin installed
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I seek to end of programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @InitiateNextItem
  Scenario Outline: Check pressing various icons of CPP initiate next clip
    Then I verify title has changed
    Then I enter "<mode>"
    And CPP shows
    And I press "<button>"
    And I can pause new programme if "<button>"
    Then I verify title has change on a different page

  
    | Mini Thumbnail | Inline     |
    | Mini Thumbnail | Fullscreen |
    | Mini CTA       | Inline     |
    | Mini CTA       | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @PreventNextItem
  Scenario Outline: Check pressing various icons of CPP dismiss's or halt CPP
    Then I enter "<mode>"
    And CPP shows
    And I press "<button>"
    And CPP stays if "<button>"

  Examples:
    | button | mode       |
    | X      | Inline     |
    | X      | Fullscreen |
    | Cancel | Inline     |
    | Cancel | Fullscreen |
    | Circle | Inline     |
    | Circle | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @DissmissCPThenUseOtherIcons
  Scenario Outline: Checking CPP appears again with full functionality after dismissing with X
    Then I enter "<mode>"
    And CPP shows
    And I press X of CP
    And I seek to end of programme
    And I can play
    And CPP shows
    And I press "<button>"
    And CPP stays if "<button>"
    And I can pause new programme if "<button>"

  Examples:
    | button         | mode       |
    | X              | Inline     |
    | X              | Fullscreen |
    | Cancel         | Inline     |
    | Cancel         | Fullscreen |
    | Circle         | Inline     |
    | Circle         | Fullscreen |
    | Mini Thumbnail | Inline     |
    | Mini Thumbnail | Fullscreen |
    | Mini CTA       | Inline     |
    | Mini CTA       | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CpAndControls
  Scenario Outline: Check CPP does not break core SMP functionality
    Then I enter "<mode>"
    And CPP shows
    And I press "<button>"
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows
    And I press "<button>"


  Examples:
    | button         | mode       |
    | Mini Thumbnail | Inline     |
    | Mini Thumbnail | Fullscreen |
    | Mini CTA       | Inline     |
    | Mini CTA       | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @arrowLastItem
  Scenario Outline: Check user can scroll across carousel and play last item, last item no longer has countdown
    Then I enter "<mode>"
    And CPP shows
    And I scroll through whole carousel and select the last item
    And I seek to end of programme
    And CPP shows WITHOUT cancel options

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @ToggleDefaultON
  Scenario Outline: Check toggle is ON by default and next item begins loading
    Then I enter "<mode>"
    And CPP shows
    And I wait for countdown to finish
    And I can pause

  Examples:
    | mode       |
    | Inline     |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @ToggleTurnedOFF
  Scenario Outline: Check next item does not play if user turns autoplay OFF
    And I toggle CPP OFF
    And I seek to end of programme
    And CPP shows WITHOUT cancel options

    Examples:
    | button         | mode       |
    | Mini Thumbnail | Inline     |
    | Mini CTA       | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @SettingsTurnsOffCountdown
  Scenario Outline: Check settings button closes the countdown
    And I enter "<mode>"
    And I seek to end of programme
    And I click settings button
    And CPP shows WITHOUT cancel options

    Examples:
    | mode           |
    | Fullscreen     |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @twoSectionsInCP
  Scenario Outline: Check the two sections i.e. "Up next" and "More" are present when CP appears
    And I enter "<mode>"
    Then I see one Up next and one More section

    Examples:
    | button         | mode       |
    | Mini Thumbnail | Inline     |
    | Mini CTA       | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @playingSameContent
  Scenario Outline: Check the CP disappears when Play CTA is clicked and the current program replays
    And I enter "<mode>"
    And CPP shows
    Then I can replay current programme
    Then CP disappears

    Examples:
    | mode       |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CPListClickToPlayBug
  Scenario Outline: Check if a single click can play a content from CP
    And I enter "<mode>"
    And I toggle CPP OFF
    Then I move right with the CP list
    Then I am able to play any content with a single click

    Examples:
    | mode       |
    | Fullscreen |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @PlayingSameContent
  Scenario Outline: Check the current program is replayed when CP loads and Play CTA is clicked
    Then I verify title has changed
    And I enter "<mode>"
    And CPP shows
    And I press "<button>"
    Then CP disappears
    Then I verify title has change on a different page

    Examples:
    | mode       |
    | Inline     |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CompareTitle
  Scenario: Verify the titles of two different pieces of content from the CP are different
  Then I compare two different titles
