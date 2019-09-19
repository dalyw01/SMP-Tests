  @pg_u16
  Feature: Checking Parental Guidance works as expected for a user under 16 with NO pin set initially
    As a tester
    I want to check every part of PG is clickable
    I want to check every part of PG can be exited from via X icon
    I want to check that once every condition has been met that playback will commence
    I want playback to replay upon completion without the need to repeat every PG step again
    So that PG works as expected for both inplayer PG and BUMP PG

  @inplayer_tp_1
  Scenario: Checking I am prompted with guidance and can then dismiss
    Given an u16 HTML player with guidance
    When I click CTA
    And I see correct PG message
    Then I should be able to dismiss pop-up pressing X icon

  @BUMP_tp_1
  Scenario: Checking I am prompted with BUMP guidance and can then dismiss
    Given an u16 HTML player with guidance
    When I click small CTA
    And I see correct BUMP PG message
    Then I should be able to dismiss BUMP pop-up pressing X icon

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @inplayer_tp_2
  Scenario: Checking pressing Play button without check box does not start playback
    Given an u16 HTML player with guidance
    When I click CTA
    And I see correct PG message
    And I press [Play] button to proceed through u16
    And I see caution symbol with GUARDIANS permission error message
    Then I should be able to press [Play] button again
    And I see caution symbol with GUARDIANS permission error message

  @BUMP_tp_2
  Scenario: Checking pressing Play button without check box does not start playback
    Given an u16 HTML player with guidance
    When I click small CTA
    And I see correct BUMP PG message
    And I press BUMP [Play] button to proceed through u16
    And I see BUMP caution symbol with GUARDIANS permission error message
    Then I should be able to press BUMP Play button again
    And I see BUMP caution symbol with GUARDIANS permission error message

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @inplayer_tp_3
  Scenario: Checking I can tick checkbox and can then dismiss popup
    Given an u16 HTML player with guidance
    When I click CTA
    And I see correct PG message
    And I tick checkbox
    Then I should be able to dismiss pop-up pressing X icon

  @BUMP_tp_3
  Scenario: Checking I can tick checkbox and can then dismiss popup
    Given an u16 HTML player with guidance
    When I click small CTA
    And I see correct BUMP PG message
    And I tick BUMP checkbox
    Then I should be able to dismiss BUMP pop-up pressing X icon

  # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

  @inplayer_tp_4
  Scenario: Playing through the whole PG setup successfully without any PIN set
    Given an u16 HTML player with guidance
    When I click CTA
    And I see correct PG message
    And I tick checkbox
    And I press [Play] button to proceed through u16
    And I seek to end
    Then I should be able to restart playback without another pop-up

  @BUMP_tp_4
  Scenario: Playing through the whole PG setup successfully without any PIN set
    Given an u16 HTML player with guidance
    When I click small CTA
    And I see correct BUMP PG message
    And I tick BUMP checkbox
    And I press BUMP [Play] button to proceed through u16
    And I seek to small player end
    Then I should be able to restart small player playback without another pop-up
