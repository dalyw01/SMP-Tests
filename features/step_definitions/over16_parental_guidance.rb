# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# GENERAL STEP(S)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Given(/^multiple o16 HTML players with guidance and NO cookies$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_over16_players.html')
  sleep(2)
  page.driver.browser.manage.delete_all_cookies()
  sleep(2)
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_over16_players.html')
  # page.driver.browser.manage.window.resize_to( 700, 700 )
  sleep(1)
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

When(/^I click o16 large CTA$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_ctaIcon").click
  end
end

When(/^I click o16 large LOCK icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_padlock-lockedIcon").click
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

When(/^I am presented with a text field$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pinEntry").click
  end
end

When(/^I enter multiple one values$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    all(:xpath, '//*[@id="pinEntry"]/input')[0].click
    sleep(3)
    all(:xpath, '//*[@id="pinEntry"]/input')[0].set("1111")
    sleep(3)
  end
end

When(/^I press \[Play\] to set new PIN$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pgActivate").click
  end
end

When(/^I dismiss o16 pop\-up pressing X icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    find('.p_gel-exitLinkIcon').click
  end
end

Then(/^large player playback should initialize$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^padlock should be unlocked on large player$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# BUMP GUIDANCE STEPS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I click o16 small CTA$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_ctaIcon").click
  end
end

When(/^I click o16 small LOCK icon$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-lockedIcon").click
  end
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

When(/^I am presented with a BUMP text field$/) do
  sleep(2)
  page.first("#pinEntryInputBox").hover
  sleep(2)
end

When(/^I enter multiple one values to BUMP$/) do
  sleep(2)
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("1111")
  sleep(2)
end

When(/^I press BUMP \[Play\] to set new PIN$/) do
  sleep(2)
  all(:xpath, '//*[@id="pgActivate"]')[0].click
end

When(/^I press BUMP \[Play\] to unlock$/) do
  sleep(2)
  all(:xpath, '//*[@id="pgTurnOff"]')[0].click
end

When(/^I dismiss o16 BUMP pop\-up pressing X icon$/) do
  find('#pgExit').hover
  sleep(2)
  find('#pgExit').click
end

Then(/^small player playback should initialize$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^padlock should be unlocked on small player$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
end
