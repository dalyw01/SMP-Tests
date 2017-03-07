Feature: Checking Parental Guidance works as expected for a user over 16 with NO pin set initially
  As a tester
  I want to check every part of PG is clickable
  I want to check every step of PG can be exited from via X icon
  I want to check that once every condition has been met that playback will commence
  I want playback to replay upon completion without the need to repeat every PG step again
  I want password to be mandatory once a PIN has been set and respected across multiple players
  So that PG works as expected for both inplayer PG and BUMP PG

  @inplayer_guidance_dissming_after_cta
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    Then I should be able to dismiss over sixteen pop-up pressing X icon

  @inplayer_guidance_playback_after_no_lock_setup
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    And I press [Play Without PG Lock]
    Then playback should initiliase

  @inplayer_guidance_dismiss_while_setting_pin
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    Then I should be able to dismiss over sixteen pop-up pressing X icon
    Then the padlock should be unlocked on both players

  @inplayer_guidance_dismiss_and_check_no_more_pop-up
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    Then I should be able to dismiss over sixteen pop-up pressing X icon
    Then I should be able to restart playback without another over sixteen pop-up

  @inplayer_guidance_setting_pin
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    And I press [Turn On PG Lock]
    And I enter multiple one values
    And I press [Play]
    Then playback should initiliase
    Then I should be able to initialise playback on BUMP player after unlocking padlock

  @BUMP_guidance_dissming_after_cta
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    Then I should be able to dismiss over sixteen BUMP pop-up pressing X icon

  @BUMP_guidance_playback_after_no_lock_setup
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Play Without PG Lock]
    Then small player playback should initiliase

  @BUMP_guidance_dismiss_while_setting_pin
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    Then I should be able to dismiss over sixteen BUMP pop-up pressing X icon
    Then the padlock should be unlocked on both players

  @BUMP_guidance_dismiss_and_check_no_more_pop-up
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I am presented with a BUMP text field
    Then I should be able to dismiss over sixteen BUMP pop-up pressing X icon
    Then I should be able to restart playback without another BUMP over sixteen pop-up

  @BUMP_guidance_setting_pin
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen small CTA
    And I press BUMP [Turn On PG Lock]
    And I enter multiple one values to BUMP
    And I press BUMP [Play]
    Then small player playback should initiliase
    Then I should be able to initialise playback on inplayer player after unlocking padlock
