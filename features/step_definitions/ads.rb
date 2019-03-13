When(/^I click ADS CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first("div.p_accessibleHitArea").click
    sleep(1)
  end
end

When(/^I can see AD controlbar$/) do
  sleep 3
  within_frame 'smphtml5iframemp' do
    page.first("#ads_buttonBar").click
  end
end

When("I load skippable ads page") do
  page.find("div#content input#adType-skippable").click
  page.find("button#loadAdButton").click
end

Then("I find Skip Add option") do
  sleep 3
  within_frame 'smphtml5iframemp' do
    sleep 2
    within_frame (page.find('iframe[width]')) do
      page.first("div.videoAdUi.imaVideoAdUi")
      expect(page.find("div.videoAdUiSkipContainer.html5-stop-propagation").visible?).to be true
    end
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
