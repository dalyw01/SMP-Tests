When(/^I click phantom CTA to begin playback$/) do
	sleep(3)
	page.first(".p_cta").click
    sleep(2)
    # If its the video player we need to re-focus on player after pressing CTA, Jim made a change!
    if page.has_css?('#p_v_player_0') == true
      find('#p_v_player_0').hover
    end
end

When("I click phantom LOGIN button from pop up") do
	sleep(1)
  	page.first(".loginButton").click
end