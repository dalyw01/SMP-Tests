Given(/^I am page with the HTML player and CP plugin$/) do
  visit('https://is.gd/nufoka')
end

When(/^I seek to end of programme$/) do
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( ( embeddedMedia.players[0].duration() - 2 ) );')
end

Then("CP controlbar fades when I hover away") do
  page.find('.settings-player').hover  # Hovering away + take focus off player
  sleep(1)
  within_frame "smphtml5iframemp" do
    if page.driver.browser.browser == :chrome
      page.should have_no_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    end
    page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
  end
end

Then("I enter fullscreen of CP") do
	within_frame "smphtml5iframemp" do
	  page.first(".p_fullscreenButton").click
	end
end

Then(/^I can replay$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_playIcon").click
    sleep(1)
  end
end

Then("I press X of CP") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    page.first(".gcp_closeSVG").click
  end
  sleep(5)
end

Then("I press cancel of CP") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    page.first(".gcp_cancel").click
  end
  sleep(5)
end

Then("I press cancel circle of CP") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    page.first(".gcp_spinnerCountdown_button").click
  end
  sleep(5)
end

Then("I press mini CTA of CP") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    page.first(".gcp_itemCtaIcon").click
  end
  sleep(5)
end

Then("I press mini thumbnail of CP") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    page.first(".gcp_itemImg").click
  end
  sleep(5)
end

When("I use core functionality of SMP") do
  within_frame "smphtml5iframemp" do
    sleep(2)
    page.first(".p_pauseIcon").click
    sleep(2)
    page.first(".p_playIcon").click
    sleep(2)
    page.first(".p_audioIcon").click
    sleep(2)
    page.first(".p_muteIcon").click
    sleep(2)
  end
end

Then("I toggle CP OFF") do
  sleep(2)
  within_frame "smphtml5iframemp" do
    page.first(".gcp_autoplayOnOffButton").hover
    page.first(".gcp_autoplayOnOffButton").click
    sleep(1)
    click_button("Autoplay next item is turned on, to turn off click button")
    sleep(1)    
  end
end

Then("CP shows") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    puts expect(page).to have_css(".gcp_closeSVG")
    expect(page).to have_css(".gcp_closeSVG")
    expect(page).to have_css(".gcp_cancel")
    expect(page).to have_css(".gcp_spinnerCountdown_button")
    expect(page).to have_css(".gcp_itemCtaIcon")
    expect(page).to have_css(".gcp_itemImg")
  end
end

Then("CP does NOT show") do
  within_frame "smphtml5iframemp" do
    sleep(4)
    puts expect(page).to have_no_css(".gcp_closeSVG")
    expect(page).to have_no_css(".gcp_closeSVG")
    expect(page).to have_no_css(".gcp_cancel")
    expect(page).to have_no_css(".gcp_spinnerCountdown_button")
    expect(page).to have_no_css(".gcp_itemCtaIcon")
    expect(page).to have_no_css(".gcp_itemImg")
  end
end



