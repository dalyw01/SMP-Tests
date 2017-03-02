# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# INPLAYER GUIDANCE
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Given(/^a HTML player with guidance$/) do
    visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_under16_players.html')
    sleep(2)
end

When(/^I click CTA$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^I tick checkbox$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#ageConfirmCheck').click
  end
end

When(/^I do not press the checkbox$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#ageConfirmCheck').hover
  end
end

When(/^I press Play button$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

When(/^I seek to end$/) do
  sleep(5) # Wait for ident to finish
  page.execute_script( 'mediaPlayer1.currentTime(( mediaPlayer1.duration() - 2 ));')
  sleep(4)
end

Then(/^I should be able to dismiss pop\-up pressing X icon$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('.p_gel-exitLinkIcon').click
  end
end

Then(/^I should be able to press Play button again$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    find('#pgAgeContinue').click
    sleep(2)
  end
end

Then(/^I should be able to restart playback without another pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_1' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# BUMP GUIDANCE
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I click small player CTA to begin playback$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^be able to dismiss BUMP pop\-up pressing X icon$/) do
    find('#pgExit').hover
    sleep(1)
    find('#pgExit').click
end

When(/^be able to press small player CTA$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^be able to tick BUMP guidance checkbox$/) do
  find('#ageConfirmCheck').hover
  sleep(1)
  find('#ageConfirmCheck').click
end

When(/^be able to press BUMP Play button$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

#
#
#
# zcsadadasd
#
#
#
# asdads
