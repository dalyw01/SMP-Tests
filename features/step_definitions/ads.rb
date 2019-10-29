When(/^I click ADS CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first("div.p_accessibleHitArea").click
    sleep(3)
  end
end

When("I load skippable ads by clicking html button") do
  page.find("div#content input#adType-skippable").click
  page.find("button#loadAdButton").click
end

When(/^I enter AD fullscreen if "([^"]*)"$/) do |mode|
  sleep(1)
  if mode == "Fullscreen"
    within_frame 'smphtml5iframemp' do
      sleep(1)
      page.first("#ads_buttonBar").click
      page.first(".ads_enterFullScreenButton").hover
      page.first(".ads_enterFullScreenButton").click
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
 sleep(13)
   within_frame 'smphtml5iframemp' do
      if page.has_css?('#p_v_player_0') == true
        find('#p_v_player_0').hover
      end
  end
end

Then("I can click skip AD option") do
  sleep(1)
  within_frame 'smphtml5iframemp' do
    within_frame (page.find('iframe[width]')) do
      page.first(".videoAdUiSkipButton").click
    end
    if page.has_css?('#p_v_player_0') == true
      find('#p_v_player_0').hover
    end
  end
end

Then("I can find no ADS when I replay the content") do
  within_frame 'smphtml5iframemp' do
    if page.first("div.p_accessibleHitArea").click
      sleep(3)
      page.first("div.p_accessibleHitArea").click
      sleep(1)
    end
    begin
      sleep(2)
      page.find("#ads_buttonBar").visible?
    rescue Capybara::ElementNotFound
      true
    end
  end
end