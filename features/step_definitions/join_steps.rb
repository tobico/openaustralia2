Given /^the user is on the join page$/ do
  visit "/user/join/"
    assert_contain "Join OpenAustralia.org"
    assert_contain "Your first name:"
end

When /^the user enters the first name "([^\"]*)" and last name "([^\"]*)"$/ do |first, last|
  fill_in 'first', :with => first
  fill_in 'last', :with => last
end

When /^the user enters the email address "([^\"]*)"$/ do |email|
  fill_in 'email', :with => email
end

When /^the user correctly enters the password "([^\"]*)"$/ do |password|
  fill_in 'password', :with => password
  fill_in 'password2', :with => password
end

When /^the user clicks the Join button$/ do
  click_button "Join OpenAustralia.org"
end

When /^there should be a welcome message$/ do
  assert_contain "Welcome!"
  assert_contain "We're nearly done..."
end

When /^an email should be sent containing a confirmation link$/ do
  pending
end

When /^the user mismatches the password "([^\"]*)" with "([^\"]*)"$/ do |password, password2|
  fill_in 'password', :with => password
  fill_in 'password2', :with => password2
end

Then /^there should be an error message for the email field$/ do
  assert_contain "Please enter a valid email address"
end

Then /^there should be an error message for the password field$/ do
  assert_contain "Your passwords did not match"
end
