Feature: Checking Parental Guidance works as expected for a user under 16 with NO pin set
  As a tester
  I want to check every part of PG is clickable
  I want to check every part of PG can be exited from via X icon
  I want to check that once every condition has been met that playback will commence
  I want playback to be replay-able upon completion without the need to repeat every PG step again
  So that PG works as expected for both inplayer PG and BUMP PG

  @inplayer_guidance_dissming_after_cta
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given a HTML player with guidance
    When I click CTA
    Then I should be able to dismiss pop-up pressing X icon

  @inplayer_guidance_dissming_after_ticking_checkbox
  Scenario: Checking I can tick checkbox and can then dismiss popup
    Given a HTML player with guidance
    When I click CTA
    And I tick checkbox
    Then I should be able to dismiss pop-up pressing X icon

  @inplayer_guidance_dissming_after_pressing_play
  Scenario: Checking pressing Play button without check box does not start playback
    Given a HTML player with guidance
    When I click CTA
    And I press Play button
    Then I should be able to press Play button again

  @inplayer_guidance_clicking_successfully_through
  Scenario: Playing through the whole PG setup successfully
    Given a HTML player with guidance
    When I click CTA
    And I tick checkbox
    And I press Play button
    And I seek to end
    Then I should be able to restart playback without another pop-up


  @BUMP_guidance_dissming_after_cta
  Scenario: Checking I am prompted with BUMP guidance and can then dismiss
    Given a HTML player with guidance
    When I click small CTA
    Then I should be able to dismiss BUMP pop-up pressing X icon

  @BUMP_guidance_dissming_after_ticking_checkbox
  Scenario: Checking I can tick checkbox and can then dismiss popup
    Given a HTML player with guidance
    When I click small CTA
    And I tick BUMP checkbox
    Then I should be able to dismiss BUMP pop-up pressing X icon

  @BUMP_guidance_dissming_after_pressing_play
  Scenario: Checking pressing Play button without check box does not start playback
    Given a HTML player with guidance
    When I click small CTA
    And I press BUMP Play button
    Then I should be able to press BUMP Play button again

  @BUMP_guidance_clicking_successfully_through
  Scenario: Playing through the whole PG setup successfully
    Given a HTML player with guidance
    When I click small CTA
    And I tick BUMP checkbox
    And I press BUMP Play button
    And I seek to small player end
    Then I should be able to restart small player playback without another pop-up
