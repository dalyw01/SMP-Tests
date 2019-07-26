@chromecast_testing
Feature: Checking core functionality of Chromecast works correctly

  As a tester of SMP
  I want to check core functionality of Chromecast
  So i can ensure that it works as expected 

  ChromeCast requirements 

  - Use Google Chrome browser
  - Ensure HTTPS connection
  - ChromeCast and device need to be on the same network
  - Settings object needs - "allowcasting": true
  - Playlist object needs if queued playlist - "allowContinuousCast": true
  - A simple example - https://is.gd/olepat

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Background
    Given I have a ChromeCast and device connected to the same network with the HTML player
    And i have ChromeCast content with CP Plugin
    When the COOKBOOK is loaded 
    When I click the CTA to begin playback 
    And I can see the video playback
    Then Press Chromecast Icon
    And i can see Chromecast connecting

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CheckBasicPlayerControls
  Scenario Outline: A basic check that every "<action>" in SMP is Mirrored on Chromecast
  Given I do "<action>" in SMP it should be mirrored in Chromecast

  Examples:
  | action          |
  | Pause           |
  | Play            |
  | Mute            |
  | Subtitle        |
  | Seek            |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CheckBasicPlayerControlsNoEffect
  Scenario Outline: A basic check that every "<action>" in SMP is NOT Mirrored on Chromecast
  Given I do "<action>" in SMP it should NOT be mirrored in Chromecast

  Examples:
  | action          |
  | Fullscreen      |
  | Exit Fullscreen |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CastControlPositioning
  Scenario: Check chromecast controls on SMP are placed in the top left of the player
  This avoids overlap with the CP 
  Then the chromecast controls sremain in that position

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CastButtonUnderLinedIfOff
  Scenario: If cast is off, cast icon in control bar shouldn't be underlined 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CheckQueuedPlayListPausingWorks
  Scenario: When viewing a casted queued playlist if pausing on the second video the timer on CC continues increasing 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CorrectHoldingImagedIsPlaying 
  Scenario: On a queued playlist the correct holding image should show on each video 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CastingAndPiPContent
  Scenario: Chromecast and Picture-In-Picture should not both be available on control bar

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @StoppingCastInCastQueuedPlaylist
  Scenario: Stopping a cast on the second video in a queued playlist and seeing the timer on the video stop correctly 
  When I go to the next video in the queued playlist 
  And I cancel cast
  Then I see timer on the player going up even though the cast has been stopped 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @TransportBarIsLostAfterFullscreen
  Scenario: On mobile when you exit full screen mode you lose access to the transport bar, so no access to the seekbar fullscreen mode etc
  When I press fullscreen button on SMP on a mobile device 
  Then I press the full screen button again to return back to the normal video player size 
  Then I lose transport bar and it's lost and cannot be returned 

