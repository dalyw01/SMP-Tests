When(/^I click phantom CTA to begin playback$/) do
	sleep(3)
	page.first(".p_cta").click
	sleep(3)
end

When("I click phantom LOGIN button from pop up") do
	sleep(1)
  	page.first(".loginButton").click
end