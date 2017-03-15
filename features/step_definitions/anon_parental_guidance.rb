# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# NOTE : This steps definition file uses many of the same steps from u16 and o16
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Given(/^multiple anon HTML players with guidance and NO cookies$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_anon_players.html')
  sleep(2)
  page.driver.browser.manage.delete_all_cookies()
  sleep(2)
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_anon_players.html')
  # page.driver.browser.manage.window.resize_to( 700, 700 )
  sleep(1)
end

When(/^I see correct PG message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#guidanceText').should have_content('PG MESSAGE LARGE PLAYLIST')
    sleep(2)
  end
end

When(/^I see correct BUMP PG message$/) do
  sleep(1)
  find('#guidanceMessage').should have_content('PG MESSAGE SMALL PLAYLIST')
  sleep(2)
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

When(/^I see caution symbol with age error message$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_guidance-alertIcon').hover
    sleep(1)
    find('#guidanceMessage').should have_content('Please confirm your age before continuing')
    sleep(2)
  end
end

When(/^I enter the letters D A L Y to BUMP$/) do
  sleep(2)
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].hover
  all(:xpath, '//*[@id="pinEntryInputBox"]')[0].set("DALY")
  sleep(2)
end

When(/^I see BUMP caution symbol with invalid PIN error Message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Your PIN must be four digits long.')
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
