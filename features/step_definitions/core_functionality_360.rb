Given(/^I am on a page with a 360 player$/) do
 visit( 'https://is.gd/qigiqu' )
end

Then(/^I click away$/) do
    page.first("#playlist_title").click
end

# When(/^I hover over controlbar area$/) do
#   page.first(".p_accessibleHitArea").click
# end

Then(/^I tab to compass$/) do
  5.times do
    page.driver.browser.action.send_keys(:tab).perform
    sleep(1)
  end
end

Then(/^I tab to controlbar$/) do
  page.driver.browser.action.send_keys(:tab).perform
  sleep(1)
end

Then(/^I can press LEFT key$/) do
  10.times do
    page.driver.browser.action.send_keys(:arrow_left).perform
  end
end

Then(/^I can press RIGHT key$/) do
  10.times do
    page.driver.browser.action.send_keys(:arrow_right).perform
  end
end

Then(/^I can press UP key$/) do
  10.times do
    page.driver.browser.action.send_keys(:arrow_up).perform
  end
end

Then(/^I can press DOWN key$/) do
  10.times do
    page.driver.browser.action.send_keys(:arrow_down).perform
  end
end

Then(/^I can press ENTER key$/) do
  page.driver.browser.action.send_keys(:enter).perform
end

Then(/^I can click then hold left arrow$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#p_compass_left_touch").hover
    sleep(1)
    page.first("#p_compass_left_touch").touch_action(:press, hold: 1000)
  end
end

Then(/^I can click then hold right arrow$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#p_compass_right_touch").hover
    sleep(1)
    page.first("#p_compass_right_touch").touch_action(:press, hold: 1000)
  end
end

Then(/^I can click then hold up arrow$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#p_compass_up_touch").hover
    sleep(1)
    page.first("#p_compass_up_touch").touch_action(:press, hold: 1000)
  end
end

Then(/^I can click then hold down arrow$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#p_compass_down_touch").hover
    sleep(1)
    page.first("#p_compass_down_touch").touch_action(:press, hold: 1000)
  end
end

Then(/^I can click RESET$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#p_compass_centre_touch").hover
    sleep(1)
    page.first("#p_compass_centre_touch").touch_action(:press, hold: 1000)
  end
end