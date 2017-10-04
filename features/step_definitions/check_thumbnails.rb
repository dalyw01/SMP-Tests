Given(/^I am on a page with several HTML players$/) do
  visit( 'http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/cdn_players_thumbnails.html' )
  sleep(2)
end

When(/^I click on CTA to begin playback on "([^"]*)"$/) do |current_player|
  within_frame current_player do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(2.5)
  end
end

Then(/^click seekbar on "([^"]*)"$/) do |current_player|
  within_frame current_player do
    page.first(".p_seekBar").hover
    sleep(2)
  end
end

Then(/^verify thumbnail appears on "([^"]*)"$/) do |current_player|
  within_frame current_player do
    page.first(".p_thumbnail").hover
    sleep(1)
  end
end