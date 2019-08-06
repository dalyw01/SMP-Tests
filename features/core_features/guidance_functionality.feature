@GuidanceWarningFunction
Feature: Checking SMP Guidance functionality 

    As a tester of SMP
    I want to check core functionality of guidance SMP works
    So that I can verify every feature of the player is working in all expected situations

    @GuidanceChecks
    Scenario Outline: Check basic functionality of SMP for various players

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    When I see correct guidance message in "<language>"
    And I click CTA to begin playback


    Examples:
    | page                 | type               | device  | language |
    | https://is.gd/inarix | minimode           | desktop | english  |
    | https://is.gd/erimih | simulcast          | desktop | english  |
    | https://is.gd/ujahus | old audio player   | desktop | english  |
    | https://is.gd/yujase | vod                | desktop | english  |
    | https://is.gd/otujul | vod + greek        | desktop | greek    |
    | https://is.gd/yipiso | vod + japanese     | desktop | japanese |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @Warning 
    Scenario Outline: Check basic functionality of Warning feature both on holding image and inplayer

    Given I visit "<page>" with a "<type>" player on "<device>"
    Then I can see warning
    Then I verify holding img guidance text
    And I click CTA to begin playback
    When I seek to end of programme
    Then I pause
    Then I verify guidance text

    Examples:
    | page                 | type               | device  | 
    | https://is.gd/hexoxi | queued playlist    | desktop | 
    
   



