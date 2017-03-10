# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# GENERAL STEP(S)
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Given(/^an u16 HTML player with guidance$/) do
  visit('http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/multiple_under16_players.html')
  sleep(2)
  page.driver.browser.manage.window.resize_to( 700, 700 )
  sleep(1)
end

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# INPLAYER GUIDANCE STEPS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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
# BUMP GUIDANCE STEPS
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

When(/^I click small CTA$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^I tick BUMP checkbox$/) do
  find('#ageConfirmCheck').hover
  sleep(1)
  find('#ageConfirmCheck').click
end

When(/^I press BUMP Play button$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

When(/^I seek to small player end$/) do
  sleep(5) # Wait for ident to finish
  page.execute_script( 'mediaPlayer2.currentTime(( mediaPlayer2.duration() - 2 ));')
  sleep(4)
end

Then(/^I should be able to dismiss BUMP pop\-up pressing X icon$/) do
  find('#pgExit').hover
  sleep(1)
  find('#pgExit').click
end

Then(/^I should be able to press BUMP Play button again$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

Then(/^I should be able to restart small player playback without another pop\-up$/) do
  within_frame 'smphtml5iframemedia_player_2' do
    sleep(1)
    page.first(".p_ctaIcon").click
    sleep(1)
    page.first(".p_pauseIcon").click
  end
end
