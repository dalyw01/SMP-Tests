@chromecast_testing
Feature: Checking core functionality of Google Chromecast works correctly when contolled by SMP

  As a tester of SMP
  I want to check core functionality of Chromecast with SMP
  So I can ensure that it works as expected 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Terms you may need to know
  - SMP:                     Standard Media Player. The player used by clients (e.g. iplayer, sounds, news). It unifies video playback across the BBC.
  - allowcasting:            This allows cast/playback on Chromecast.
  - allowContinlousCast:     This allows multiple casts to be played one after the other on Chromecast.
  - CTA:                     Call to Action. This initialises playback. 
  - VOD:                     Video on Demand
  - AOD:                     Audio on Demand
  - <action>:                Placeholder for any of the various actions that the SMP may perform.

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  ChromeCast Testing Requirements 

  - Use Google Chrome browser on a mobile or desktop device
  - Chromecast needs to be connected to a monitor
  - ChromeCast and device need to be on same network
  - Settings object needs - "allowcasting": true.  
  - Playlist object needs if queued playlist - "allowContinuousCast": true 
  - Ensure HTTPS connection

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  Chromecast Supports 

  - VOD - https://is.gd/nobeka
  - AOD - https://is.gd/teyoya
  - Queued VOD - https://is.gd/atugem
  - Continuous Play Plugin - https://is.gd/riguwu

Chromecasts Does Not Support

  - Webcast
  - Simulcast
  - Picture-In-Picture
  - Fullscreen
  - Subtitle sizing

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CheckBasicPlayerControls
    Scenario Outline: A basic check that every "<action>" in SMP is mirrored on Chromecast
    Given I press CTA
    And video is playing successfully
    Then "<action>" in SMP should be mirrored on Chromecast and give visual feedback
    AND when toggling subtitles ON/OFF a block should appear declaring the current state of subtitles

    Examples:
    | action        |
    | Pause         |
    | Play          |
    | Central Play  |
    | Central Pause |
    | Subtile ON    |
    | Subtile OFF   |
    | Mute          |
    | Unmute        |
    | Seek          |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CheckBasicPlayerControlsNoEffect
    Scenario Outline: A basic check that every "<action>" in SMP is mirrored on Chromecast
    Given I press CTA
    And video is playing successfully
    Then  "<action>" in SMP should NOT be mirrored in Chromecast

    Examples:
    | action          |
    | Subtitles Sizer |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @IconsUnavailable
    Scenario: The following "<icons>"" should disappear from SMP control-bar when casting has been activated

    Examples:
    | icons           |
    | Fullscreen      |
    | Exit Fullscreen |
    | PiP             |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CastControlPositioning
    Scenario: Check Chromecast controls are placed in top left of SMP
    This avoids overlap with the CP 
    AND CC controls remain in that position

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CastButtonUnderLinedIfOff
    Scenario: If cast is off, cast icon in SMP control bar shouldn't be underlined 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CheckQueuedPlayListPausingWorks
    Scenario: Second video of queued playlist, the timer on Chromecast continues increasing if cast cancelled

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CorrectHoldingImagedIsPlaying 
    Scenario: On a queued playlist the correct holding image should show on each video on SMP 

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @CastingAndPiPContent
    Scenario: Chromecast and Picture-In-Picture should not both be available on control bar

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @TransportBarIsLostAfterFullscreen
    Scenario: On mobile when exit full screen you lose access to control bar

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #











