When(/^I click CTA to begin playback of 360 player$/) do
  within_frame 'smphtml5iframemp' do
    if page.first("div.p_accessibleHitArea").click
      sleep(3)
    else
      refresh()
      sleep(3)
      page.first("div.p_accessibleHitArea").click
    end
  end
end

Then(/^I click away$/) do
  page.first("#playlist_title").click
end

Then(/^I tab to compass$/) do
  1.times do
    page.driver.browser.action.send_keys(:tab).perform
    sleep(1)
  end
end

Then(/^I tab to controlbar$/) do
  if page.driver.browser.browser == :firefox
    4.times do
      page.driver.browser.action.send_keys(:tab).perform
    end
  else
    2.times do
      page.driver.browser.action.send_keys(:tab).perform
    end
  end
end

Then("I can enter fullscreen") do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_fullscreenButton").click
  end
end

Then("I check screen moves using buttons of compass") do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    img1 = page.save_screenshot('screenshot.png')
    sleep(1)
    page.first("#p_compass_right_touch").hover
    sleep(1)
    page.first("#p_compass_right_touch").touch_action(:press, hold: 700)
    page.first("#p_threeSixtyCanvas").hover
    sleep(1)
    img2 = page.save_screenshot('screenshot1.png')

    images = [
      ChunkyPNG::Image.from_file('screenshot.png'),
      ChunkyPNG::Image.from_file('screenshot1.png')
    ]

    diff = []

        images.first.height.times do |y|
        images.first.row(y).each_with_index do |pixel, x|
        diff << [x,y] unless pixel == images.last[x,y]
  end
end

  puts "pixels (total):     #{images.first.pixels.length}"
  puts "pixels changed:     #{diff.length}"
  puts "pixels changed (%): #{(diff.length.to_f / images.first.pixels.length) * 100}%"
  end
end

Then(/^I can press LEFT,RIGHT,UP,DOWN and ENTER keys on keyboard$/) do
  sleep(2)
  10.times do
    page.driver.browser.action.send_keys(:arrow_left).perform
  end
  10.times do
    page.driver.browser.action.send_keys(:arrow_right).perform
  end
  10.times do
    page.driver.browser.action.send_keys(:arrow_up).perform
  end
  10.times do
    page.driver.browser.action.send_keys(:arrow_down).perform
  end
  page.driver.browser.action.send_keys(:enter).perform
end

Then(/^I can click then hold LEFT,RIGHT,UP,DOWN and RESET on compass$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#p_compass_left_touch").hover
    sleep(1)
    page.first("#p_compass_left_touch").touch_action(:press, hold: 1000)
    sleep(1)
    page.first("#p_compass_right_touch").hover
    sleep(1)
    page.first("#p_compass_right_touch").touch_action(:press, hold: 1000)
    sleep(1)
    page.first("#p_compass_up_touch").hover
    sleep(1)
    page.first("#p_compass_up_touch").touch_action(:press, hold: 1000)
    sleep(1)
    page.first("#p_compass_down_touch").hover
    sleep(1)
    page.first("#p_compass_down_touch").touch_action(:press, hold: 1000)
    sleep(1)
    page.first("#p_compass_centre_touch").hover
    sleep(1)
    page.first("#p_compass_centre_touch").touch_action(:press, hold: 1000)
  end
end
