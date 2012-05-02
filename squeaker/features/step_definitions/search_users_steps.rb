When /^I search for "([^""]*)"$/ do |username|
  visit '/'
  fill_in 'Find users:', :with => username
  click_button 'Search'
end

Then /^I should see "([^""]*)" in the list of results$/ do |username|
  find('table').should have_content username
end

Before do
  visit '/reset'
end
