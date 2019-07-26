@google_voice_testing
Feature: Checking Google voice assistant technology works with smart display

  As a tester
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
  Given I have a Google Home AND Google Smart Display on the SAME NETWORK
  And I say "Ok Google" to the Google Home device
  And the Google Home lights up awaiting commands

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@start_session
Scenario Outline: Check various PLAYING commands and stations are compatible
    
  When I say "<intro>" along with "<action>" AND "<station>"
  Then I expect
    - Title 
    - Holding image 
    - Player state as PLAYING
    - To hear the correct station

  Examples:
    | intro        | phrase         | station        |
    | Okay Google  | Start          | Radio 1        |
    | Hey Google   | Play           | Radio 1 Xtra   |
    | Okay Google  | Change to      | Radio 2        |
    | Okay Google  | Turn on        | Radio 3	       |
    | Hey Google   | Start playing  | Radio 4        |
    | Okay Google  | Switch to      | Radio Asia     |
    | Okay Google  | Will you play  | Radio Scotland |
    | Hey Google   | Could you find | Radio 3        |
    | Okay Google  | Could you play | Radio 1        |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@pause_session
Scenario Outline: Check Various PAUSING commands work

	When I start a station
	And hear audio
  Then I say "<intro>" and "<phrase>"
  Then I expect
    - Title 
    - Holding image 
    - Player state to PAUSE
    - To hear NO audio

  Examples:
    | intro        | phrase      |
    | Okay Google  | Stop        |
    | Hey Google   | Shut up     |
    | Okay Google  | Please stop |
    | Okay Google  | Terminate   |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@pause_then_resume_session
Scenario Outline: Check that pausing and playing session work together

  When I start a station
	And hear audio
  And I say Okay Google and "<pause_phrase>"

  Then I expect
    - Title 
    - Holding image 
    - Player state to PAUSE
    - To hear NO audio

  And I say Okay Google and "<start_phrase>"

  Then I expect
    - Title 
    - Holding image 
    - Player state as PLAYING
    - To hear the correct station

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
  Then I say "<intro>" and "<phrase>"
  Then I expect
    - Title 
    - Holding image 
    - Player state to PAUSE
    - To hear NO audio
    - Audio to eventually resume

  Examples:
    | intro        | phrase                |
    | Okay Google  | What's playing?       |
    | Hey Google   | What's on?            |
    | Okay Google  | What are you playing? |
    | Hey Google   | What's currently on   |
    | Okay Google  | What station is that? |

# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #

@negative_test_scenarios
Scenario Outline: Check that certain negative test cases are refused
  	
  When I start a station
	And hear audio
  Then I say Okay Google and "<phrase>"
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










