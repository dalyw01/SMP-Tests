When(/^I check if cookies appears$/) do
	if page.has_css?('#bbcprivacy-continue-button') == true
      sleep(1)
      find('#bbcprivacy-continue-button').click
      sleep(1)
      find('#bbccookies-continue-button').click
   	end
end

Then(/^I refresh page$/) do
  page.refresh()
  sleep (3)
end