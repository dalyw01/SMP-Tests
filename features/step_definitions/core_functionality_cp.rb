Given(/^I am on a CP page with a HTML player$/) do
  visit('https://is.gd/nufoka')
end

When(/^I seek to end of programme$/) do
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( ( embeddedMedia.players[0].duration() - 2 ) );')
end

Then("I can see cp controlbar fade instantly when cursor hovers away") do
  page.find('.settings-player').hover  # Hovering over a different div on page to take focus off player
  sleep(1)
  within_frame 'smphtml5iframemp' do
    if page.driver.browser.browser == :chrome
      page.should have_no_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    end
    page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
  end
end

Then("I can enter fullscreen of CP") do
	within_frame 'smphtml5iframemp' do
	  page.first(".p_fullscreenButton").click
	end
end

Then("I can press X of CP") do
  within_frame 'smphtml5iframemp' do
    sleep(4)
    page.first(".gcp_closeSVG").click
  end
  sleep(5)
end

Then("I can press cancel of CP") do
  within_frame 'smphtml5iframemp' do
    sleep(4)
    page.first(".gcp_cancel").click
  end
  sleep(5)
end

Then("I can press cancel circle of CP") do
  within_frame 'smphtml5iframemp' do
    sleep(4)
    page.first(".gcp_spinnerCountdown_button").click
  end
  sleep(5)
end

Then("I can press mini CTA of CP") do
  within_frame 'smphtml5iframemp' do
    sleep(4)
    page.first(".gcp_itemCtaIcon").click
  end
  sleep(5)
end

Then("I can press thumbnail of CP") do
  within_frame 'smphtml5iframemp' do
    sleep(4)
    page.first(".gcp_itemImg").click
  end
  sleep(5)
end

# Then("I can press toggle") do
#   sleep(2)
#   within_frame 'smphtml5iframemp' do
#     page.first(".gcp_autoplayOnOffButton").hover
#     sleep(3)
#     page.first(".gcp_autoplayOnOffButton").click
#     sleep(2)
#     page.first(".gcp_toggleSlider round gcp_tick_transition").click
#     find('label', :text => 'gcp_toggle').click
#         # gcp_toggleSlider round gcp_tick_transition
#     # page.first(".gcp_tick").click
#   end
# end




