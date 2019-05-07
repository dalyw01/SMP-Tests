@bugs
Feature: Keeping a track of the Logged bugs for future reference

  As a tester of SMP
  I want the bugs in SMP player should be tracked and to be kept for future reference

  Background:
    Given I am on a page with the HTML player and CP plugin installed
    When the COOKBOOK has loaded
    And I click CTA to begin playback
    And I seek to end of programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @PlayingSameContentTwiceBug
  Scenario Outline: Check after current program is replayed twice, it stays in buffer state forever
    And I enter "<mode>"
    And I close the CP Panel without resizing
    And I click CTA to begin playback again
    And I seek till last second of program

    Examples:
    | mode       |
    | Inline     |
    | Fullscreen |
