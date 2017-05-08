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

Given(/^an o16 HTML player with guidance$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_over16_players.html')
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

Then(/^padlock should be unlocked on small player$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
end

Then(/^padlock should be unlocked on large player$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-unlockedIcon").hover
  end
end

When(/^I click o16 large LOCKED icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first(".p_padlock-lockedIcon").click
  end
end

When(/^I click o16 small LOCKED icon$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(2)
    page.first(".p_padlock-lockedIcon").click
  end
end
