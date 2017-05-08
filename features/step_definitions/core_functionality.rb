Given(/^I am on a page with a HTML player$/) do
 visit( 'http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/clean_html.html')
end

When(/^I click on CTA to begin playback$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

Then(/^I can pause$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_pauseIcon").click
  end
end

Then(/^I can verify controlbar fades instantly$/) do
  page.find('body').click
  sleep(1)
  within_frame 'smphtml5iframemedia_player' do
    page.should have_no_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    page.first(".mediaContainer").click # Need this here or proceedings command don't work
  end
end

Then(/^I can play$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_playIcon").click
  end
end

Then(/^I can unmute player$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.first(".p_volumeControls").click
    sleep(1)
  end
end

Then(/^I can click each volume bar$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.all(:css, '.p_volumeBar').each do |item|
      item.click
    end
  end
end

Then(/^I can mute$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_audioIcon").click
  end
end

Then(/^I can click seekbar$/) do
  within_frame 'smphtml5iframemedia_player' do
    sleep(2)
    page.first(".p_seekBar").click
    sleep(2)
    page.first(".p_seekBar").hover
  end
end

Then(/^I can see thumbnails$/) do
  within_frame 'smphtml5iframemedia_player' do
    page.first(".p_thumbnail").hover
    sleep(2)
  end
end

Then(/^I can press right-key$/) do
  within_frame 'smphtml5iframemedia_player' do
    find(:id, 'smpj2ooiframemedia_player').native.send_keys(:tab)
    sleep(1)
    find(:id, 'smpj2ooiframemedia_player').native.send_keys(:arrow_right)
  end
end

Then(/^I can enter full\-screen$/) do
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

Then(/^I can seek in quarters to the end$/) do
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

Then(/^I can restart by clicking anywhere hitbox$/) do
  sleep(2)
  page.find('body').click
end

Then(/^ensure control\-bar is visible when done$/) do
  # Write code here that turns the phrase above into concrete actions
end
