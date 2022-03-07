Given('user should have opened the website home page') do
  $driver.get "http://www-review.sapaad.com"
end

When('User click on try should user should land on the trail page') do
  Try_Freebutton= $wait.until{$driver.find_element(:xpath, "(//a[contains(text(),'Try for free')])[1]")}
  Try_Freebutton.click
  puts "#{$driver.title}"
end

When('User should be able to enter emaild ID and clik on submit') do
  Email_id= $wait.until{$driver.find_element(:xpath, "//input[@id='your-email']")}
  Email_id.send_keys "sapaad1121131@gmail.com"
  submit = $wait.until{$driver.find_element(:id,"step-one-btn")}
  submit.click
  sleep 2
end

When('enter form details') do
  Name = $wait.until{$driver.find_element(:xpath, "//input[@id='name']")}
  Name.send_keys "Sapaad "
  RestaurantName = $wait.until{$driver.find_element(:xpath, "//input[@id='resto-name']")}
  RestaurantName.send_keys "Sapaad cafe"
  dropDownMenu = $driver.find_element(:id, 'trial-country')
  option = Selenium::WebDriver::Support::Select.new(dropDownMenu)
  option.select_by(:text, 'Kuwait')
  phone_number = $wait.until{$driver.find_element(:id, "phone-num")}
  phone_number.send_keys "1313123131"
  i_agree_checkbox = $wait.until{$driver.find_element(:id,"terms-agree")}
  if (!i_agree_checkbox.selected?)
        i_agree_checkbox.click
  end
  continue = $driver.find_element(:id,"step-two-btn")
  continue.click
  sleep 3
end

Then('click on submit Thank you page should be displayed') do
   puts "#{$driver.title}"
end