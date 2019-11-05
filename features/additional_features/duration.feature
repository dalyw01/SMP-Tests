@duration
Feature: Checking duration displayed on CTA of player

    As a tester of SMP
    I want to check duration displays correctly on SMP's CTA
    So that I can verify duration works in all situations

    @durationCheckCTA
    Scenario Outline: Check duration displays correctly on SMP's CTA

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I see correct "<duration>" displaying on CTA

    Examples:
    | page                 | type | device  | duration |
    | https://is.gd/soquko | vod  | desktop | 00:01    |
    | https://is.gd/efoted | vod  | desktop | 00:05    | 
    | https://is.gd/ibimeb | vod  | desktop | 01:00    |
    | https://is.gd/ewequl | vod  | desktop | 01:30    |
    | https://is.gd/wefaro | vod  | desktop | 1:00:00  |
    | https://is.gd/lunula | vod  | desktop | 3:28:21  |
