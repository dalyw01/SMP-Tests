Feature: Checking SMP core functionality of Audio player

  As a tester of SMP
  I want to check core functionality of the audio player across various sized screens
  So that I can verify every feature is working in all expected situations

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @OneItem
  Scenario Outline: Check basic functionality of audio player for a 1 item playlist    
  Given I visit "<page>" with a "<type>" player on "<device>"
    When I accept BBC cookies
    Then I click CTA to begin playback
    And I can press seek forward button
    And I can press seek back button
    And I can pause
    And I can press seek forward button
    And I can press seek back button
    And I can play
    And I can press seek forward button
    And I can press seek back button
    And I can mute
    And I can click each volume bar
    And I can press seek forward button
    And I can press seek back button
    And I can unmute
    And I can click seekbar unless "<type>"
    And I can seek in quarters to the end
    And I click CTA to begin playback

  Examples:
    | page                 | type  | device  |
    | https://is.gd/otehed | audio | phone   |
    | https://is.gd/otehed | audio | tablet  |
    | https://is.gd/otehed | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @ThreeItems
  Scenario Outline: Check basic functionality of audio player for 3 item playlist
    Given I visit "<page>" with a "<type>" player on "<device>"
    When I accept BBC cookies
    Then I click CTA to begin playback
    And I can press next item
    And I can press previous item
    And I can press next item
    And I can press next item
    And I can press seek forward button
    And I can press seek forward button
    And I can press seek back button
    And I can press seek back button
    And I can pause
    And I can play
    And I can seek in quarters to the end
    And I click CTA to begin playback

  Examples:
    | page                 | type  | device  |
    | https://is.gd/abivek | audio | phone   |
    | https://is.gd/abivek | audio | tablet  |
    | https://is.gd/abivek | audio | desktop |

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # 

  @Simulcast
  Scenario Outline: Check basic functionality of audio player for a Simulcast 
  Given I visit "<page>" with a "<type>" player on "<device>"
    When I accept BBC cookies
    Then I click CTA to begin playback
    And I can press START button
    And I can press LIVE button
    And I can press START button
    And I can press LIVE button

  Examples:
    | page                 | type  | device  |
    | https://is.gd/idihug | audio | desktop |
