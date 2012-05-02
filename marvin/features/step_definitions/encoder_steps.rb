Given /^encoder "([^"]*)" is in a default state$/ do |encoder_id|
  
  context = {
    encoder_id: encoder_id,
    profile_name: "Test",
    device_number: 1,
    device_id: 2,
    status: "running",
    live_id: 103,
    user_data: "blah",
    error_code: nil,
    switch_timestamp: nil,
    start_time: nil,
    complete_time: nil
  }
  
  path = "/#{encoder_id}/live_events?per_page=10000"
  template = 'encoder.xml'
  create_double path, template, context

  path = "/#{encoder_id}/live_events/#{context[:live_id]}"
  template = 'live_event.xml'
  create_double path, template, context
end

When /^I visit the server status page$/ do
  visit '/index.html'
end

Then /^encoder "([^"]*)" should be free$/ do |arg1|
  page.should have_selector '#encoder_1A .encoder_list_row_img_free'
end