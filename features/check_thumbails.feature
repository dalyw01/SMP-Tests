Feature: Checking SMP HTML player provides thumbnails
  As a tester of SMP
  I want to check thumbnails load on demand
  So that a user can preview scenes in the player

  Scenario Outline: Check thumbnails load
    Given I am on a page with a HTML player
    When I click on CTA to begin playback
    And I can see controlbar fade instantly when cursor hovers away
    And I can click seekbar
    And verify thumbnail appears on "<player>"

    Examples:
      | player              |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |
      | smphtml5iframemp    |



