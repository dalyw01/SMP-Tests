@google_voice_testing
Feature: Checking Google voice assistant technology works with smart display

  As a user
  I want the Google Smart Display to respond to my words
  So that I can 

  - Start playing a station
  - Pause a playing station
  - Query the current station
  - Query Google search engine during station playback

The main properties that should display on the Smart Display Screen are 

  - Station name
  - Holding image of station
  - Play / Pause icon depending on state

Requirements for environment

  - Google Smart Display
  - Google Home (Mini or Smart Speaker)
  - All devices connected on same network

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

Background:
Given I have a Google Home and a Google Smart Display on the same network
And I say "Ok Google" to the Google Home device
And the Google Home lights up awaiting commands

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@start_session
  Scenario Outline: Check various PLAYING commands and stations are compatible
    When I say "phrase" along with "station"
    Then I see correct title, image with player state as PLAYING
    And I hear correct station

  Examples:
    | phrase         | station        |
    | Start          | Radio 1        |
    | Play           | Radio 1 Xtra   |
    | Change to      | Radio 2        |
    | Turn on        | Radio 3	      |
    | Start playing  | Radio 4        |
    | Switch to      | Radio Asia     |
    | Will you play  | Radio Scotland |
    | Could you find | Radio 3        |
    | Could you play | Radio 1        |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@pause_session
  Scenario Outline: Check Various PAUSING commands work
  	When I start a station
  	And hear audio
    Then I say Okay Google and "phrase"
    And I see correct title, image with player state as PAUSED
    And I no audio is audible

  Examples:
    | phrase      |
    | Stop        |
    | Shut up     |
    | Please stop |
    | Terminate   |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@pause_then_resume_session
  Scenario Outline: Check that pausing and playing session work together
  	When I start a station
  	And hear audio
    Then I say Okay Google and "pause_phrase"
    And I see correct title, image with player state as PAUSED
    And I no audio is audible
    And I say Okay Google and "start_phrase"
    Then I see correct title, image with player state as PLAYING
    And I hear correct station

  Examples:
    | pause_phrase  | start_phrase  |
    | Stop          | Start         |
    | Shut up       | Play          |
    | Please stop   | Continue      |
    | Terminate     | Start playing |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@query_current_station
  Scenario Outline: Check that querying current station interrupts playback but answers
  	When I start a station
  	And hear audio
    Then I say Okay Google and "phrase"
    Then I see correct title, image with player state as PAUSED
    And audio resumes

  Examples:
    | phrase                |
    | What's playing?       |
    | What's on?            |
    | What are you playing? |
    | What's currently on   |
    | What station is that? |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@querying_google_leaves_session (need to revisit this one)
  Scenario Outline: Check that querying Google search engine leaves session but goes back
  	When I start a station
  	And hear audio
    Then I say Okay Google and "phrase"
    Then I see Google answers the query but returns to our session
    Then I see correct title, image with player state as PAUSED
    And audio resumes

  Examples:
    | phrase                |
    | How tall is a Toucan? |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@negative_test_scenarios
  Scenario Outline: Check that certain negative test cases are refused
  	When I start a station
  	And hear audio
    Then I say Okay Google and "phrase"
    None of the below should work

  Examples:
    | phrase                    | note                                                    |
    | Continue STATION          | If already on a station                                 |
    | Change to STATION         | Change to the same station                              |
    | Play X and Y              | World Service + Asian Network becomes - World Network") |
    | Play FAKE STATION NAME    | BBC Scottish Welsh                                      |
    | Take a break!             | From a current playing session it doesn't stop!         |
    | Play a random BBC station | Doesn't play any station?                               |
    | What is that?	            | Won't show name of current playing station              |
    | Play a BBC station.       | You have to specify a station.                          |










