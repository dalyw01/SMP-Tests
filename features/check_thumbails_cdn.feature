Feature: Checking SMP HTML player base functionality
  As a tester of SMP
  I want to check thumbnails load on both CDNs
  So that a user can preview scenes in the player

  Scenario Outline: Check thumbnails load
    Given I am on a page with several HTML players
    When I click on CTA to begin playback on "<player>"
    Then click seekbar on "<player>"
    And verify thumbnail appears on "<player>"

    Examples:
      | player                          |
      | smphtml5iframemedia_player_1    |
      | smphtml5iframemedia_player_1    |
      | smphtml5iframemedia_player_1    |
      | smphtml5iframemedia_player_1    |
      | smphtml5iframemedia_player_1    |
      | smphtml5iframemedia_player_2    |
      | smphtml5iframemedia_player_2    |
      | smphtml5iframemedia_player_2    |
      | smphtml5iframemedia_player_2    |
      | smphtml5iframemedia_player_2    |
