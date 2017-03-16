Given(/^multiple anon HTML players with guidance and NO cookies$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_anon_players.html')
  sleep(2)
  page.driver.browser.manage.delete_all_cookies()
  sleep(2)
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_anon_players.html')
  sleep(1)
end

Given(/^multiple o16 HTML players with guidance and NO cookies$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_over16_players.html')
  sleep(2)
  page.driver.browser.manage.delete_all_cookies()
  sleep(2)
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_over16_players.html')
  sleep(1)
end

Given(/^an u16 HTML player with guidance$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_under16_players.html')
  sleep(2)
end

Then(/^padlock should be unlocked on both players$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# INPLAYER GUIDANCE STEPS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I click CTA$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^I see correct PG message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#guidanceText').should have_content('PG MESSAGE LARGE PLAYLIST')
    sleep(2)
  end
end

Then(/^I should be able to dismiss pop\-up pressing X icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_gel-exitLinkIcon').click
  end
end

Then(/^I should be able to press Play button again$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

When(/^I tick checkbox$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#ageConfirmCheck').click
  end
end

When(/^I press \[Play\] button$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

When(/^I press \[Play\] to unlock$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pgTurnOff").click
  end
end

When(/^I seek to end$/) do
  sleep(5) # Wait for ident to finish
  page.execute_script( 'mediaPlayer1.currentTime(( mediaPlayer1.duration() - 2 ));')
  sleep(4)
end

When(/^I enter the letters D A L Y$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    all(:xpath, '//*[@id="pinEntry"]/input')[0].click
    sleep(3)
    all(:xpath, '//*[@id="pinEntry"]/input')[0].set("DALY")
    sleep(3)
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

When(/^I see caution symbol with incorrect PIN error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceBody').should have_content('Wrong PIN. Please try again.')
    sleep(2)
  end
end

When(/^I see caution symbol with permissions error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceMessage').should have_content('Please confirm you have permission before continuing')
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

Then(/^I should be able to restart playback without another pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end

Then(/^padlock should be unlocked on small player$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# BUMP GUIDANCE STEPS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


When(/^I enter the letters D A L Y to BUMP$/) do
  sleep(2)
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("DALY")
  sleep(2)
end

When(/^I see BUMP caution symbol with age error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Please confirm your age before continuing')
  sleep(2)
end

When(/^I see BUMP caution symbol with invalid PIN error Message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Your PIN must be four digits long.')
  sleep(2)
end

When(/^I see BUMP caution symbol with incorrect PIN error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Wrong PIN. Please try again.')
  sleep(2)
end


When(/^I press \[Continue\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

When(/^I press BUMP \[Continue\]$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end


When(/^I see correct BUMP PG message$/) do
  sleep(1)
  find('#guidanceMessage').should have_content('PG MESSAGE SMALL PLAYLIST')
  sleep(2)
end
