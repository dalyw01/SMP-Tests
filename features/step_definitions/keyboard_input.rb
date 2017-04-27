When(/^I TAB$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:tab)
  sleep(1)
end

When(/^I press ENTER on CTA to begin playback$/) do
  sleep(1)
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I pause$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I resume$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I play$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I mute$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I unmute$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I fullscreen$/) do
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

When(/^I press UP arrow to seek forwards$/) do
  40.times do
    find(:id, 'smphtml5iframemedia_player').native.send_keys(:arrow_up)
  end
end

When(/^I press DOWN arrow to seek backwards$/) do
  40.times do
    find(:id, 'smphtml5iframemedia_player').native.send_keys(:arrow_down)
  end
end

When(/^I press RIGHT arrow to seek forwards$/) do
  40.times do
    find(:id, 'smphtml5iframemedia_player').native.send_keys(:arrow_right)
  end
end

When(/^I press LEFT arrow to seek backwards$/) do
  40.times do
    find(:id, 'smphtml5iframemedia_player').native.send_keys(:arrow_left)
  end
end
