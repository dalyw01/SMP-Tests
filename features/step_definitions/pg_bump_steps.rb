When(/^I click small CTA$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

Then(/^small player playback should initialize$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I should be able to restart small player playback without another pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end

When(/^I seek to small player end$/) do
  sleep(5) # Wait for ident to finish
  page.execute_script( 'embeddedMedia.players[1].currentTime(( embeddedMedia.players[1].duration() - 2 ));')
  sleep(4)
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Initial checks and actions with PG pop-up
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I see correct BUMP PG message$/) do
  sleep(1)
  find('#guidanceMessage').should have_content('PG MESSAGE SMALL PLAYLIST')
  sleep(2)
end

When(/^I tick BUMP checkbox$/) do
  find('#ageConfirmCheck').hover
  sleep(1)
  find('#ageConfirmCheck').click
end


When(/^I dismiss o16 BUMP pop\-up pressing X icon$/) do
  find('#pgExit').hover
  sleep(2)
  find('#pgExit').click
end

Then(/^I should be able to dismiss BUMP pop\-up pressing X icon$/) do
  find('#pgExit').hover
  sleep(1)
  find('#pgExit').click
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Buttons in PG pop-up
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I press BUMP \[Play\] button to proceed through u16$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

When(/^I press BUMP \[Play Without PG Lock\]$/) do
  sleep(2)
  page.first("#toolTipPlay").click
end

When(/^I press BUMP \[Turn On PG Lock\]$/) do
  sleep(2)
  page.first("#pgTurnOn").click
  sleep(2)
end

When(/^I press BUMP \[Play\] to unlock$/) do
  sleep(2)
  all(:xpath, '//*[@id="pgTurnOff"]')[0].click
end

When(/^I press BUMP \[Play\] to set new PIN$/) do
  sleep(2)
  all(:xpath, '//*[@id="pgActivate"]')[0].click
end

When(/^I press BUMP \[Continue\]$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

Then(/^I should be able to press BUMP Play button again$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Entering Data for PG PIN
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I am presented with a BUMP text field$/) do
  sleep(2)
  page.first("#pinEntryInputBox").hover
  sleep(2)
end

When(/^I enter 1 1 1 1 to BUMP$/) do
  sleep(2)
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("1111")
  sleep(2)
end


When(/^I enter D A L Y to BUMP$/) do
  sleep(2)
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("DALY")
  sleep(2)
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Error Messages
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Then(/^I see BUMP caution symbol with GUARDIANS permission error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceMessage').should have_content('Please confirm you have permission before continuing')
  sleep(2)
end

When(/^I see BUMP caution symbol with invalid PIN error Message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Your PIN must be four digits long.')
  sleep(2)
end

When(/^I see BUMP caution symbol with age error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Please confirm your age before continuing')
  sleep(2)
end

When(/^I see BUMP caution symbol with incorrect PIN error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Wrong PIN. Please try again.')
  sleep(2)
end
