    @player_warning 
    Feature: Checking that the in player guidance appears correctly 

     As a tester of SMP
     I want to check the functionality of the in player guidance 
       
     Background:
       Given I am on a page with the HTML player guidance set to true
       

     @InPlayerGuidance
       Scenario: Lauch player checking the in player guidance displays correctly
       When I hover and click 
       When I tick checkbox
       And I press Continue
       When I click CTA to begin playback
      
       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  