@cpp_autoplay_true_false_blocked
Feature: Checking CPP Plugin autoplay does not autoplay content that has been set to false and would require user interaction for the content to play

As a tester of SMP
I want to check the functionality of the autoplay feature part of the CPP plugin
that when content is set to false user interaction is required before the content can play 

Autoplay true and false requirements  
- Ensure HTTPS:// is in the URL 
- A local CPP Player page set up with content set to both true and false
- Have a combination of true/true, true/false, false/true, false/false 
- https://is.gd/yozago (Short link to local page)
- All tests will begin with a starting content video set to true which will be a random video vpid 

Background
Given I have access to a local page set up with CPP plugin with multiple pieces of content video/audio
When the content is set to false it requires user interaction before you play 
When the content is true the content will auto play as per expected behavior

@TrueAndTrue
Scenario: A check that 2 pieces of content both set to true play without user interaction  
When the starting content video is playing seek to the end 
And the CPP Plugin appears on screen wait for the countdown  
Then the next video should play automatically
When i seek to the end CPP plugin will appear
Then let countdown run down and second content should automatically play without user interaction 


@TrueAndFalse
Scenario: Check that when playing a video set to false it doesn't play without user interaction 
When i seek to the end of the starting content video 
And the CP Carousel appears on screen wait for the countdown 
Then the second NOT false video should auto play and require the user to press play
When i press play the second false content should play 

@FalseAndTrue
Scenario: Playing content from a false setting to a true one requiring the user to press play on the first but auto play the second 
When i seek to the end of the starting content video 
And the CP Carousel appears on screen wait for the countdown 
When the first video loads it should NOT auto play and require user interaction 
When i seek to the end of the first video
And the CP Carousel appears on screen wait for the countdown 
Then the second video should begin to play automatically 
 

@FalseAndFalse
Scenario: Playing two pieces of false content that will force user interaction to play two pieces of content
When i seek to the end of the starting content video 
And the CP Carousel appears on screen wait for the countdown 
Then the first video should NOT auto play aAnd the CP Carousel appears on screen wait for the countdown 
When i seek to the end of the first video
Then And the CP Carousel appears on screen wait for the countdown
Then the second content should should NOT auto play and need user interaction
When i press play the second content video should play 









