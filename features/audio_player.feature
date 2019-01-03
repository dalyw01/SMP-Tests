Feature: New Audio Player

  As a tester of SMP
  I want to check core functionality of the new audio player
  So that old functionality is not lost
  AND new functionality works

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @OneItem
  Scenario Outline: Check basic functionality of audio player for a 1 item playlist  

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I can press +20
    And I can press -20
    And I can Audio pause
    And I can press -20
    And I see NEXT button is disabled
    And I see -20 is disabled when at START
    And I can press +20
    And I can Audio play
    And I can press +20
    And I can press -20
    And I see NEXT button is disabled
    And I can press +20
    And I can press -20
    And I can press PREVIOUS item
    And I can press +20
    And I can press -20
    And I can Audio mute if "<device>"
    And I can press +20
    And I can press -20
    And I can Audio unmute if "<device>"
    And I can press +20
    And I can press -20
    And I can click seekbar unless "<type>"
    And I can seek in quarters to the end
    And I click Audio player CTA to begin playback

  Examples:
    | page                 | type  | device  |
    | https://is.gd/hayuwa | audio | phone   |
    | https://is.gd/hayuwa | audio | tablet  |
    | https://is.gd/hayuwa | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @Replay
  Scenario Outline: Check replay functionality works
  Previous item arrow replays current clip if AFTER first 5 seconds
  Previous item arrow goes to previous clip if WITHIN first 5 seconds

  Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I can press NEXT item
    And I see NEXT button is disabled
    And I can press +20
    And I can press PREVIOUS item
    And I see NEXT button is disabled
    And I can press PREVIOUS item
    And I can press PREVIOUS item
    And I can press NEXT item
    And I see NEXT button is disabled

  Examples:
    | page                 | type  | device  |
    | https://is.gd/owebiz | audio | phone   |
    | https://is.gd/owebiz | audio | tablet  |
    | https://is.gd/owebiz | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @ThreeItems
  Scenario Outline: Check basic functionality of audio player for 3 item playlist

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I can press NEXT item
    And I can press +20
    And I can press -20
    And I can press PREVIOUS item
    And I can press PREVIOUS item
    And I can press +20
    And I can press -20
    And I can press NEXT item
    And I can press NEXT item
    And I can press +20
    And I can press +20
    And I can press -20
    And I can press -20
    And I can Audio pause
    And I can Audio play
    And I can seek in quarters to the end
    And I click Audio player CTA to begin playback

  Examples:
    | page                 | type  | device  |
    | https://is.gd/ivacij | audio | phone   |
    | https://is.gd/ivacij | audio | tablet  |
    | https://is.gd/ivacij | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @SimulcastStartButton
  Scenario Outline: Check core functionality of START button for a Simulcast

  Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I can press START button
    And I can Audio pause
    And I see -20 is disabled when at START
    And I see START button is disabled when at START
    And I can Audio play
    And I can press +20
    And I can press -20
    And I can press +20
    And I can press START button
    And I can press LIVE button
    And I can press START button

  Examples:
    | page                 | type  | device  |
    | https://is.gd/idihug | audio | phone   |
    | https://is.gd/idihug | audio | tablet  |
    | https://is.gd/idihug | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @SimulcastLiveButton
  Scenario Outline: Check core functionality of LIVE button for a Simulcast

  Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I see +20 is disabled when at LIVE
    And I see LIVE button is disabled when at LIVE
    And I can Audio pause
    And I can Audio play
    And I can press -20
    And I can press -20
    And I can press LIVE button
    And I can press START button
    And I can Audio pause
    And I see -20 is disabled when at START
    And I see START button is disabled when at START
    And I can press LIVE button
    And I see LIVE button is disabled when at LIVE

  Examples:
    | page                 | type  | device  |
    | https://is.gd/idihug | audio | phone   |
    | https://is.gd/idihug | audio | tablet  |
    | https://is.gd/idihug | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @SimulcastCore
  Scenario Outline: Check core functionality of audio player for a Simulcast

  Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I see +20 is disabled when at LIVE
    And I see LIVE button is disabled when at LIVE
    And I can Audio pause
    And I can Audio play
    And I can press -20
    And I can press -20
    And I can press LIVE button
    And I see +20 is disabled when at LIVE
    And I can Audio mute if "<device>"
    And I can press -20
    And I can press -20
    And I can press +20
    And I can Audio unmute if "<device>"
    And I can press -20
    And I can press +20
    And I can Audio pause

  Examples:
    | page                 | type  | device  |
    | https://is.gd/idihug | audio | phone   |
    | https://is.gd/idihug | audio | tablet  |
    | https://is.gd/idihug | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @Bug21-
  Scenario Outline: SMPHTML-1383, Issue 21, In a PAUSED state for 1 item, back arrow isn't greyed out but -20 is

    Given I visit "<page>" with a "<type>" player on "<device>"
    When the COOKBOOK has loaded
    Then I click Audio player CTA to begin playback
    And I can Audio pause
    And I can press -20
    And I can Audio play
    And I can Audio pause
    And I can press PREVIOUS item

  Examples:
    | page                 | type  | device  |
    | https://is.gd/hayuwa | audio | phone   |
    | https://is.gd/hayuwa | audio | tablet  |
    | https://is.gd/hayuwa | audio | desktop |










