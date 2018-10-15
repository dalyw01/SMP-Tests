g_device    = ""
g_subs_flag = 0

Given("I visit {string} with a {string} player on {string}") do |new_page, new_type, new_device|
  visit( new_page )
  g_device = new_device
  sleep(1)
  if g_device == "phone"
    page.driver.browser.manage.window.resize_to( 300 , 1800 )
  elsif g_device == "tablet"
    page.driver.browser.manage.window.resize_to( 1000 , 1000 )
  else
    page.driver.browser.manage.window.resize_to( 1920 , 1080 )
  end
  # If webcast we need to set some data first for seekbar to show
  if new_type == "webcast"
    page.first("#setWebcastData").click
    sleep(1)
  end
  sleep(1)
end

Given(/^I visit an audio {string} with a {string} player on {string}$/) do |new_page, new_type, new_device|
  visit( new_page )
  page.execute_script('document.cookie="ckns_smpj2Beta=true";')
  refresh()
end

When(/^I accept BBC cookies$/) do
  # sleep(1)
  # if find_button("OK").visible?
  #   click_button( "OK" )
  #   sleep(1)
  # else
  #   puts "AM I GETTING IN HERE?"
  # end
  # if find_button("Yes, I agree").visible?
  #   click_button( "Yes, I agree" )
  # else
  #   puts "TEST TEST TEST TEST TEST"
  # end
  # sleep(1)
end

When(/^I click CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(3)
    page.first(".p_accessibleHitArea").click
    sleep(3)
  end
end

Then("I see controlbar hides instantly if {string}") do |type|
  if type != "audio" or type != "minimode"
    page.find('.settings-player').hover
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
    # Bug where smaller windows have mute icon disappearing
    if g_device == "desktop"
      sleep(1)
      page.first(".p_volumeButton").click
    end
  end
end

Then(/^I can unmute$/) do
  within_frame 'smphtml5iframemp' do
    # Bug where smaller windows have mute icon disappearing
    if g_device == "desktop"
      sleep(1)
      page.first(".p_volumeButton").click
    end
  end
end

Then("I can click each volume bar") do
  within_frame 'smphtml5iframemp' do
    page.all(:css, '.p_volumeBar').each do |item|
      item.click
    end
  end
end

Then("I can enter fullscreen if {string}") do |type|
  if type != "audio" and type != "minimode"
    within_frame 'smphtml5iframemp' do
      sleep(2)
      page.first(".p_fullscreenButton").click
    end
  end
end

Then("I can exit fullscreen if {string}") do |type|
  if type != "audio" and type != "minimode"
    within_frame 'smphtml5iframemp' do
      page.first(".p_fullscreen-returnIcon").click
    end
    sleep(1)
  end
end

Then("I can see controlbar") do
  within_frame 'smphtml5iframemp' do
    page.first(".notInteractiveContent").hover # Need this here or proceedings command don't work
  end
end

Then("I can interact with subtitles panel if {string}") do |type|
  within_frame 'smphtml5iframemp' do
    if type == "ident + vod + subs"

      # Click SUBS button to see current status
      page.first(".p_subtitleButton").click
      sleep(1)

      # If subs are OFF
      if g_subs_flag == 0
        if g_device == "phone"
          # On phone we expect turning subs ON to have largest size by default
          expect(page.find('button#p_subtitleSizeButton_useLargestFontSize')['aria-pressed']).to eq("true")
        else
          # Else tablet or desktop turning subs ON should give us medium by default
          expect(page.find('button#p_subtitleSizeButton_useMediumFontSize')['aria-pressed']).to eq("true")
        end
      # Else if they are already ON
      elsif g_subs_flag == 1
        # They should be largest size as I set it to that last
        expect(page.find('button#p_subtitleSizeButton_useLargestFontSize')['aria-pressed']).to eq("true")
      end

      # Turn OFF subs
      sleep(1)
      page.first(".p_subsToggle").click

      # Turn ON subs + select SIZES + validate size
      sleep(1)
      page.first(".p_subtitleButton").click
      sleep(1)
      page.first("#p_subtitleSizeButton_useSmallestFontSize").click
      expect(page.find('button#p_subtitleSizeButton_useSmallestFontSize')['aria-pressed']).to eq("true")
      sleep(2)
      page.first("#p_subtitleSizeButton_useSmallFontSize").click
      expect(page.find('button#p_subtitleSizeButton_useSmallFontSize')['aria-pressed']).to eq("true")
      sleep(2)
      page.first("#p_subtitleSizeButton_useMediumFontSize").click
      expect(page.find('button#p_subtitleSizeButton_useMediumFontSize')['aria-pressed']).to eq("true")
      sleep(2)
      page.first("#p_subtitleSizeButton_useLargeFontSize").click
      expect(page.find('button#p_subtitleSizeButton_useLargeFontSize')['aria-pressed']).to eq("true")
      sleep(2)
      page.first("#p_subtitleSizeButton_useLargestFontSize").click
      expect(page.find('button#p_subtitleSizeButton_useLargestFontSize')['aria-pressed']).to eq("true")
      g_subs_flag = 1
    end
  end
end

Then("I can click seekbar unless {string}") do |type|
  within_frame 'smphtml5iframemp' do
    if (type == "simulcast" and g_device == "tablet") or (type == "simulcast" and g_device == "desktop") 
      page.first(".p_chapterMarker").click
      page.first(".p_chapterMarker").hover
    elsif type == "simulcast" and g_device == "phone"
      page.should have_no_selector(".p_chapterMarker")
      page.first(".p_progressBar").click
      page.first(".p_progressBar").hover
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
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime(( embeddedMedia.players[0].duration() / 4 ) );')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime((( embeddedMedia.players[0].duration() / 4 ) * 2 ));')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime((( embeddedMedia.players[0].duration() / 4 ) * 3 ));')
  sleep(2)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime((( embeddedMedia.players[0].duration() - 3 )));')
  sleep(5)
end

# used in core_functionality_cp_news.feature
Then(/^I can see guidance$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
  end
end

# Weird behaviour in FULLSCREEN where I cannot focus on player when going from one item to the next if guidance present
Then(/^I can resume past News blocking guidance in {string}$/) do |mode|
  within_frame 'smphtml5iframemp' do
    sleep(1)
    if mode == "Inline"
      page.first(".p_accessibleHitArea").click
    end
    sleep(2)
  end
end


