Feature: Checking Parental Guidance works as expected for a user over 16 with NO pin set initially
  As a tester
  I want to check every part of PG is clickable
  I want to check every step of PG can be exited from via X icon
  I want to check that once every valid condition has been met that playback will commence
  I want playback to replay upon completion without the need to repeat every PG step again
  I want password to be mandatory once a PIN has been set and respected across multiple players
  So that PG works as expected for both inplayer PG and BUMP PG

  @inplayer_tp_1
  Scenario: Checking playback commences when I click "Play Without PG Lock"
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen large CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize

  @BUMP_tp_1
  Scenario: Checking playback commences when I click BUMP "Play Without PG Lock"
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize



  @inplayer_tp_2
  Scenario: Checking I am prompted with guidance and can dismiss
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen large CTA
    And I dismiss over sixteen pop-up pressing X icon
    And I click over sixteen large CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize

  @BUMP_tp_2
  Scenario: Checking I am prompted with BUMP guidance and can dismiss
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen small CTA
    And I dismiss over sixteen BUMP pop-up pressing X icon
    And I click over sixteen small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize



  @inplayer_tp_3
  Scenario: Dismiss guidance while entering PIN and checking playback commences after clicking CTA
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I dismiss over sixteen pop-up pressing X icon
    And I click over sixteen large CTA
    Then large player playback should initialize

  @BUMP_tp_3
  Scenario: Dismiss guidance while entering PIN and checking playback commences after clicking CTA
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    And I dismiss over sixteen BUMP pop-up pressing X icon
    And I click over sixteen small CTA
    Then small player playback should initialize



  @inplayer_tp_4
  Scenario: Checking both players unlocked after dismissing popup while entering PIN
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I dismiss over sixteen pop-up pressing X icon
    Then padlock should be unlocked on both players

  @BUMP_tp_4
  Scenario: Checking both players unlocked after dismissing popup while entering PIN
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    And I dismiss over sixteen BUMP pop-up pressing X icon
    Then padlock should be unlocked on both players



  @inplayer_tp_5
  Scenario: Setting new pin and unlocking a single play on small player
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I enter multiple one values
    And I press [Play] to set new PIN
    Then large player playback should initialize
    When I click over sixteen small CTA
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to unlock
    Then small player playback should initialize

  @BUMP_tp_5
  Scenario: Setting new pin and unlocking a single play on large player
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to set new PIN
    Then small player playback should initialize
    When I click over sixteen large CTA
    And I enter multiple one values
    And I press [Play] to unlock
    Then large player playback should initialize



  @inplayer_tp_6
  Scenario: Setting pin on large player and unlocking via small player
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I enter multiple one values
    And I press [Play] to set new PIN
    Then large player playback should initialize
    When I click over sixteen small LOCK icon
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to unlock
    Then padlock should be unlocked on small player


  @BUMP_tp_6
  Scenario: Setting pin on small player and unlocking via large player
    Given multiple over sixteen HTML players with guidance and NO cookies
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to set new PIN
    Then small player playback should initialize
    When I click over sixteen large LOCK icon
    And I enter multiple one values
    And I press [Play] to unlock
    Then padlock should be unlocked on large player
