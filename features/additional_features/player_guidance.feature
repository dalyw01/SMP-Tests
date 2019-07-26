    @player_guidance
    Feature: Checking that the in player guidance appears correctly 

     As a tester of SMP
     I want to check the functionality of the in player guidance 
       
     Background:
       Given I am on a page with the HTML player guidance set to true
       

     @InPlayerGuidance
       Scenario: Lauch player checking the in player guidance displays correctly
       When I hover and click 
       When I click CTA to begin playback
      
       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

     @MediumQuality
       Scenario: Play content, change quality to medium, refresh page and check quality is still set to low 
       When I check if cookies appears
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I click medium option button
       Then I refresh page
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I verify medium option has been selected

       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #