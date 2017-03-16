When(/^I visit an under16 page as a child$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_under16_players.html')
  sleep(2)
end

When(/^I press \[Play\] to unlock$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(2)
    page.first("#pgTurnOff").click
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

When(/^I see BUMP caution symbol with incorrect PIN error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceBody').should have_content('Wrong PIN. Please try again.')
  sleep(2)
end
