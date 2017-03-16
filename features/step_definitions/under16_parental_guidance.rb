





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

When(/^I press BUMP \[Play\] button$/) do
  find('#pgAgeContinue').hover
  sleep(1)
  find('#pgAgeContinue').click
end

Then(/^I see BUMP caution symbol with permissions error message$/) do
  sleep(1)
  all(:xpath, '//*[@id="pgErrorMessage"]/div/span')[0].click
  sleep(1)
  find('#guidanceMessage').should have_content('Please confirm you have permission before continuing')
  sleep(2)
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
