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

# Bevis




g