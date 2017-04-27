Given(/^I am on a page with the HTML player and press CTA$/) do
  visit( 'http://smp-scratch.tools.bbc.co.uk/dalyw01/cucumber_players/clean_html.html')
  sleep(2)
  within_frame 'smphtml5iframemedia_player' do
    sleep(1)
    page.first(".p_ctaIcon").click
  end
end

When(/^I enter player volume using keys$/) do
  sleep(1)
  find('#smphtml5iframemedia_player').hover
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:tab)
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:tab)
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:tab)
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
  sleep(1)
end

Then(/^I should be able to retrieve \+ check volume values going down$/) do
  vol_down_array = Array.new
  8.times do
    find(:id, 'smphtml5iframemedia_player').native.send_keys(:arrow_down)
    puts page.execute_script('return(mediaPlayer.volume());')
    vol_down_array.push(page.execute_script('return(mediaPlayer.volume());'))
    sleep(1)
  end
  expect( vol_down_array[0] ).to eq( 0.636363636363636 ) # Starting at volume value "7"
  expect( vol_down_array[1] ).to eq( 0.545454545454545 )
  expect( vol_down_array[2] ).to eq( 0.454545454545455 )
  expect( vol_down_array[3] ).to eq( 0.363636363636364 )
  expect( vol_down_array[4] ).to eq( 0.272727272727273 )
  expect( vol_down_array[5] ).to eq( 0.181818181818182 )
  expect( vol_down_array[6] ).to eq( 0.090909090909091 )
  expect( vol_down_array[7] ).to eq( 0 )
end

Then(/^retrieve \+ check volume values going up$/) do
  vol_up_array = Array.new
  11.times do
    find(:id, 'smphtml5iframemedia_player').native.send_keys(:arrow_up)
    puts page.execute_script('return(mediaPlayer.volume());')
    vol_up_array.push(page.execute_script('return(mediaPlayer.volume());'))
    sleep(1)
  end
  expect( vol_up_array[0] ).to eq( 0.090909090909091 )
  expect( vol_up_array[1] ).to eq( 0.181818181818182 )
  expect( vol_up_array[2] ).to eq( 0.272727272727273 )
  expect( vol_up_array[3] ).to eq( 0.363636363636364 )
  expect( vol_up_array[4] ).to eq( 0.454545454545455 )
  expect( vol_up_array[5] ).to eq( 0.545454545454545 )
  expect( vol_up_array[6] ).to eq( 0.636363636363636 )
  expect( vol_up_array[7] ).to eq( 0.727272727272727 )
  expect( vol_up_array[8] ).to eq( 0.818181818181818 )
  expect( vol_up_array[9] ).to eq( 0.909090909090909 )   # Unmuting again because it gets annoying
  find(:id, 'smphtml5iframemedia_player').native.send_keys(:enter)
end
