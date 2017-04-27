Given(/^I am on a page with a HTML player$/) do
 visit( 'http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/clean_html.html')
end

When(/^I click on CTA to begin playback$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

Then(/^I should be able to pause$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^play$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_playIcon").click
  end
end

Then(/^unmute player$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.first(".p_volumeControls").click
    sleep(1)
  end
end

Then(/^click each volume bar$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.all(:css, '.p_volumeBar').each do |item|
      item.click
    end
  end
end

Then(/^mute again$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_audioIcon").click
  end
end

Then(/^click seekbar$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_seekBar").click
    sleep(2)
    page.first(".p_seekBar").hover
  end
end

Then(/^verify thumbnail appears$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.first(".p_thumbnail").hover
    sleep(2)
  end
end

Then(/^press right-key$/) do
  within_frame 'smphtml5iframemedia_player' do
    find(:id, 'smpj2ooiframemedia_player').native.send_keys(:tab)
    sleep(1)
    find(:id, 'smpj2ooiframemedia_player').native.send_keys(:arrow_right)
  end
end


Then(/^enter full\-screen$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_fullscreenButton").click
  end
end

Then(/^verify previous inputs work$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_pauseIcon").click
    sleep(2)
    page.first(".p_playIcon").click
    sleep(2)
    page.first(".p_volumeControls").click # Un-Mutes the player again
    sleep(2)
    page.all(:css, '.p_volumeBar').each do |item|
      item.click
    end
    sleep(2)
    page.first(".p_volumeControls").click # Un-Mutes the player again, however weird bug in full-screen where it outs volume to appx 3
    sleep(2)
  end
end

Then(/^exit full\-screen$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.first(".p_fullscreen-returnIcon").click
  end
end

Then(/^seek in quarters to the end$/) do
  duration = page.execute_script( 'mediaPlayer.currentTime( ( mediaPlayer.duration() / 4 ) );')
  sleep(2)
  duration = page.execute_script( 'mediaPlayer.currentTime( (( mediaPlayer.duration() / 4 ) * 2 ));')
  sleep(2)
  duration = page.execute_script( 'mediaPlayer.currentTime( (( mediaPlayer.duration() / 4 ) * 3 ));')
  sleep(2)
  duration = page.execute_script( 'mediaPlayer.currentTime( ( mediaPlayer.duration() - 3 ));')
  sleep(5)
end

Then(/^be prompted with a clickable CTA again$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.first(".p_ctaIcon").click
    sleep(2)
  end
end
