@cp_no_autoplay
Feature: Checking CPP Plugin autoplay does not autoplay content that has been set to false and would require user interaction for the content to play

As a tester of SMP
I want to check the functionality of the autoplay feature part of the CPP plugin
that when content is set to false user interaction is required before the content can play 

Autoplay true and false requirements  
- Ensure HTTPS:// is in the URL 
- A local CPP Player page set up with content set to both true and false
- Have a combination of true/true, true/false, false/true, false/false 
- http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/cp_no_autoplay.html
- All tests will begin with a starting content video set to true which will be a random video vpid 


  Background:
  Given I am on a page with the HTML player and CP plugin installed and true and false settings applied
    


@TrueFalse
Scenario: Playing all content variations of true and false without fullscreen
all content variations of true and false 
When I click CTA to begin playback
When I seek to end of programme
When I seek to end of programme
Then I wait for countdown to finish
Then I can pause
Then I can play
When I seek to end of programme
Then I wait for countdown to finish
When I click CTA to begin playback
Then I can pause
Then I can play
Then I wait for countdown to finish
When I seek to end of programme
When I click CTA to begin playback
When I seek to end of programme
Then I wait for countdown to finish
When I seek to end of programme
Then I wait for countdown to finish
When I click CTA to begin playback
When I seek to end of programme
Then I wait for countdown to finish
When I click CTA to begin playback
When I seek to end of programme
Then I wait for countdown to finish
When I click CTA to begin playback
When I seek to end of programme
Then I wait for countdown to finish


@TrueFalseFullScreen
Scenario: Playing all content variations of true and false with fullscreen
When I click CTA to begin playback
When I seek to end of programme
When I enter full screen
When I seek to end of programme
Then I wait for countdown to finish
Then I can pause
Then I can play
When I seek to end of programme
Then I wait for countdown to finish
Then I can play
When I seek to end of programme
Then I wait for countdown to finish
When I seek to end of programme
When I click CTA to begin playback
When I seek to end of programme
Then I wait for countdown to finish
When I seek to end of programme
Then I wait for countdown to finish
When I click CTA to begin playback
When I seek to end of programme
Then I wait for countdown to finish
Then I can play
When I seek to end of programme
Then I wait for countdown to finish
Then I can play
When I seek to end of programme
Then I wait for countdown to finish