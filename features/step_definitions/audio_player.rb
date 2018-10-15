When(/^I click Audio player CTA to begin playback$/) do
  within_frame 'smphtml5iframemp' do
    sleep(3)
  	# Different step definition to video as Audio CTA needs to be pressed and not hit-box
    page.first(".p_audioButton_buttonInner").click
    sleep(3)
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

Then("I can Audio mute if {string}") do |string|
	sleep(1)
	if string == "desktop"
		within_frame 'smphtml5iframemp' do
			page.first(".audio").click
		end
	end
	sleep(1)
end

Then("I can Audio unmute if {string}") do |string|
	sleep(1)
	if string == "desktop"
		within_frame 'smphtml5iframemp' do
			page.first(".p_volumeButton").click
		end
	end
	sleep(1)
end

Then("I can press +{int}") do |int|
   	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_forwardInterval").click
	end
	sleep(1)
end

Then("I can press -{int}") do |int|
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_backInterval").click
	end
	sleep(1)
end

Then("I see -{int} is disabled when at START") do |int|
	sleep(1)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_backInterval', disabled: true).should be 
	end
	sleep(1)
end

Then("I see +{int} is disabled when at LIVE") do |int|
	sleep(1)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_forwardInterval', disabled: true).should be 
	end
	sleep(1)
end

Then("I can press next item") do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_nextButton").click
	end
	sleep(3)
end

Then("I can press previous item") do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_previousButton").click
	end
	sleep(3)
end

Then("I can press START button") do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_backToStartButton").click
	end
	sleep(3)
end

Then("I can press LIVE button") do
	sleep(1)
	within_frame 'smphtml5iframemp' do
  		page.first("#p_audioui_toLiveButton").click
	end
	sleep(3)
end

Then("I see START button is disabled when at START") do
	sleep(4)
	within_frame 'smphtml5iframemp' do
		find_button('p_audioui_backToStartButton', disabled: true).should be 
	end
	sleep(1)
end

Then("I see LIVE button is disabled when at LIVE") do
	sleep(4)
	within_frame 'smphtml5iframemp' do
		puts find_button('p_audioui_toLiveButton', disabled: true).should be 
		find_button('p_audioui_toLiveButton', disabled: true).should be 
	end
	sleep(1)
end



