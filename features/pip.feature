@pip
Feature: Checking the PIP functionality works fine

As a tester of SMP
I want to check core functionality of PIP i.e. "Picture In Picture" Window
So that I verify its working as expected
Its just for Chrome currently.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Background:
  Given I am on a page with the HTML player and CP plugin installed
  When the COOKBOOK has loaded
  And I click CTA to begin playback

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Scenario: Check basic PIP accessibility
  When I click PIP icon
  Then I see the PIP window comes up

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Scenario Outline: No PIP should be present in an Audio player
  Given I visit "<page>" with a "<type>" player on "<device>"
  When the COOKBOOK has loaded
  Then I click Audio player CTA to begin playback
  Then I dont find the PIP option in the player

Examples:
  | page                 | type  | device  |
  | https://is.gd/hayuwa | audio | desktop |
