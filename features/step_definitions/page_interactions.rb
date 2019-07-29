When(/^I check if cookies appears$/) do
	if page.has_css?('#bbccookies-continue-button') == true
     find('#bbccookies-continue-button').click
   	end
end

Then(/^I refresh page$/) do
  page.refresh()
  sleep (3)
end

# used in core_functionality_cp_news.feature
Then(/^I can see warning$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
    sleep(4)
  end
end

Given(/^I am on a page with warning installed$/) do
  visit('https://is.gd/oyahax')
end

Then(/^I can see in player warning$/) do
  within_frame 'smphtml5iframemp' do
  	sleep(5)
    find('.p_crossIcon').click
    sleep(5)
  end
end