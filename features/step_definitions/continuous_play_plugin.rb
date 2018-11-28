Given(/^I am on a page with the HTML player and CP plugin installed$/) do
  visit('https://is.gd/vakule') # Lock to stage
  sleep(10)
end

Given(/^I am on a page with the News HTML player and CP plugin installed$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/cp_news_guidance_block.html') 
end

When("I press alwaysShowCarouselButton then page reloads") do
  page.first(" #alwaysShowCarouselButtonContainerButton").click
  sleep(2)
end

When(/^I seek to end of programme$/) do
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( ( embeddedMedia.players[0].duration() - 2 ) );')
end

When(/^I use core functionality of SMP$/) do
  within_frame "smphtml5iframemp" do
    sleep(1)
    page.first(".p_pauseIcon").click
    sleep(1)
    page.first(".p_playIcon").click
    sleep(2)
    page.first(".p_audioIcon").click
    sleep(2)
    page.first(".p_muteIcon").click
    sleep(2)
  end
end

Then(/^I move my cursor away$/) do
  page.find('.settings-player').hover  # Hovering away + take focus off player
  sleep(1)
  within_frame "smphtml5iframemp" do
    if page.driver.browser.browser == :chrome
      page.should have_no_selector(:xpath, '//*[@id="mediaContainer"]/div[7]')
    end
    page.first(".p_accessibleHitArea").hover # Need this here or proceedings command don't work
  end
end

Then(/^I can replay current programme$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_playIcon").click
    sleep(1)
  end
end

Then("I can pause new programme if {string}") do |string|
  if string == "Mini Thumbnail" or string == "Mini CTA"
   within_frame 'smphtml5iframemp' do
      sleep(3)
      page.first(".p_pauseIcon").click
      sleep(2)
    end
  end
end

Then(/^I wait for countdown to finish$/) do
  sleep(12)
end

Then(/^I scroll through whole carousel and select the last item$/) do
  within_frame "smphtml5iframemp" do
    sleep(4)
    28.times do
      page.first(".gcp_carouselControlsNext").click
    end
    28.times do
      page.first(".gcp_carouselControlsPrevious").click
    end
    32.times do
      page.first(".gcp_carouselControlsNext").click
    end
    sleep(5)
  end
end

Then(/^I toggle CPP OFF$/) do
  within_frame "smphtml5iframemp" do
    page.first(".p_playbackSettingsButton").hover
    page.first(".p_playbackSettingsButton").click
    sleep(1)
    # If toggle is ON
    if page.find('div#p_autoplayToggle')['aria-checked'].strip == "true"
      page.first(".p_toggle").click
    end
  end
end

Then(/^CPP shows$/) do
  within_frame "smphtml5iframemp" do
    sleep(4)
    expect(page).to have_css(".gcp_closeSVG")
    expect(page).to have_css(".gcp_cancel")
    expect(page).to have_css(".gcp_spinnerCountdown_button")
    expect(page).to have_css(".gcp_itemCtaIcon")
    expect(page).to have_css(".gcp_itemImg")
    # expect(page).to have_css(".gcp_carouselControlsPrevious")
    expect(page).to have_css(".gcp_carouselControlsNext")
    expect(page.find('button.p_playbackSettingsButton')['aria-label']).to eq("Open playback settings menu for autoplay and video quality settings")
    # find( "p" , text: "Up next" )
    # find( "p" , text: "More" )
  end
end

Then(/^CPP shows WITHOUT cancel options$/) do
  sleep(4)
  within_frame "smphtml5iframemp" do
    sleep(2)
    if page.driver.browser.browser == :firefox
      expect(page).to have_css(".gcp_closeSVG")
      expect(page).to have_css(".gcp_itemCtaIcon")
      expect(page).to have_css(".gcp_itemImg")
      expect(page).to have_css(".gcp_carouselControlsNext")
      # find( "p" , text: "Up next" )
      find( "p" , text: "More" )
    else
      expect(page).to have_css(".gcp_closeSVG")
      expect(page).to have_no_css(".gcp_cancel")
      expect(page).to have_no_css(".gcp_spinnerCountdown_button")
      expect(page).to have_css(".gcp_itemCtaIcon")
      expect(page).to have_css(".gcp_itemImg")
      expect(page).to have_css(".gcp_carouselControlsNext")
      # find( "p" , text: "Up next" )
      find( "p" , text: "More" )
    end
  end
end

Then("I press {string}") do |string|
  within_frame "smphtml5iframemp" do
    sleep(4)
    if string == "X"
      page.first(".gcp_closeSVG").click
    elsif string == "Cancel"
      page.first(".gcp_cancel").click
    elsif string == "Circle"
      page.first(".gcp_spinnerCountdown_button").click
    elsif string == "Mini CTA"
      page.first(".gcp_itemCtaIcon").click
    elsif string == "Mini Thumbnail"
      page.first(".gcp_itemDescription").click
    end
  end
  sleep(5)
end

Then("I enter {string}") do |string|
  if string == "Fullscreen"
    within_frame "smphtml5iframemp" do
      page.first(".p_fullscreenButton").click
    end
  end
end

Then("CPP stays if {string}") do |string|
  if string == "Cancel" or string == "Circle"
    within_frame "smphtml5iframemp" do
      sleep(2)
      if page.driver.browser.browser == :firefox
        expect(page).to have_css(".gcp_closeSVG")
        expect(page).to have_css(".gcp_itemCtaIcon")
        expect(page).to have_css(".gcp_itemImg")
      else
        expect(page).to have_css(".gcp_closeSVG")
        expect(page).to have_no_css(".gcp_cancel")
        expect(page).to have_no_css(".gcp_spinnerCountdown_button")
        expect(page).to have_css(".gcp_itemCtaIcon")
        expect(page).to have_css(".gcp_itemImg")
      end
    end
  end
end

Then(/^I press X of CP$/) do
  within_frame "smphtml5iframemp" do
    sleep(4)
    page.first(".gcp_closeSVG").click
  end
  sleep(5)
end

# Weird behaviour in FULLSCREEN where I cannot focus on player when going from one item to the next if guidance present
Then("I can resume past News blocking guidance in {string}") do |mode|
  within_frame 'smphtml5iframemp' do
    sleep(1)
    if mode == "Inline"
      page.first(".p_accessibleHitArea").click
    end
    sleep(2)
  end
end

# used in core_functionality_cp_news.feature
Then(/^I can see guidance$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
  end
end

Then("I can click WATCH MORE") do
  within_frame 'smphtml5iframemp' do
    sleep(1)
    # find("button", text: "Watch More").hover
    # sleep(1)
    page.first("#gcp_onDemandButtonContainer").click
    # sleep(1)
    # expect(page).to have_css("#gcp_onDemandButtonContainer button", text: "Watch more" ) 
    # sleep(2)
  end
  # pending # Write code here that turns the phrase above into concrete actions
  #gcp_onDemandButtonContainer
  # aria-label - Watch more
end




























