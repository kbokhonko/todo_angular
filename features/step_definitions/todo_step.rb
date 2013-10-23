Given /^user go to the new task page$/ do
  visit root_path
end

Given /^user fill tasks content in "(.*?)" with "(.*?)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^user click "(.*?)"$/ do |arg1|
  click_link arg1
end

Then /^user should see "(.*?)"$/ do |arg1|
    page.should have_content(arg1)
end

When /^I check "(.*?)" checkbox$/ do |arg1|
  check arg1
end

#Then /^user should not see "(.*?)"$/ do |arg1|
#  arg1
#end

