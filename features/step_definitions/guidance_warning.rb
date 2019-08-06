Then(/^I can see warning$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
    sleep(2)
  end
end

Given(/^I am on a page with warning installed$/) do
  visit('https://is.gd/hexoxi')
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

Then(/^I click guidance$/) do
  page.refresh()
  sleep (3)
end

#Guidance Minimode 

Given(/^I am on a minimode audio page with old UI and guidance$/) do
  visit('https://is.gd/inarix')
end

Then(/^I can see audio guidance$/) do
  within_frame 'smphtml5iframemp' do
    find('.p_guidanceContainer').hover
    sleep(4)
  end
end

When(/^I see correct guidance message$/) do
  within_frame 'smphtml5iframemp' do
    sleep(2)
    find('.p_guidanceText').should have_content('Guidance Test')
    sleep(2)
  end
end

When(/^I see correct guidance message in "([^"]*)"$/) do |arg1|
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
	end
  end
end

#Guidance Simulcast

Given(/^I am on a Simulcast page with guidance$/) do
  visit('https://is.gd/erimih')
end

#Old audio player 

Given(/^I am on a old audio player page with guidance$/) do
  visit('https://is.gd/ujahus')
end

#News page with greek guidance

Given(/^I am on a news page with greek guidance$/) do
  visit('https://is.gd/otujul')
end

#News page with japanese guidance

Given(/^I am on a news page with japanese guidance$/) do
  visit('https://is.gd/yipiso')
end