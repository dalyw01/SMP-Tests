Feature: Checking PG works as expected when switching from parent to child for various scenarios

  @inplayer_tp_1
  Scenario: As parent, SETTING pin and unlocking as child
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I enter 1 1 1 1
    And I press [Play] to set new PIN
    Given an u16 HTML player with guidance
    When I click CTA
    And I enter D A L Y
    And I press [Play] to unlock
    And I see caution symbol with incorrect PIN error message
    And I enter 1 1 1 1
    And I press [Play] to unlock
    Then large player playback should initialize

  @BUMP_tp_1
  Scenario: As parent, SETTING pin and unlocking as child
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter 1 1 1 1 to BUMP
    And I press BUMP [Play] to set new PIN
    Given an u16 HTML player with guidance
    When I click small CTA
    And I enter D A L Y to BUMP
    And I press BUMP [Play] to unlock
    And I see BUMP caution symbol with incorrect PIN error message
    And I enter 1 1 1 1 to BUMP
    And I press BUMP [Play] to unlock
    Then small player playback should initialize


  @inplayer_tp_2
  Scenario: As parent, NOT SETTING pin and checking child still needs permissions(MP-3086)
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize
    Given an u16 HTML player with guidance
    When I click CTA
    And I press [Play] button to proceed through u16
    And I see caution symbol with GUARDIANS permission error message
    Then I should be able to press [Play] button again
    And I tick checkbox
    And I press [Play] button to proceed through u16
    And I seek to end
    Then I should be able to restart playback without another pop-up

  @BUMP_tp_2
  Scenario: As parent, NOT SETTING pin and checking child still needs permissions(MP-3086)
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize
    Given an u16 HTML player with guidance
    When I click small CTA
    And I press BUMP [Play] button to proceed through u16
    And I see BUMP caution symbol with GUARDIANS permission error message
    Then I should be able to press BUMP Play button again
    And I tick BUMP checkbox
    And I press BUMP [Play] button to proceed through u16
    And I seek to small player end
    Then I should be able to restart small player playback without another pop-up


  @inplayer_tp_3
  Scenario: As parent, SETTING pin, then UNLOCKING and checking child still has to get permission
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I enter 1 1 1 1
    And I press [Play] to set new PIN
    Given an o16 HTML player with guidance
    When I click o16 large LOCKED icon
    And I enter D A L Y
    And I press [Play] to unlock
    And I see caution symbol with incorrect PIN error message
    And I enter 1 1 1 1
    And I press [Play] to unlock
    Given an u16 HTML player with guidance
    When I click CTA
    And I press [Play] button to proceed through u16
    And I see caution symbol with GUARDIANS permission error message
    Then I should be able to press [Play] button again
    And I tick checkbox
    And I press [Play] button to proceed through u16
    And I seek to end
    Then I should be able to restart playback without another pop-up

  @BUMP_tp_3
  Scenario: As parent, SETTING pin, then UNLOCKING and checking child still has to get permission
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter 1 1 1 1 to BUMP
    And I press BUMP [Play] to set new PIN
    Given an o16 HTML player with guidance
    When I click o16 small LOCKED icon
    And I enter D A L Y to BUMP
    And I press BUMP [Play] to unlock
    And I see BUMP caution symbol with incorrect PIN error message
    And I enter 1 1 1 1 to BUMP
    And I press BUMP [Play] to unlock
    Given an u16 HTML player with guidance
    When I click small CTA
    And I press BUMP [Play] button to proceed through u16
    And I see BUMP caution symbol with GUARDIANS permission error message
    Then I should be able to press BUMP Play button again
    And I tick BUMP checkbox
    And I press BUMP [Play] button to proceed through u16
    And I seek to small player end
    Then I should be able to restart small player playback without another pop-up


  @inplayer_tp_4
  Scenario: As parent, IGNORING PG setup by pressing X, then checking child still has to get permission
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    Then I should be able to dismiss pop-up pressing X icon
    Given an u16 HTML player with guidance
    When I click CTA
    And I press [Play] button to proceed through u16
    And I see caution symbol with GUARDIANS permission error message
    Then I should be able to press [Play] button again
    And I tick checkbox
    And I press [Play] button to proceed through u16
    And I seek to end
    Then I should be able to restart playback without another pop-up

  @BUMP_tp_4
  Scenario: As parent, IGNORING PG setup by pressing X, then checking child still has to get permission
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    Then I should be able to dismiss BUMP pop-up pressing X icon
    Given an u16 HTML player with guidance
    When I click small CTA
    And I press BUMP [Play] button to proceed through u16
    And I see BUMP caution symbol with GUARDIANS permission error message
    Then I should be able to press BUMP Play button again
    And I tick BUMP checkbox
    And I press BUMP [Play] button to proceed through u16
    And I seek to small player end
    Then I should be able to restart small player playback without another pop-up
