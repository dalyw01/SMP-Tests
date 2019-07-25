module AppiumHelper
  def touch_player_screen
    in_native_context do
      device_h, device_w = get_device_dimension
      Appium::TouchAction.new.tap(x: (device_w/2), y:(device_h/3), fingers: 1).perform
    end
  end

  def in_native_context
    $driver.driver.set_context('NATIVE_APP')
    yield if block_given?
    $driver.driver.set_context('CHROMIUM')
  end
end
World(AppiumHelper)
