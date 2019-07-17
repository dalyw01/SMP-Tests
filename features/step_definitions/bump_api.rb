When(/^I can pause using BUMP API$/) do
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].pause();')
  sleep(5)
end

Then(/^I can seek in quarters to the end$/) do
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime(( embeddedMedia.players[0].duration() / 4 ) );')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime((( embeddedMedia.players[0].duration() / 4 ) * 2 ));')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime((( embeddedMedia.players[0].duration() / 4 ) * 3 ));')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime((( embeddedMedia.players[0].duration() - 3 )));')
  sleep(5)
end