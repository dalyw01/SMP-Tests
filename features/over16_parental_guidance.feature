Feature: Checking Parental Guidance works as expected for a user over 16 with NO pin set initially
  As a tester
  I want to check every part of PG is clickable
  I want to check every part of PG can be exited from via X icon
  I want to check that once every condition has been met that playback will commence
  I want playback to replay upon completion without the need to repeat every PG step again
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

  @inplayer_guidance_dismiss_after_wanting_to_set_pin
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    And I press [Turn On PG Lock]
    And I am presented with a text field
    And I am press [Play without setting PIN]
    Then I should be able to dismiss over sixteen pop-up pressing X icon
    Then I should be able to restart playback without another over sixteen pop-up

  @inplayer_guidance_setting_pin
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given multiple over sixteen HTML players with guidance
    When I click over sixteen CTA
    And I press [Turn On PG Lock]
    And I enter multiple one values
    And I press Play
    Then playback should initiliase
    Then Given multiple over sixteen HTML players with guidance
