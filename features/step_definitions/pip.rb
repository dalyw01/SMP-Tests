When("I click PIP icon") do
  sleep(2)
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
