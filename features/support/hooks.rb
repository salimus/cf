Before do
  create_browser
end

After do |scenario|
  if scenario.failed?
    if !File.directory?("screnshots")
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screenshots", screenshot_name)
    @browser.save_screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png")
  end
  sleep 5
  @browser.quit
end