When(/^I check if cookies appears$/) do
	if page.has_css?('#bbccookies-continue-button') == true
     find('#bbccookies-continue-button').click
   	end
end

Then(/^I refresh page$/) do
  page.refresh()
  sleep (3)
end

Then(/^I click guidance$/) do
  page.refresh()
  sleep (3)
end

When(/^I hover and click$/) do
  within_frame 'smphtml5iframemp' do
    page.first("div.p_guidanceContainer").hover
    sleep(2)
    # focus thr guidance message and click 
    if page.has_css?('#p_ctaGuidance p_guidance') == true
      find('#p_ctaGuidance p_guidance').click
    end
  end
end



yey. d