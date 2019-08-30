Given(/^I am on a audio page with the audio settings accessible on the page$/) do
  visit('https://is.gd/equkup')
  end


Then(/^I hover on audio settings button$/) do
 within_frame 'smphtml5iframemp' do
   sleep(2)
   page.first("#p_audioui_playbackSettingsButton").hover
   sleep(2)
  end
end

Then(/^I click audio settings button$/) do
 within_frame 'smphtml5iframemp' do
   sleep(2)
   page.first("#p_audioui_playbackSettingsButton").click
   sleep(2)
   # page.first(".p_playbackSettingsHeading").click
  end
end


Then(/^I select autoplay on$/) do
   # audio settings are not within iframe
   page.first(".p_playbackSettingsHeading").hover
    sleep(3)
    expect(page.find('#p_autoplayToggle')['aria-checked']).to eq("false")
    sleep(3)
    page.first("#p_autoplayToggle").click
end

Then(/^I select autoplay off$/) do
    # audio settings are not within iframe
    page.first(".p_playbackSettingsHeading").hover
    sleep(3)
    expect(page.find('#p_autoplayToggle')['aria-checked']).to eq("false")
    sleep(3)


end
 
