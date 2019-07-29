Feature: Google Search Functionality

Background:
  Given I am on a page with warning installed

@Warning
Scenario: Can find search results
  Then I can see warning
  And I click CTA to begin playback
  When I seek to end of programme
  Then I can see in player warning

  
  