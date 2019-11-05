Given(/^I am on a COOKBOOK page with the HTML player and CP plugin installed$/) do
  visit('https://is.gd/pisole') # Lock to stage
  sleep(1)
  page.driver.browser.manage.window.resize_to( 1400 , 1400 )
  sleep(1)
  page.execute_script( 'window.scrollBy(0, 270);')
  sleep(5)
end

Given(/^I am on a page with the News HTML player and CP plugin installed$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/cp_news_guidance_block.html')
  sleep(1)
  page.driver.browser.manage.window.resize_to( 1400 , 1400 )
  sleep(1)
  page.execute_script( 'window.scrollBy(0, 270);')
end

Given(/^I am on a page with the HTML player and CP plugin installed$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/cp_news_guidance_block.html')
  sleep(1)
  page.driver.browser.manage.window.resize_to( 1400 , 1400 )
  sleep(1)
  page.execute_script( 'window.scrollBy(0, 270);')
end

Given(/^I am on a page with the HTML player and CP plugin installed and true and false settings applied$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/cp_no_autoplay.html')
  sleep(1)
  page.driver.browser.manage.window.resize_to( 1400 , 1400 )
  sleep(1)
  page.execute_script( 'window.scrollBy(0, 270);')
end

When(/^I press alwaysShowCarouselButton then page reloads$/) do
  page.first(" #alwaysShowCarouselButtonContainerButton").click
  sleep(2)
end

When(/^I seek to end of programme$/) do
  sleep(1)
  duration = page.execute_script( 'embeddedMedia.players[0].currentTime( ( embeddedMedia.players[0].duration() - 2 ) );')
end

When(/^I use core functionality of SMP$/) do
  within_frame "smphtml5iframemp" do
    page.first(".p_iconHolder .p_pauseIcon").click
    sleep(1)
    page.first(".p_playIcon").click
    sleep(2)
    page.first(".p_audioIcon").click
    sleep(2)
    page.first(".p_muteIcon").click
    sleep(2)
  end
end

Then(/^I can replay current programme$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    page.first(".p_playIcon").click
    sleep(1)
  end
end

Then("CP disappears") do
  within_frame 'smphtml5iframemp' do
    begin
      sleep(2)
      page.find(".gcp_carouselBackground").visible?
    rescue Capybara::ElementNotFound
      true
    end
  end
end

When("I click CTA to begin playback again") do
  title = page.find('#playlist_title').text
  within_frame 'smphtml5iframemp' do
    sleep(4)
    page.find('.p_button.p_controlBarButton.p_playButton').click
  end
end

When("I close the CP Panel") do
  page.driver.browser.manage.window.resize_to( 1000 , 1000 )
  sleep 1
  within_frame 'smphtml5iframemp' do
    sleep(3)
    page.find('.gcp_panelsClose .gcp_closeSVG').click
  end
end

When("I close the CP Panel without resizing") do
  within_frame 'smphtml5iframemp' do
    sleep(3)
    page.find('.gcp_panelsClose .gcp_closeSVG').click
  end
end

When("I seek till last second of program") do
  sleep(2)
  page.find('div#smphtml5iframempwrp').click
  page.execute_script( 'embeddedMedia.players[0].currentTime( ( embeddedMedia.players[0].duration()));')
  sleep(5)
  begin
    page.find("#ads_buttonBar").visible?
  rescue Capybara::ElementNotFound
    true
  end
end

Then("I click settings button") do
  within_frame 'smphtml5iframemp' do
    sleep(6)
    page.first(".p_button.p_controlBarButton.p_playbackSettingsButton.p_dontCloseSettingsPanel").click
  end
end

Then(/^I can pause new programme if "([^"]*)"$/) do |string|
  if string == "Mini Thumbnail" or string == "Mini CTA"
   within_frame 'smphtml5iframemp' do
      sleep(1)
      page.first(".p_pauseIcon").click
      sleep(2)
    end
  end
end

Then(/^I wait for countdown to finish$/) do
  sleep(9)
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
    expect(page).to have_css(".gcp_panelsClose .gcp_closeSVG")
    expect(page).to have_css(".gcp_cancel")
    expect(page).to have_css(".gcp_spinnerCountdown_button")
    expect(page).to have_css(".gcp_itemCtaIcon")
    expect(page).to have_css(".gcp_itemImg")
    expect(page).to have_css(".gcp_carouselControlsNext")
    expect(page.find('button.p_playbackSettingsButton')['aria-label']).to eq("Open playback settings menu for autoplay and video quality settings")
  end
end

Then(/^CPP shows WITHOUT cancel options$/) do
  sleep(4)
  within_frame "smphtml5iframemp" do
    sleep(2)
    if page.driver.browser.browser == :firefox
      expect(page).to have_css(".gcp_panelsClose .gcp_closeSVG")
      expect(page).to have_css(".gcp_itemCtaIcon")
      expect(page).to have_css(".gcp_itemImg")
      expect(page).to have_css(".gcp_carouselControlsNext")
      find( "p" , text: "More" )
    else
      expect(page).to have_css(".gcp_panelsClose .gcp_closeSVG")
      expect(page).to have_no_css(".gcp_cancel")
      expect(page).to have_no_css(".gcp_spinnerCountdown_button")
      expect(page).to have_css(".gcp_itemCtaIcon")
      expect(page).to have_css(".gcp_itemImg")
      expect(page).to have_css(".gcp_carouselControlsNext")
      find( "p" , text: "More" )
    end
  end
end

Then(/^I press "([^"]*)"$/) do |string|
  within_frame "smphtml5iframemp" do
    sleep(0.5)
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
  sleep(0.5)
end

Then("I move right with the CP list") do
  within_frame "smphtml5iframemp" do
    sleep(5)
    page.find("button.gcp_carouselControlsNext").click
    sleep(2)
    page.find("button.gcp_carouselControlsNext").click
    sleep(1)
  end
end

Then("I am able to play any content with a single click") do
  within_frame "smphtml5iframemp" do
  elems = []
  elems << page.find_all(".gcp_carouselContainer li div.gcp_item div.gcp_itemContainer div.gcp_itemCta")
  element = elems[0][5]
  element.click
  sleep(3)
  end
end

Then(/^I enter "([^"]*)"$/) do |string|
  if string == "Fullscreen"
    within_frame "smphtml5iframemp" do
      page.first(".p_fullscreenButton").hover
      page.first(".p_fullscreenButton").click
    end
  end
end

Then(/^CPP stays if "([^"]*)"$/) do |string|
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
Then(/^I can resume past News blocking guidance in "([^"]*)"$/) do |mode|
  within_frame 'smphtml5iframemp' do
    if mode == "inline"
      sleep(2)
      page.first("div.p_accessibleHitArea").click
      sleep(1)
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
    page.first("#gcp_onDemandButtonContainer").click
  end
