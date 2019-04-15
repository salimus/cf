Given(/^I land on "([^"]*)" application page$/) do |page_name|
  @browser.navigate.to "https://apply.carfinance.com/?type=" + page_name.downcase                   # url
  expect(@browser.title).to be == "CarFinance | Get Started"                                        # the title of the page
  expect(@browser.current_url).to be == "https://apply.carfinance.com/?type=" + page_name.downcase  # verifies url
  # puts @browser.current_url
end

Then(/^I enter "([^"]*)" in the "([^"]*)" name field$/) do |text, field_name|
  @browser.find_element(id: "applicant-" + field_name.downcase + "-name").send_keys text            # finds element by id and enters text
  sleep 1
end

Then(/^I enter "([^"]*)" in the "([^"]*)" field$/) do |info, field_name|
  @browser.find_element(id: "applicant-" + field_name.downcase).send_keys info                      # finds element by id and enters text
  sleep 1
end

When(/^I click on "([^"]*)" button$/) do |button_name|
  @browser.find_element(xpath: "//*[@id='form-navigation']/label/input").click                      # clicks on Next / Agree button
  puts "Clicked on " + button_name
  sleep 12
end

Then(/^I should navigate to the "([^"]*)" page$/) do |page_name|
  expect(@browser.title).to be == "CarFinance | #{page_name}"                                       # verifies page title
  # text = @browser.find_element(css: "div.span_6.back-btn").text
  # expect(text).to be == "Back"
end

And(/^I select "([^"]*)" from the "([^"]*)" dropdown$/) do |name, dropdown|
  @browser.find_element(id: dropdown.downcase).click                                                # clicks on dropdown
  dropdown = @browser.find_element(id: dropdown.downcase).find_elements(tag_name: "option")         # returns an array
  dropdown.each do |element|                                                                        # loops through each elements of array and clicks on element if element.text matches provided text
    if element.text == name
      element.click
      break
    end
  end
end

And(/^I enter "([^"]*)" in the "([^"]*)" vehicle mileage field$/) do |number, field_name|           # finds element by id and enters text
  @browser.find_element(id: "vehicle-" + field_name.downcase).send_keys number
  sleep 1
end

Then(/^I should see an error for all required fields in the Get Started page$/) do
  actual_errors = @browser.find_elements(class: "error")                                            # returns an array of errors
  expected_errors = ["First Name is required", "Last Name is required", "Email is required", "Primary Phone is required", "Date of Birth is required"]
  arr = []
  actual_errors.each do |error|                                                                     # loops through each elements of array and pushes an element into empty array if error.text not matches empty string
    if error.text != ""
      arr.push(error.text)
    end
  end
  if arr == expected_errors                                                                         # if arr are equal expected_errors it will print the text
    puts ">--->>> All required fields errors verified in the Get Started page <<<---<"
  end
  # puts arr.join(", ")
end

Then(/^I should see an error for all required fields in the Address Information page$/) do
  actual_errors = @browser.find_elements(class: "error")                                            # returns an array of errors
  expected_errors = ["Residence Status is required", "Street Address is required", "City is required", "State is required", "Zip Code is required", "Monthly Housing Payment is required", "Monthly Gross Income is required"]
  arr = []
  actual_errors.each do |error|                                                                     # loops through each elements of array and pushes an element into empty array if error.text not matches empty string
    if error.text != ""
      arr.push(error.text)
    end
  end
  if arr.grep /required/ == expected_errors                                                         # if arr contains "required" word elements are equal expected_errors it will print the text
    puts ">--->>> All required fields errors verified in the Address Information page <<<---<"
  end
end

Then(/^I should see an error for all required fields in the More Information page$/) do
  actual_error = @browser.find_element(class: "error").text                                         # holds an error text
  expected_error = "Applicant SSN is required"
  if actual_error == expected_error                                                                 # if actual_error is equal expected_error it will print the text
    puts ">--->>> All required fields errors verified in the More Information page <<<---<"
  end
end