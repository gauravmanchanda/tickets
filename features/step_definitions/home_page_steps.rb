Given(/I am on the Homepage/) do
  visit root_path
end

Then(/I should see the Welcome message/) do
  expect(page).to have_content('To log a Ticket:')
end