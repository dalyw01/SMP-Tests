@errors
Feature: Checking SMP errors
  As a tester of SMP
  I want errors generated for both FLASH and HTML
  So that I can compare the errors codes, messages and playlists with my expected values

  Background:
  Given I am on the Cookbook Errors page

  @errors
  Scenario Outline: Check basic HTML error codes
    Given I am on the errors cookbook page and select HTML player
    When I click on link - "<link>"
    Then I should get a message - "<message>"
    And I should get a playlist - "<playlist>"
    And I should get an error code - "<code>"
    And I should get a severity - "<severity>"

  Examples:
    | link | message                                                | playlist                                                                       | severity | code       |
    | 1001 | This content doesn't seem to be working                | http://google.com/nope.xml                                                     | error    | 1001       |
    | 1002 | This content doesn't seem to be working                | http://static.int.bbc.co.uk/smp/assets/playlists/malformed_playlist.xml        | critical | 1060       |
    | 1003 | This content doesn't seem to be working                | http://static.int.bbc.co.uk/smp/assets/playlists/no_playable_items.xml         | critical | 1003       |
    | 1004 | This programme is not available to play yet            | http://static.int.bbc.co.uk/smp/assets/playlists/not_available_yet.xml         | critical | 1004       |
    | 1005 | This live stream has ended                             | http://static.int.bbc.co.uk/smp/assets/playlists/no_longer_available.xml       | critical | 1005       |
    | 1007 | This live stream has ended                             | http://static.int.bbc.co.uk/smp/assets/playlists/no_longer_broadcasting.xml    | critical | 1005       |
    | 1008 | This content doesn't seem to be working                | http://static.int.bbc.co.uk/smp/assets/playlists/off_air.xml                   | critical | 1003       |
    | 1009 | This content is not currently available on this device | http://static.int.bbc.co.uk/smp/assets/playlists/no_media.xml                  | critical | 1052       |
    | 1024 | This content is not currently available on this device | http://static.int.bbc.co.uk/smp/assets/playlists/ident_then_mediation_fail.xml | critical | 1052       |
    | 3024 | This content doesn't seem to be working                | http://static.int.bbc.co.uk/smp/assets/playlists/connections_fail.xml          | critical | 5000, 5001 |
