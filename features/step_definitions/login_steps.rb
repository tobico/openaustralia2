Given /^user is on the login page$/ do
  visit "/user/login/"
    assert_contain "Not a member yet?"
    assert_contain "Email address:"
    assert_contain "Password:"
end

When /^user enters login name and password$/ do
  pending
end

Then /^user should be returned to the referring page$/ do
  pending
end

Then /^the username should be displayed with a logout link$/ do
  pending
end