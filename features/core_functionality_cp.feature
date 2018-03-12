Feature: Checking "Continious Play" plugin core functionality works
  
  As a tester of SMP
  I want the CPP panel to load at the end of the current clip
  So that the main interactions are working as expected...

  - CPP loads next item if user chooses
  - CPP loads next item if user does nothing
  - CPP can be dimissed when loaded
  - CPP can be halted when loaded
  - CPP no longer loads when final item has been played
  - CPP respects state of cookie user sets via toggle

  Background:
    Given I am on a page with the HTML player and CP plugin installed
    When I click CTA to begin playback
    And I seek to end of programme
    Then I move my cursor away

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @wait
  Scenario: No user interaction loads a new programme
    Then CPP shows
    And I wait for countdown to finish
    And I can pause the new programme

  @waitFullscreen
  Scenario: No user interaction loads a new programme while fullscreen
    Then I enter fullscreen of CP
    And CPP shows
    And I wait for countdown to finish
    And I can pause the new programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @X
  Scenario: Check pressing "X" icon dismiss's CPP
    Then CPP shows
    And I press X of CP
    And I can replay current programme

  @XFullscreen
  Scenario: Check pressing "X" icon dismiss's CPP while fullscreen
    Then I enter fullscreen of CP
    And CPP shows
    And I press X of CP
    And I can replay current programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @CancelString
  Scenario: Check pressing "Cancel" halts CPP
    Then CPP shows
    And I press cancel of CPP to stop countdown
    And CPP dimisses cancel option
    And I press X of CP
    And I can replay current programme

  @CancelStringFullscreen
  Scenario: Check pressing "Cancel" halts CPP while fullscreen
    Then I enter fullscreen of CP
    And CPP shows
    And I press cancel of CPP to stop countdown
    And CPP dimisses cancel option
    And I can replay current programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @CancelCircle
  Scenario: Check pressing "Cancel Circle" halts CPP
    Then CPP shows
    And I press cancel circle of CPP to stop countdown
    And CPP dimisses cancel option
    And I press X of CP
    And I can replay current programme

  @CancelCircleFullscreen
  Scenario: Check pressing "Cancel Circle" halts CPP while fullscreen
    Then I enter fullscreen of CP
    And CPP shows
    And I press cancel circle of CPP to stop countdown
    And CPP dimisses cancel option
    And I can replay current programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @MiniCTA
  Scenario: Check pressing "Mini CTA" loads next programme
    Then CPP shows
    And I press mini CTA of CP
    And I can pause the new programme

  @MiniCTAFullscreen
  Scenario: Check pressing "Mini CTA" loads next programme while fullscreen
    Then I enter fullscreen of CP
    And CPP shows
    And I press mini CTA of CP
    And I can pause the new programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @MiniThumbnail
  Scenario: Check mini clickable "Mini Thumbnail" loads next programme
    Then CPP shows
    And I press mini thumbnail of CP
    And I can pause the new programme

  @MiniThumbnailFullscreen
  Scenario: Check mini clickable "Mini Thumbnail" loads next programme while fullscreen
    Then I enter fullscreen of CP
    And CPP shows
    And I press mini thumbnail of CP
    And I can pause the new programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @arrowLastItem
  Scenario: Check user can scroll across carousel and play last item, last item no longer has countdown
    Then CPP shows
    And I scroll through whole carousel and select the last item
    And I seek to end of programme
    And CPP shows WITHOUT cancel options

  @arrowLastItemFullscreen
  Scenario: Check user can scroll across carousel and play last item while fullscreen, last item no longer has countdown
    Then I enter fullscreen of CP
    And CPP shows
    And I scroll through whole carousel and select the last item
    And I seek to end of programme
    And CPP shows WITHOUT cancel options

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @XThenX
  Scenario: Checking CPP appears again after dismissing with X icon
    Then I seek to end of programme
    And CPP shows
    And I press X of CP
    And I seek to end of programme
    And I can play
    And CPP shows
    And I press X of CP
    And I can replay current programme

  @XThenCancelString
  Scenario: Checking CPP appears again and pressing "Cancel" works
    Then I seek to end of programme
    And CPP shows
    And I press X of CP
    And I seek to end of programme
    And I can play
    And CPP shows
    And I press cancel of CPP to stop countdown
    And CPP dimisses cancel option
    And I press X of CP
    And I can replay current programme

  @XThenCancelCircle
  Scenario: Checking CPP appears again and pressing Cancel Circle works
    Then I seek to end of programme
    And CPP shows
    And I press X of CP
    And I seek to end of programme
    And I can play
    And CPP shows
    And I seek to end of programme
    And I press cancel circle of CPP to stop countdown
    And CPP dimisses cancel option
    And I press X of CP
    And I can replay current programme

  @XThenMiniCTA
  Scenario: Checking CPP appears again and pressing Mini CTA works
    Then I seek to end of programme
    And CPP shows
    And I press X of CP
    And I can play
    And I seek to end of programme
    And CPP shows
    And I press mini CTA of CP
    And I can pause the new programme

  @XThenMiniThumbnail
  Scenario: Checking CPP appears again and pressing mini thumbnail works
    Then I seek to end of programme
    And CPP shows
    And I press X of CP
    And I can play
    And I seek to end of programme
    And CPP shows
    And I press mini thumbnail of CP
    And I can pause the new programme

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @CpAndControls
  Scenario: Check CPP does not break core SMP functionality
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows
    And I press mini thumbnail of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows

  @CpAndControlsFullscreen
  Scenario: Check CPP does not break core SMP functionality in Fullscreen
    And I enter fullscreen of CP
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows
    And I press mini thumbnail of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows
    And I press mini CTA of CP
    And I use core functionality of SMP
    And I seek to end of programme
    And CPP shows

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @ToggleON
  Scenario: Check CPP shows if toggle ON and is on by default
    Then CPP shows

  @ToggleONFullscreen
  Scenario: Check CPP shows if toggle ON in fullscreen
    And I enter fullscreen of CP
    And CPP shows

  @ToggleOFF
  Scenario: Check CPP does not show if toggle OFF
    Then I toggle CPP OFF
    And I press mini CTA of CP
    And I seek to end of programme
    And CPP shows WITHOUT cancel options

  @ToggleOFFFullscreen
  Scenario: Check CPP does not show if toggle OFF in fullscreen
    Then I toggle CPP OFF
    And I press mini CTA of CP
    And I enter fullscreen of CP
    And I seek to end of programme
    And CPP shows WITHOUT cancel options

