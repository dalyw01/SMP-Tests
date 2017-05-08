When(/^I click CTA$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

Then(/^large player playback should initialize$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I should be able to restart playback without another pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end

When(/^I seek to end$/) do
  sleep(5) # Wait for ident to finish
  page.execute_script( 'mediaPlayer1.currentTime(( mediaPlayer1.duration() - 2 ));')
  sleep(4)
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Initial checks and actions with PG pop-up
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I see correct PG message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#guidanceText').should have_content('PG MESSAGE LARGE PLAYLIST')
    sleep(2)
  end
end

When(/^I tick checkbox$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#ageConfirmCheck').click
  end
end

When(/^I dismiss o16 pop\-up pressing X icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    find('.p_gel-exitLinkIcon').click
  end
end

Then(/^I should be able to dismiss pop\-up pressing X icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_gel-exitLinkIcon').click
  end
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Buttons in PG pop-up
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I press \[Play\] button to proceed through u16$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

When(/^I press \[Play Without PG Lock\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#toolTipPlay").click
  end
end

When(/^I press \[Turn On PG Lock\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pgTurnOn").click
  end
end

When(/^I press \[Play\] to unlock$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgTurnOff').click
    sleep(2)
  end
end

When(/^I press \[Play\] to set new PIN$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pgActivate").click
  end
end

When(/^I press \[Continue\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

Then(/^I should be able to press \[Play\] button again$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Entering Data for PG PIN
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I am presented with a text field$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pinEntry").click
  end
end

When(/^I enter 1 1 1 1$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    all(:xpath, '//*[@id="pinEntry"]/input')[0].click
    sleep(3)
    all(:xpath, '//*[@id="pinEntry"]/input')[0].set("1111")
    sleep(3)
  end
end

When(/^I enter D A L Y$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    all(:xpath, '//*[@id="pinEntry"]/input')[0].click
    sleep(3)
    all(:xpath, '//*[@id="pinEntry"]/input')[0].set("DALY")
    sleep(3)
  end
end

#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Error Messages
#  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I see caution symbol with GUARDIANS permission error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceMessage').should have_content('Please confirm you have permission before continuing')
    sleep(2)
  end
end

When(/^I see caution symbol with invalid PIN error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceBody').should have_content('Your PIN must be four digits long.')
    sleep(2)
  end
end

When(/^I see caution symbol with age error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceMessage').should have_content('Please confirm your age before continuing')
    sleep(2)
  end
end

When(/^I see caution symbol with incorrect PIN error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceBody').should have_content('Wrong PIN. Please try again.')
    sleep(2)
  end
end
