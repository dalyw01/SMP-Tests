# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# GENERAL STEP(S)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Given(/^multiple over sixteen HTML players with guidance$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_over16_players.html')
  sleep(2)
end

Then(/^the padlock should be unlocked on both players$/) do
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

When(/^I click over sixteen CTA$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^I press \[Turn On PG Lock\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first("#pgTurnOn").click
  end
end

When(/^I press \[Play Without PG Lock\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first("#toolTipPlay").click
  end
end

When(/^I am presented with a text field$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
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

When(/^I press \[Play\]$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first("#pgActivate").click
  end
end

Then(/^playback should initiliase$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I should be able to dismiss over sixteen pop\-up pressing X icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_gel-exitLinkIcon').click
  end
end

Then(/^I should be able to restart playback without another over sixteen pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I should be able to initialise playback on BUMP player after unlocking padlock$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("1111")
  sleep(2)
  all(:xpath, '//*[@id="pgTurnOff"]')[0].click
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# BUMP GUIDANCE STEPS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I click over sixteen small CTA$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^I press BUMP \[Play Without PG Lock\]$/) do
  sleep(2)
  page.first("#toolTipPlay").click
end

When(/^I press BUMP \[Turn On PG Lock\]$/) do
  sleep(2)
  page.first("#pgTurnOn").click
end

When(/^I am presented with a BUMP text field$/) do
  sleep(2)
  page.first("#pinEntryInputBox").hover
  sleep(2)
end

When(/^I enter multiple one values to BUMP$/) do
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("1111")
  sleep(2)
end

When(/^I press BUMP \[Play\]$/) do
  all(:xpath, '//*[@id="pgActivate"]')[0].click
end

Then(/^I should be able to initialise playback on inplayer player after unlocking padlock$/) do
  # Write code here that turns the phrase above into concrete actions
end

Then(/^small player playback should initiliase$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I should be able to dismiss over sixteen BUMP pop\-up pressing X icon$/) do
  find('#pgExit').hover
  sleep(1)
  find('#pgExit').click
end

Then(/^I should be able to restart playback without another BUMP over sixteen pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end
