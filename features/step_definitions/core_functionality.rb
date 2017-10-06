Given(/^I am on a page with a HTML player$/) do
 visit( 'https://is.gd/ovigot')
end

When(/^I click on CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".p_accessibleHitArea").click # I have to comment this out to work with 360 player, there's a bug!
    sleep(1)
  end
end

Then(/^I can pause$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I can see controlbar fade instantly when cursor hovers away$/) do
  page.find('.settings-player').hover  # Hovering over a different div on page to take focus off player
  sleep(1)
  within_frame 'smphtml5iframemp' do
    page.should have_no_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
  end
end

Then(/^I can play$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_playIcon").click
  end
end

Then(/^I can unmute player$/) do
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

Then(/^I can click seekbar$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_seekBar").click
    sleep(2)
    page.first(".p_seekBar").hover
  end
end

Then(/^I can see thumbnails$/) do
  within_frame 'smphtml5iframemp' do
    page.first(".p_thumbnail").hover
    sleep(2)
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

Then(/^I can click seekbar in fullscreen$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_playerSeekBarHolder").click
    sleep(2)
    page.first(".p_playerSeekBarHolder").hover
  end
end

Then(/^I can exit fullscreen$/) do
  within_frame 'smphtml5iframemp' do
    page.first(".p_fullscreen-returnIcon").click
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

Then(/^I can see controlbar when finished$/) do
  within_frame 'smphtml5iframemp' do
    page.first(".p_playerControls").hover
    sleep(2)
  end
end

Then(/^I can hover over a visible CTA again$/) do
  within_frame 'smphtml5iframemp' do
    page.first(".p_ctaIcon").hover # Just want to detect its there
    sleep(2)
  end
end

Then(/^I can restart by clicking anywhere in player hitbox$/) do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    page.first(".displayCover").click
  end
end