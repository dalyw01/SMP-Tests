    @audio_settings
    Feature: Checking functionality of the audio settings feature 

     As a tester of SMP
     I want to check the functionality of the audio settings feature accross auto play on and off   
       
     Background:
       Given I am on a audio page with the audio settings accessible on the page  

     @AudioSettings
       Scenario: Play audio content with autoplay on and cycle through multiple audio content 
       Then I can Audio play
       Then I hover on audio settings button
       Then I click audio settings button   
       Then I select autoplay on
       When I seek till last second of program
       Then I can Audio play
       Then I hover on audio settings button
       Then I click audio settings button

       # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

      @AudioSettingsFalse
       Scenario: Play audio content with autoplay off and cycle through multiple audio content 
       Then I can Audio play
       Then I hover on audio settings button
       Then I click audio settings button   
       Then I select autoplay off
       When I seek till last second of program
       Then I can Audio play
       Then I can Audio pause
       Then I hover on audio settings button
       Then I click audio settings button