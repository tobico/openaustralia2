Given /^user is on the login page$/ do
  visit "/user/login/"
    assert_contain "Not yet a member?"
    assert_contain "Email address:"
    assert_contain "Password:"
end

When /^user enters login name (.+) and password (.+)$/ do |username, password|
  fill_in "email", :with => username
  fill_in "password", :with => password
  click_button "Login"
end

Then /^user should be returned to the referring page$/ do
  assert_contain "Enter your Australian postcode"
end

Then /^the username should be displayed with a logout link$/ do
  assert_contain "Matthew Landauer"
  assert_contain "Log out"
end


Then /^there should be an error message regarding bad login$/ do
  assert_contain "There is no user registered with an email"
end

