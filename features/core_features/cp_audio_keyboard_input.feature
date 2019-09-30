  @cpkeyboard
  Feature: Checking SMP HTML accessibility on continuous play plugin 
  As a tester of SMP
  I want to check I can fully use SMP with just keyboard inputs
  So that the CP Plugin is accessible for people unable to use the mouse

  Scenario Outline: Check basic HTML accessibility of the CP plugin
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
    And I TAB
    And I TAB
    And I TAB
    And I press UP arrow to seek forwards
    And I press DOWN arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I press LEFT arrow to seek backwards
    And I press UP arrow to seek forwards
    And I press UP arrow to seek forwards
    And I press UP arrow to seek forwards
    When I seek till towards end of program
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    When I press cancel
    And I TAB
    And I TAB
    When I press
    When I press
    When I press
    And I TAB
    And I TAB
    And I TAB
    And I TAB
    And I TAB

  Examples:
    | page                 | type            | device  |    
    | https://is.gd/cepiju | video           | desktop |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

    @audiokeyboard

    Scenario Outline: Check basic HTML accessibility of the Audio player 

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
    And I TAB
    And I TAB
    When I enter audio setting
    And I TAB
    And I press UP arrow to seek forwards
    And I press DOWN arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I press LEFT arrow to seek backwards
   
  Examples:
    | page                 | type            | device  |    
    | https://is.gd/equkup | video           | desktop |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

    @simulkeyboard

    Scenario Outline: Check basic HTML accessibility of Simulcast

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
    And I TAB
    And I TAB
    When I enter audio setting
    And I TAB
    And I press UP arrow to seek forwards
    And I press DOWN arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I press LEFT arrow to seek backwards
   
  Examples:
    | page                 | type            | device  |    
    | https://is.gd/itukag | video           | desktop |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @radiominikeyboard

    Scenario Outline: Check basic HTML accessibility of Radio Minimode

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
    And I TAB
    And I TAB
    When I enter audio setting
    And I TAB
    And I press UP arrow to seek forwards
    And I press DOWN arrow to seek backwards
    And I press RIGHT arrow to seek forwards
    And I press LEFT arrow to seek backwards
   
  Examples:
    | page                 | type            | device  |    
    | https://is.gd/ahekoj | video           | desktop |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #