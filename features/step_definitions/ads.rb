When(/^I click ADS CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    if page.first(".p_iconHolder").click
      sleep(1)
      page.first(".p_iconHolder").click
      sleep(1)
    else
      # Refresh page since cookbook is being annoying
      refresh()
      sleep(1)
      page.first(".p_iconHolder").click      
    end
  end
end

When(/^I can see AD controlbar$/) do
  within_frame 'smphtml5iframemp' do
    page.first("#ads_buttonBar").click
    # page.should have_selector(:xpath, '//*[@id="ads_buttonBar"]')
  end
end

Then(/^I can AD pause$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".ads_pauseButton").click
  end
end

Then(/^I can AD play$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".ads_playButton").click
  end
end

Then(/^I can wait for AD to finish$/) do
   sleep(10)
end