@test
Feature: Checking the working of Appium

Background:
  Given I am on a page with the HTML player and CP plugin installed
  When the COOKBOOK has loaded
  And I click CTA to begin playback

@Check
Scenario: Check Appium working
Then I get a message
