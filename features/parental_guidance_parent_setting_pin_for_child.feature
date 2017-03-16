Feature: Checking PG works for parent setting parent and then blocks a child when PIN is set
  As a parent
  I want to set a new PIN
  So that when my child logs in they must know the PIN to play content

  @inplayer_tp_1
  Scenario: Setting pin on large player and unlocking as child
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I enter multiple one values
    And I press [Play] to set new PIN
    Given an u16 HTML player with guidance
    When I click CTA
    And I enter the letters D A L Y
    And I press [Play] to unlock
    And I see caution symbol with incorrect PIN error message
    And I enter multiple one values
    And I press [Play] to unlock
    Then large player playback should initialize

  @BUMP_tp_1
  Scenario: Setting pin on BUMP player and unlocking as child
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to set new PIN
    Given an u16 HTML player with guidance
    When I click small CTA
    And I enter the letters D A L Y to BUMP
    And I press BUMP [Play] to unlock
    And I see BUMP caution symbol with incorrect PIN error message
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to unlock
    Then small player playback should initialize
