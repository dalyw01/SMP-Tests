Given(/^I am on the Cookbook Errors page$/) do
  visit('http://cookbook.tools.bbc.co.uk/errors?environment=stage')
end

Given(/^I am on the errors cookbook page and select HTML player$/) do
  find("span", text: "HTML").click
  sleep(1)
end

When(/^I click on link - "([^"]*)"$/) do |new_link|
  page.first( "a" , text: new_link ).click
  # For these 2 links we need to get past the ident to generate the error so that's why I execute a .play() afterwards
  if new_link == "1024" or new_link == "3024"
    sleep(1)
    page.execute_script('embeddedMedia.players[0].play();')
    sleep(4)
  end
end

Then(/^I should get a message \- "([^"]*)"$/) do |new_error_message|
  expect(page).to have_css("#generated_errors td", text: new_error_message)
end

Then(/^I should get a playlist \- "([^"]*)"$/) do |new_playlist|
  expect(page).to have_css("#generated_errors a", text: new_playlist)
end

Then(/^I should get a severity \- "([^"]*)"$/) do |new_severity|
  expect(page).to have_css("#generated_errors td", text: new_severity)
end

Then(/^I should get an error code \- "([^"]*)"$/) do |new_error_code|
  new_error_code.split(",").each do |single_error|
    expect(page).to have_css("#generated_errors td", text: single_error.strip)
  end
end
