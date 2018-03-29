Given("I visit {string} with a {string} player") do | new_page, new_player |
  visit( new_page )
end

When(/^I click CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".p_accessibleHitArea").click
    sleep(1)
  end
end

Then("I see controlbar hides instantly if {string}") do |type|
  if type != "audio" or type != "minimode"
    page.find('.column-right').hover
    sleep(1)
    within_frame 'smphtml5iframemp' do
      page.first(".p_accessibleHitArea").hover 
    end
  end
end

Then(/^I can pause$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I can play$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".p_playIcon").click
  end
end

Then(/^I can mute$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".p_volumeButton").click
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

Then("I can enter fullscreen if {string}") do |type|
  if type != "minimode"
    within_frame 'smphtml5iframemp' do
      sleep(2)
      page.first(".p_fullscreenButton").click
    end
  end
end

# Used in 360 player
Then(/^I can enter fullscreen$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_fullscreenButton").click
  end
end

Then("I can exit fullscreen if {string}") do |type|
  if type != "minimode"
    within_frame 'smphtml5iframemp' do
      page.first(".p_fullscreen-returnIcon").click
    end
    sleep(1)
  end
end

When(/^I can see controlbar$/) do
  within_frame 'smphtml5iframemp' do
    page.should have_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
  end
end

Then("I can interact with subtitles panel if present") do
  within_frame 'smphtml5iframemp' do
    if page.first(".p_subtitleButton")

      # Turn ON subs
      sleep(1)
      page.first(".p_subtitleButton").click

      # Check middle font are default for this size device
      sleep(1)
      expect(page.find('button#p_subtitleSizeButton_useMediumFontSize')['aria-pressed']).to eq("true")

      # Turn OFF subs
      sleep(1)
      page.first(".p_subsToggle").click

      # Turn ON subs + select SIZES
      sleep(1)
      page.first(".p_subtitleButton").click
      sleep(1)
      page.first("#p_subtitleSizeButton_useSmallestFontSize").click
      sleep(2)
      page.first("#p_subtitleSizeButton_useSmallFontSize").click
      sleep(2)
      page.first("#p_subtitleSizeButton_useMediumFontSize").click
      sleep(2)
      page.first("#p_subtitleSizeButton_useLargeFontSize").click
      sleep(2)
      page.first("#p_subtitleSizeButton_useLargestFontSize").click
      
      # Turning back to middle subs for FULLSCREEN step
      sleep(2)
      page.first("#p_subtitleSizeButton_useMediumFontSize").click
    end
  end
end

Then("I can click seekbar unless {string}") do |type|
  within_frame 'smphtml5iframemp' do
    if type == "simulcast"
      # Need to look into why simulcast markers = seekbar
      page.first(".p_chapterMarker").click
      page.first(".p_chapterMarker").hover
    elsif type == "webcast"
      page.first(".p_progressBar").click
      page.first(".p_progressBar").hover
    else
      page.first(".p_seekBar").click
      page.first(".p_seekBar").hover
    end
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