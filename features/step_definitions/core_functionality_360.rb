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
  2.times do
    page.driver.browser.action.send_keys(:tab).perform
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





