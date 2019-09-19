@GuidanceWarningFunction
Feature: Checking SMP Guidance functionality 

    As a tester of SMP
    I want to check the functionality of Guidance and Warnings works correctly as expected 
    Including checks in other languages i.e (Greek, Japanese)


    @GuidanceChecks
    Scenario Outline: Check basic functionality of SMP Guidance in player confirming the correct messaging appears 

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    When I see correct guidance or warning message "<cta>"
    And I click CTA to begin playback


    Examples:
    | page                 | type               | device  | cta      | 
    | https://is.gd/inarix | minimode           | desktop | english  |
    | https://is.gd/erimih | simulcast          | desktop | english  |
    | https://is.gd/ujahus | old audio player   | desktop | english  |
    | https://is.gd/joface | vod                | desktop | english  |
    | https://is.gd/otujul | vod + greek        | desktop | greek    |
    | https://is.gd/yipiso | vod + japanese     | desktop | japanese |
    | https://is.gd/ikozon | audio to video     | desktop | english  | 
    | https://is.gd/mehiru | video to audio     | desktop | english  | 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @Warning 
    Scenario Outline: Check basic functionality of Warning feature both on the holding image and inplayer

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    When I see correct guidance or warning message "<cta>"
    And I click CTA to begin playback
    When I seek to end of programme
    Then I pause
    When I see correct queued playlist guidance "<inplayer_warning>"

    Examples:
    | page                 | type                        | device  | cta        | inplayer_warning   |
    | https://is.gd/hexoxi | queued playlist             | desktop | warn_eng   | inplay_eng         |
    | https://is.gd/luxumo | queued playlist             | desktop | warn_grk   | inplay_grk         |
    | https://is.gd/jizeka | queued playlist             | desktop | warn_jap   | inplay_jap         |
    | https://is.gd/qohake | audio to video warning eng  | desktop | warn_eng   | inplay_eng         |
    | https://is.gd/omoyun | video to audio warning eng  | desktop | warn_eng   | inplay_eng         |
    
    
   



