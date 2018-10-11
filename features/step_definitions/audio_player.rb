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

