Given(/^I am on a page that plays an AD$/) do
	visit('https://is.gd/esesuc')
end

When(/^I can see AD controlbar$/) do
  within_frame 'smphtml5iframemp' do
    page.should have_selector(:xpath, '//*[@id="ads_buttonBar"]')
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