Given("I visit {string} with a {string} player") do |string, string2|
  visit(string)
end

When(/^I click CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".p_accessibleHitArea").click
    sleep(1)
  end
end

Then("I can see controlbar fade instantly when cursor hovers away if {string}") do |type|
  if type == "video" || type == "vertical" || type == "webcast" || type == "simulcast" || type == "360"
    page.find('.settings-player').hover  # Hovering over a different div on page to take focus off player
    sleep(1)
    within_frame 'smphtml5iframemp' do
      if page.driver.browser.browser == :chrome
        page.should have_no_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
      end
      page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
    end
  end
end

Then(/^I can play$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_playIcon").click
  end
end

Then(/^I can pause$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I can unmute$/) do
  within_frame 'smphtml5iframemp' do
    page.first(".p_volumeControls").click
    sleep(1)
  end
end

Then(/^I can click each volume bar$/) do
  within_frame 'smphtml5iframemp' do
    page.all(:css, '.p_volumeBar').each do |item|
      item.click
    end
  end
end

Then(/^I can mute$/) do
  within_frame 'smphtml5iframemp' do-
    sleep(1)
    page.first(".p_audioIcon").click
  end
end

Then("I can click seekbar unless {string}") do |type|
  within_frame 'smphtml5iframemp' do
    if type == "simulcast"
      # Need to look into why simulcast markers = seekbar
      page.first(".p_chapterMarker").click
      page.first(".p_chapterMarker").hover
    else
      page.first(".p_seekBar").click
      page.first(".p_seekBar").hover
    end
  end
end

Then("I can enter fullscreen if {string}") do |type|
  if type != "minimode"
    within_frame 'smphtml5iframemp' do
      sleep(2)
      page.first(".p_fullscreenButton").click
    end
  end
end

Then(/^I can enter fullscreen$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_fullscreenButton").click
  end
end

When(/^I can see controlbar$/) do
  within_frame 'smphtml5iframemp' do
    page.should have_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
  end
end

Then("I can click seekbar in fullscreen {string}") do |type|
  if type != "minimode"
    within_frame 'smphtml5iframemp' do
      sleep(1)
      page.first(".p_playerSeekBarHolder").click
      sleep(1)
      page.first(".p_playerSeekBarHolder").hover
    end
  end
end

Then("I can exit fullscreen if {string}") do |type|
  if type != "minimode"
    within_frame 'smphtml5iframemp' do
      page.first(".p_fullscreen-returnIcon").click
    end
  end
end

Then(/^I can seek in quarters to the end$/) do
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( ( embeddedMedia.players[0].duration() / 4 ) );')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( (( embeddedMedia.players[0].duration() / 4 ) * 2 ));')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( (( embeddedMedia.players[0].duration() / 4 ) * 3 ));')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( (( embeddedMedia.players[0].duration() - 3 )));')
  sleep(5)
end

Then("I can see controlbar when finished if {string}") do |type|
  if type != "minimode"
    within_frame 'smphtml5iframemp' do
      page.first(".p_playerControls").hover
      sleep(2)
    end
  end
end