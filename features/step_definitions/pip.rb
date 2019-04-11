When("I click PIP icon") do
  sleep(2)
  if page.driver.browser.browser == :firefox
    # If browser is Firefox we skip as pip is not supported
    pending
  end
  page.find('div#smphtml5iframempwrp').hover
  within_frame 'smphtml5iframemp' do
    page.first('.p_button.p_controlBarButton.p_picInPicButton').click
  end
end

When("I see the PIP window shows") do
  within_frame 'smphtml5iframemp' do
    page.find('button[title="Exit Picture in Picture mode"]')
  end
end

When("I can play any content in the CP list") do
  within_frame 'smphtml5iframemp' do
    page.first('.gcp_itemCtaIcon').click
    sleep(2)
    page.find('.p_button.p_controlBarButton.p_pauseButton')
  end
end

Then("I see the PIP window disappears") do
  within_frame 'smphtml5iframemp' do
    page.find('button[title="Open Picture in Picture mode"]')
  end
end

Then("I should not see PIP icon on Audio player") do
  within_frame 'smphtml5iframemp' do
    expect(page).to have_no_css('.p_button.p_controlBarButton.p_picInPicButton')
  end
end
