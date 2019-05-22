@quality_settings
Feature: Checking quality settings are saved when changed 

     As a tester of SMP
     I want to check the functionality of the quality settings feature  

     quality_settings requirements  
       Have the quality setting set to true 
       

     Background:
       Given I am on a page with the HTML player and quality settings set to true
    
     @LowQuality
     Scenario: Play content, change quality to low, refresh page and check qulaity is still set to low 
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click low option button
       