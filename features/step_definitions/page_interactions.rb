cookie_flag = 0

When(/^I check if cookies appears$/) do
	if cookie_flag == 0
		sleep(2)
 		page.first("#bbccookies-continue-button").click
 		sleep(1)
 		cookie_flag = cookie_flag+1
   	end
end


Then("I verify low option has been selected") do
	find( "p_settingsSubtitle" , text: "Low" )
    sleep(2)
end

      



Then("I verify low option has been selected") do
  within_frame 'smphtml5iframemp' do
    if p_settingsSubtitle == "Low"
      # Click SUBS button to see current status + turn s
        sleep(1)
        page.first(".p_playbackSettingsButton").click
        sleep(1)
        page.first("#p_qualityTitle").click

      if page.driver.browser.browser == :chrome
        # Chrome needs an additional press for some reason
        sleep(1)
        page.first(".p_subsToggle").click
        sleep(1)
        page.first(".p_subtitleButton").click
      end

        sleep(1)
      page.first("#p_button.p_controlBarButton.p_playbackSettingsButton.p_dontCloseSettingsPanel_p_qualityTitle_p_settingsSubtitle").click
      sleep(1)
      expect(page.find('button#p_button.p_controlBarButton.p_playbackSettingsButton.p_dontCloseSettingsPanel_p_qualityTitle_p_settingsSubtitle')['p_settingsSubtitle']).to eq("Low Quality")
      sleep(1)
      