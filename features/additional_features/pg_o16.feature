@pg_16
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
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize

  @BUMP_tp_1
  Scenario: Checking playback commences when I click BUMP "Play Without PG Lock"
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize



  @inplayer_tp_2
  Scenario: Checking I am prompted with guidance and can dismiss
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I dismiss o16 pop-up pressing X icon
    And I click CTA
    And I press [Play Without PG Lock]
    Then large player playback should initialize

  @BUMP_tp_2
  Scenario: Checking I am prompted with BUMP guidance and can dismiss
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I dismiss o16 BUMP pop-up pressing X icon
    And I click small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initialize



  @inplayer_tp_3
  Scenario: Dismiss guidance while entering PIN and checking playback commences after clicking CTA
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I enter D A L Y
    And I press [Play] to set new PIN
    And I see caution symbol with invalid PIN error message
    And I dismiss o16 pop-up pressing X icon
    And I click CTA
    Then large player playback should initialize

  @BUMP_tp_3
  Scenario: Dismiss guidance while entering PIN and checking playback commences after clicking CTA
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    And I enter D A L Y to BUMP
    And I press BUMP [Play] to set new PIN
    And I see BUMP caution symbol with invalid PIN error Message
    And I dismiss o16 BUMP pop-up pressing X icon
    And I click small CTA
    Then small player playback should initialize



  @inplayer_tp_4
  Scenario: Checking both players unlocked after dismissing popup while entering PIN
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I enter D A L Y
    And I press [Play] to set new PIN
    And I see caution symbol with invalid PIN error message
    And I dismiss o16 pop-up pressing X icon
    Then padlock should be unlocked on both players

  @BUMP_tp_4
  Scenario: Checking both players unlocked after dismissing popup while entering PIN
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    And I enter D A L Y to BUMP
    And I press BUMP [Play] to set new PIN
    And I see BUMP caution symbol with invalid PIN error Message
    And I dismiss o16 BUMP pop-up pressing X icon
    Then padlock should be unlocked on both players



  @inplayer_tp_5
  Scenario: Setting new pin on large player and unlocking a single play on small player
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I enter D A L Y
    And I press [Play] to set new PIN
    And I see caution symbol with invalid PIN error message
    And I enter 1 1 1 1
    And I press [Play] to set new PIN
    Then large player playback should initialize
    When I click small CTA
    Then small player playback should initialize

  @BUMP_tp_5
  Scenario: Setting new pin on small player and unlocking a single play on large player
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter D A L Y to BUMP
    And I press BUMP [Play] to set new PIN
    And I see BUMP caution symbol with invalid PIN error Message
    And I enter 1 1 1 1 to BUMP
    And I press BUMP [Play] to set new PIN
    Then small player playback should initialize
    When I click CTA
    Then large player playback should initialize



  @inplayer_tp_6
  Scenario: Setting pin on large player and unlocking via small player padlock
    Given multiple o16 HTML players with guidance and NO cookies
    When I click CTA
    And I press [Turn On PG Lock]
    And I enter D A L Y
    And I press [Play] to set new PIN
    And I see caution symbol with invalid PIN error message
    And I enter 1 1 1 1
    And I press [Play] to set new PIN
    Then large player playback should initialize
    When I click small CTA
    Then small player playback should initialize

  @BUMP_tp_6
  Scenario: Setting pin on small player and unlocking via large player padlock
    Given multiple o16 HTML players with guidance and NO cookies
    When I click small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter D A L Y to BUMP
    And I press BUMP [Play] to set new PIN
    And I see BUMP caution symbol with invalid PIN error Message
    And I enter 1 1 1 1 to BUMP
    And I press BUMP [Play] to set new PIN
    Then small player playback should initialize
    When I click CTA
    Then large player playback should initialize
