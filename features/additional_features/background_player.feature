@background
Feature: Checking background player base functionality

  As a tester of SMP
  I want to check core functionality of background player
  So that I verify its working as expected

  @bump_api_pause
  Scenario Outline: Check background player automatically plays

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    And I can pause using BUMP API

  Examples:
    | page                 | type        | device   |
    | https://is.gd/fibodu | background  | tablet   |
    | https://is.gd/fibodu | background  | desktop  |