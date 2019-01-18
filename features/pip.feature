@pip
Feature: Checking the PIP functionality works fine

As a tester of SMP
I want to check core functionality of PIP Window
So that I verify its working as expected
Its for chrome's PIP feature for now.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Background:
  Given I am on a page with the HTML player and CP plugin installed
  When the COOKBOOK has loaded
  And I click CTA to begin playback

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Scenario: Check basic PIP accessibility
  And I go for the PIP options
  And I find the pause button in the PIP window
