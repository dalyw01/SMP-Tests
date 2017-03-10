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
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen large CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize

  @BUMP_tp_1
  Scenario: Checking playback commences when I click BUMP "Play Without PG Lock"
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize


  @inplayer_tp_2
  Scenario: Checking I am prompted with guidance and can dismiss immediately
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen large CTA
    And I dismiss over sixteen pop-up pressing X icon
    And I click over sixteen large CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize

  @BUMP_tp_2
  Scenario: Checking I am prompted with BUMP guidance and can dismiss immediately
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I dismiss over sixteen BUMP pop-up pressing X icon
    And I click over sixteen small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize



  @inplayer_tp_3
  Scenario: Dismiss guidance while entering PIN and checking playback commences after clicking CTA
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I dismiss over sixteen pop-up pressing X icon
    Then playback should start without another over sixteen pop-up after pressing CTA

  @BUMP_tp_3
  Scenario: Dismiss guidance while entering PIN and checking playback commences after clicking CTA
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    And I dismiss over sixteen BUMP pop-up pressing X icon
    Then I should be able to restart playback without another BUMP over sixteen pop-up



  @inplayer_tp_4
  Scenario: Checking both players unlocked after dismissing popup while entering PIN
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I dismiss over sixteen pop-up pressing X icon
    Then the padlock should be unlocked on both players

  @BUMP_tp_4
  Scenario: Checking both players unlocked after dismissing popup while entering PIN
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    And I dismiss over sixteen BUMP pop-up pressing X icon
    Then the padlock should be unlocked on both players



  @inplayer_tp_5
  Scenario: Successfully setting pin and checking state of small player
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen large CTA
    And I press [Turn On PG Lock]
    And I enter multiple one values
    And I press [Play] to activate PIN
    Then large player playback should initialize
    When I click over sixteen small CTA
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to play content
    Then small player playback should initialize

  @BUMP_tp_5
  Scenario: Successfully setting pin and checking state of player
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter multiple one values to BUMP
    And I press BUMP [Play] to activate PIN
    Then small player playback should initialize
    When I click over sixteen large CTA
    And I enter multiple one values
    And I press [Play] to unlock
    Then large player playback should initialize
