cookie_flag = 0

When(/^I check if cookies appears$/) do
	if cookie_flag == 0
		sleep(2)
 		page.first("#bbccookies-continue-button").click
 		sleep(1)
 		cookie_flag = cookie_flag+1
   	end
end


