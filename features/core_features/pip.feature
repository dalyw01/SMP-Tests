@pip
Feature: Checking Picture In Picture (PiP) functionality works fine

As a tester of SMP
I want to check core functionality of PIP
So that I verify its working as expected
Its currently only supported on Google Chrome

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Background:
  Given I am on a COOKBOOK page with the HTML player and CP plugin installed
  When the COOKBOOK has loaded
  And I click CTA to begin playback

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@CheckPipIcons
Scenario: Check basic PIP functionality works as expected
  When I click PIP icon
  And I see the PIP window shows
  And I click PIP icon
  Then I see the PIP window disappears

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@CheckPipWithSMPControls
Scenario: Check basic SMP functionality works when PIP is activated
  When I click PIP icon
  And I see the PIP window shows
  And I can pause
  And I can play
  And I click PIP icon
  And I can pause
  And I can play
  Then I see the PIP window disappears

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@NoPIPForAudioPlayer
Scenario Outline: PIP should not be present in an Audio player
  Given I visit "<page>" with a "<type>" player on "<device>"
  When the COOKBOOK has loaded
  Then I click Audio player CTA to begin playback
  Then I should not see PIP icon on Audio player

Examples:
  | page                 | type  | device  |
  | https://is.gd/hayuwa | audio | desktop |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@PIPContinuousPlayPanel
Scenario Outline: CP appears even when PIP window is showing
  And I click PIP icon
  And I seek to end of programme
  Then CPP shows
  Then I press "<button>"
  And I can play any content in the CP list

Examples:
  | button                 |
  | Circle                 |
  | Circle                 |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@PIPExitsFullscreen
Scenario: When in Fullscreen pressing PIP icon exits fullscreen
  And I can double click anywhere in the player hitbox to enter fullscreen
  When I click PIP icon
  And I can double click anywhere in the player hitbox to enter fullscreen

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
