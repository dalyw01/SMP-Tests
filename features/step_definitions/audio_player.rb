When(/^I click Audio player CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(3)
  	# Different step definition to video as Audio CTA needs to be pressed and not hit-box
    page.first(".p_audioButton_buttonInner").click
    sleep(3)
  end
end

When(/^I click Audio player CTA to begin playback and pause it$/) do
  within_frame 'smphtml5iframemp' do
    sleep(3)
  	# Different step definition to video as Audio CTA needs to be pressed and not hit-box
    page.first(".p_audioButton_buttonInner").click
    sleep(2)
    page.first("button#p_audioui_playpause").click
  end
end

When("I am at the start of the player") do
  within_frame 'smphtml5iframemp' do
    sleep(3)
    page.first(".p_audioButton_buttonInner").click
    sleep(3)
    page.first("button#p_audioui_playpause").click
    page.first("button#p_audioui_backInterval").click
  end
end

When("I am at the end of the player") do
  within_frame 'smphtml5iframemp' do
    sleep (2)
    page.first("button#p_audioui_forwardInterval").click
  end
end

Then(/^I can Audio pause$/) do
	sleep(1)
	within_frame 'smphtml5iframemp' do
 		page.first(".p_audioButton_buttonInner").click
  	end
  	sleep(1)
end

Then(/^I can Audio play$/) do
	sleep(1)
	within_frame 'smphtml5iframemp' do
      	page.first(".p_audioButton_buttonInner").click
  	end
 	sleep(1)
end

Then(/^I can Audio mute if "([^"]*)"$/) do |new_device|
	sleep(1)
	if new_device == "desktop"
		within_frame 'smphtml5iframemp' do
			page.first(".audio").click
		end
	end
	sleep(1)
end

Then(/^I can Audio unmute if "([^"]*)"$/) do |new_device|
	sleep(1)
	if new_device == "desktop"
		within_frame 'smphtml5iframemp' do
			page.first(".p_volumeButton").click
		end
	end
	sleep(1)
end

Then(/^I can press \+(\d+)$/) do |arg1|
   	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_forwardInterval").click
	end
	sleep(2)
end

Then(/^I can press \-(\d+)$/) do |arg1|
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_backInterval").click
	end
	sleep(2)
end

Then(/^I see \-(\d+) is disabled when at START$/) do |arg1|
	sleep(1)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_backInterval', disabled: true).should be
	end
	sleep(1)
end

Then(/^I see \+(\d+) is disabled when at LIVE$/) do |arg1|
	sleep(1)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_forwardInterval', disabled: true).should be
	end
	sleep(1)
end

Then(/^I can press NEXT item$/) do
	sleep(2)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_nextButton").click
	end
	sleep(3)
end

Then(/^I can press PREVIOUS item$/) do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_previousButton").click
	end
	sleep(3)
end

Then(/^I see NEXT button is disabled$/) do
	sleep(1)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_nextButton', disabled: true).should be
	end
	sleep(3)
end

Then(/^I can press START button$/) do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_backToStartButton").click
	end
	sleep(3)
end

Then(/^I can press LIVE button$/) do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_toLiveButton").click
	end
	sleep(3)
end

Then(/^I see START button is disabled when at START$/) do
	sleep(4)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_backToStartButton', disabled: true).should be
	end
	sleep(1)
end

Then(/^I see LIVE button is disabled when at LIVE$/) do
	sleep(4)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_toLiveButton', disabled: true).should be
	end
	sleep(1)
end

Then(/^the \-(\d+) button is disabled$/) do |int|
  within_frame 'smphtml5iframemp' do
    expect(page.find("button#p_audioui_backInterval").disabled?).to be true
  end
end

Then(/^the \+(\d+) button is disabled$/) do |int|
  within_frame 'smphtml5iframemp' do
    sleep(3)
    expect(page.find("button#p_audioui_forwardInterval").disabled?).to be true
  end
end