end

Then("I see one Up next and one More section") do
  within_frame 'smphtml5iframemp' do
    sleep (5)
    expect(page.find('.gcp_inpageCountdownItem span.gcp_countdownText').text).to eql "Up next in..."
    expect(page.find('div.gcp_carouselBackground p.gcp_moreContentTitle').text).to eql "More"
  end
end

Then("I compare two different titles") do
  # Captures the title of the FIRST video and stores it in variable (a)
  a = page.find("#playlist_title").text
  # Scroll to through the carousel and play an item within it 
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
    page.first('.gcp_infoWrap').click
    sleep(5)
  end
   #Captures the title of the SECOND video and stores it in variable (a) 
  b = page.find("#playlist_title").text
   #Compares (a) and (b) and and delivers a fail message if a=b
  if a == b 
    fail "Test status is a FAIL! #{a} is the same as #{b}"
  end
end

Then(/^I compare two of the same title checking they are equal$/) do
   #Captures title of the video as variable C
   c = page.find("#playlist_title").text

   #Presses Play CTA during CP 10 sec countdown to play the same content 
   within_frame 'smphtml5iframemp' do
      page.first("div.p_accessibleHitArea").click
      sleep(1)
    if page.has_css?('#p_v_player_0') == true
      find('#p_v_player_0').hover
    end
  end

  #Captures title of the video as variable d
  d = page.find("#playlist_title").text
  sleep(5)

  #Compares variables c and d and gives fail message if they don't match 
  if c != d
    fail "#{c} Title c should be the same as title d #{d}"
  end
  sleep(2)
 end