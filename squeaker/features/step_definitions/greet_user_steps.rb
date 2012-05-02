Given /^I am not logged in$/ do
  #visit '/reset'
end

When /^I visit the homepage$/ do
  visit '/'
end

Then /^I should see "([^""]*)"$/ do |text|  
  page.should have_content(text)
end

Given /^a user called "([^"]*)" exists$/ do |username|
  visit '/users/new'
  fill_in 'Username', :with => username
  click_button 'Create My Account'
  click_button 'Log Out'
end

When /^I log in as "([^"]*)"$/ do |username|
  visit '/user_session/new'
  fill_in 'Username', :with => username
  click_button 'Log in'
end
