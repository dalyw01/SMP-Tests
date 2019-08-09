Then(/^I can see warning$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
    sleep(2)
  end
end

Then(/^I verify guidance text$/) do
      within_frame 'smphtml5iframemp' do
	  find('.p_guidanceText').should have_content('This is a WARNING for Audio content')
	  sleep(2)
  end
end
Then(/^I verify holding img guidance text$/) do
      within_frame 'smphtml5iframemp' do
    find('.p_guidanceText').should have_content('BEVIS WARNING TEST')
    sleep(2)
  end
end

Then(/^I can see in player warning$/) do
  within_frame 'smphtml5iframemp' do
  	sleep(5)
    find('.p_crossIcon').click
    sleep(5)
  end
end

Given(/^I am on a minimode audio page with old UI and guidance$/) do
  visit('https://is.gd/inarix')
end

Then(/^I can see audio guidance$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
    sleep(4)
  end
end

When(/^I see correct queued playlist guidance "([^"]*)"$/) do |arg1|
  within_frame 'smphtml5iframemp' do
    page.first("div.p_accessibleHitArea").hover
    if arg1 == "inplay_eng"
      sleep(2)
      find('.p_guidanceText').should have_content('This is a WARNING for Audio content')
      sleep(2)
    elsif arg1 == "inplay_grk" 
      sleep(2)
      find('.p_guidanceText').should have_content('Πρόκειται για μια ΠΡΟΕΙΔΟΠΟΙΗΣΗ για το περιεχόμενο ήχου')
      sleep(2)
    elsif arg1 == "inplay_jap" 
      sleep(2)
      find('.p_guidanceText').should have_content('これは音声コンテンツの警告です')
      sleep(2)
    end
  end
end

When(/^I see correct guidance or warning message "([^"]*)"$/) do |arg1|
  within_frame 'smphtml5iframemp' do
    page.first("div.p_accessibleHitArea").hover
	if arg1 == "english"
	  sleep(2)
	  find('.p_guidanceText').should have_content('Guidance Test')
	  sleep(2)
	elsif arg1 == "japanese"
	  sleep(2)
	  find('.p_guidanceText').should have_content('ガイダンステスト')
	  sleep(2)
	elsif arg1 == "greek"	
	  sleep(2)
	  find('.p_guidanceText').should have_content('Δοκιμασία καθοδήγησης')
	  sleep(2)
  elsif arg1 == "warn_eng" 
    sleep(2)
    find('.p_guidanceText').should have_content('BEVIS WARNING TEST')
    sleep(2)
  elsif arg1 == "warn_grk" 
    sleep(2)
    find('.p_guidanceText').should have_content('ΔΟΚΙΜΗ ΠΡΟΕΙΔΟΠΟΙΗΣΗΣ ΠΡΟΣΟΧΗΣ')
    sleep(2)
  elsif arg1 == "warn_jap" 
    sleep(2)
    find('.p_guidanceText').should have_content('証明警告テスト')
    sleep(2)
	end
  end
end

Given(/^I am on a Simulcast page with guidance$/) do
  visit('https://is.gd/erimih')
end

Given(/^I am on a old audio player page with guidance$/) do
  visit('https://is.gd/ujahus')
end

Given(/^I am on a news page with greek guidance$/) do
  visit('https://is.gd/otujul')
end

Given(/^I am on a news page with japanese guidance$/) do
  visit('https://is.gd/yipiso')
end