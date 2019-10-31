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
    When I click CTA to begin playback


    Examples:
    | page                 | type               | device  | cta      | 
    | https://is.gd/ixewel | minimode           | desktop | english  |
    | https://is.gd/toxisi | simulcast          | desktop | english  |
    | https://is.gd/nubeve | old audio player   | desktop | english  |
    | https://is.gd/lohawa | vod                | desktop | english  |
    | https://is.gd/akitad | vod + greek        | desktop | greek    |
    | https://is.gd/rukidi | vod + japanese     | desktop | japanese |
    | https://is.gd/qinuvu | audio to video     | desktop | english  | 
    | https://is.gd/nozoni | video to audio     | desktop | english  | 

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
    | https://is.gd/eforax | queued playlist             | desktop | warn_eng   | inplay_eng         |
    | https://is.gd/uciteg | queued playlist             | desktop | warn_grk   | inplay_grk         |
    | https://is.gd/ageguk | queued playlist             | desktop | warn_jap   | inplay_jap         |
    | https://is.gd/xelazi | audio to video warning eng  | desktop | warn_eng   | inplay_eng         |
    | https://is.gd/elokaf | video to audio warning eng  | desktop | warn_eng   | inplay_eng         |
    
    
   



