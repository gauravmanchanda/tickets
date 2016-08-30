When(/I click on the Sign Up Button/) do
  click_link "Sign Up"
end

When(/I fill in the Sign Up form and submit it/) do
  fill_in "user[first_name]", with: 'Steve'
  fill_in "user[first_name]", with: 'Rogers'
  fill_in "user[email]", with: 'cap@tamcap.com'
  fill_in "user[password]", with: '123123123'
  fill_in "user[password_confirmation]", with: '123123123'
  click_button "Sign Up"
end

Then(/I should see the sign up form/) do
  expect(page).to have_field('user[first_name]')
  expect(page).to have_field('user[email]')
  expect(page).to have_field('user[password]')
end

Then(/I should see the successfully sign up message/) do
  expect(page).to have_content('Welcome! You have signed up successfully.')
end
