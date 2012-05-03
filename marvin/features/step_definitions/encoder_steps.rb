Given /^encoder "([^"]*)" is in a default state$/ do |encoder_id|
  context = {
    encoder_id: encoder_id,
  }
  
  path = "/#{encoder_id}/live_events?per_page=10000"
  template = 'encoder.xml'
  create_double path, template, context

  path = "/#{encoder_id}/live_events/#{context[:live_id]}"
  template = 'live_event.xml'
  create_double path, template, context
  rescan_encoders
end

When /^I visit the server status page$/ do
  visit '/index.html'
end

Then /^encoder "([^"]*)" should be free$/ do |encoder|
  page.should have_selector "#encoder_#{encoder} .encoder_list_row_img_free"
  sleep 10
end

Given /^all the odd encoders have errors$/ do
  ["03", "05", "07", "09", "11", "13", "1A"].each do |encoder_id|
    context = {
      encoder_id: encoder_id,
    }
    
    path = "/#{encoder_id}/live_events?per_page=10000"
    template = 'encoder.xml'
    create_double path, template, context

    path = "/#{encoder_id}/live_events/#{context[:live_id]}"
    template = 'live_event.xml'
    create_double path, template, context
  end
  rescan_encoders
end

Then /^I should be told there is a problem with encoders "([^"]*)"$/ do |encoders|
  find('.message_box_error').should have_content encoders
end