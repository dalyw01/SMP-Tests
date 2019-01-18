When("I go for the PIP options") do
  sleep 4
  page.find('div#smphtml5iframempwrp').hover
  within_frame 'smphtml5iframemp' do
    page.first('.p_button.p_controlBarButton.p_picInPicButton').click
    sleep 4
  end
end

When("I find the pause button in the PIP window") do
  sleep 3
  within_frame 'smphtml5iframemp' do
    page.find('button[title="Exit Picture in Picture mode"]')
    sleep 4
  end
end
