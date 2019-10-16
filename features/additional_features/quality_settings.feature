    @quality_settings
    Feature: Checking quality settings are saved when changed. Prior to any actions the BBC cookies need to be accepted first to ensure the changes are saved

     As a tester of SMP
     I want to check the functionality of the quality settings feature and that every selection Low,Medium,High can be selected and the option saved  
       
     Background:
       Given I am on a page with the HTML player and quality settings set to true
       When I check if cookies appears

      # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

     @LowQuality
       Scenario: Play content, change quality to low, refresh page and check quality is still set to low
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I click low option button
       Then I refresh page
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I verify low option has been selected
      
       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

     @MediumQuality
       Scenario: Play content, change quality to medium, refresh page and check quality is still set to low 
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

     @HighQuality
       Scenario: Play content, change quality to low medium then high 
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I click low option button
       Then I click medium option button
       Then I click high option button
       Then I refresh page
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I verify high option has been selected

       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @MediumLow
       Scenario: Play content, change quality to medium then low
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I click medium option button
       Then I click low option button
       Then I refresh page
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I verify low option has been selected

       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

    @MediumHigh
       Scenario: Play content, change quality to medium then high
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I click medium option button
       Then I click high option button
       Then I refresh page
       When I click CTA to begin playback
       Then I click quality settings button
       Then I click video quality settings button
       Then I verify high option has been selected