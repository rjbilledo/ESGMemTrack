# location: spec/feature/integration_spec.rb
require 'rails_helper'

def login
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    provider: "google_oauth2",
      uid: "12345678910",
      info: {
        email: "test@gmail.com",
        first_name: "Jo",
      },
      credentials: {
        token: "abcdefg12345",
        refresh_token: "abcdefg12345",
        expires_at: DateTime.now,
      }
    })
end

feature 'testing oauth' do
  scenario 'should create a new user' do
    login

    visit root_path
    click_link "Login"
    
    expect(page).to have_link("Sign in with GoogleOauth2")

    click_link "Sign in with GoogleOauth2"

    expect(page).to have_content("Jo")
  end
end


RSpec.describe 'Creating a member', type: :feature do
  scenario 'valid inputs' do
    visit new_member_path
    fill_in 'Name', with: 'Jo Smith'
    fill_in 'Grade', with: 'Freshman'
    fill_in 'Uin', with: '222222222'
    fill_in 'Email', with: 'example@tamu.edu'
    click_on 'Create Member'
    visit members_path
    expect(page).to have_content('Jo Smith')
    expect(page).to have_content('Freshman')
    expect(page).to have_content('222222222')
    expect(page).to have_content('example@tamu.edu')
  end
end

feature 'testing event creation' do
  scenario 'should create a new event' do
    login
    visit new_event_path
    fill_in 'Event name', with: 'Street Cleanup #5'
    fill_in 'Event location', with: 'Dominik Dr.'
    fill_in 'Event time', with: '08:00 PM'
    fill_in 'Event date', with: '2022-09-10'
    fill_in 'Event type', with: 'Service'
    fill_in 'Event points', with: '1'
    click_on 'Create Event'
    expect(page).to have_content('Street Cleanup #5')
    expect(page).to have_content('Dominik Dr.')
    expect(page).to have_content('Service')
    expect(page).to have_content('1')
    expect(page).to have_content('2022-09-10')
    expect(page).to have_content('20:00')
  end
end

feature 'testing event creation' do
  scenario 'should create a new event and then edit it' do
    login

    visit root_path
    click_link "Login"
    
    expect(page).to have_link("Sign in with GoogleOauth2")

    click_link "Sign in with GoogleOauth2"
    visit new_event_path
    fill_in 'Event name', with: 'Street Cleanup #5'
    fill_in 'Event location', with: 'Dominik Dr.'
    fill_in 'Event time', with: '08:00 PM'
    fill_in 'Event date', with: '2022-09-10'
    fill_in 'Event type', with: 'Service'
    fill_in 'Event points', with: '1'
    click_on 'Create Event'
    expect(page).to have_content('Street Cleanup #5')
    expect(page).to have_content('Dominik Dr.')
    expect(page).to have_content('Service')
    expect(page).to have_content('1')
    expect(page).to have_content('2022-09-10')
    expect(page).to have_content('20:00')
    click_on 'Edit'
    fill_in 'Event name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to have_content('Street Cleanup #100')
    visit events_path
  end
end

feature 'testing attendance creation' do
  scenario 'should create a new event and then edit it' do
    login

    visit root_path
    click_link "Login"
    
    expect(page).to have_link("Sign in with GoogleOauth2")

    click_link "Sign in with GoogleOauth2"
    visit new_event_path
    fill_in 'Event name', with: 'Street Cleanup #5'
    fill_in 'Event location', with: 'Dominik Dr.'
    fill_in 'Event time', with: '08:00 PM'
    fill_in 'Event date', with: '2022-09-10'
    fill_in 'Event type', with: 'Service'
    fill_in 'Event points', with: '1'
    click_on 'Create Event'
    expect(page).to have_content('Street Cleanup #5')
    expect(page).to have_content('Dominik Dr.')
    expect(page).to have_content('Service')
    expect(page).to have_content('1')
    expect(page).to have_content('2022-09-10')
    expect(page).to have_content('20:00')
    click_on 'Edit'
    fill_in 'Event name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to have_content('Street Cleanup #100')
    visit events_path
    click_on 'Confirm Attendance'
    expect(page).to have_content('User:')
    expect(page).to have_content('Event:')
    visit attendances_path
    expect(page).to have_content("Jo")
    expect(page).to have_content("Street Cleanup #100")
  end
end

feature 'testing name goes under event' do
  scenario 'should create a new event and then edit it' do
    login

    visit root_path
    click_link "Login"
    
    expect(page).to have_link("Sign in with GoogleOauth2")

    click_link "Sign in with GoogleOauth2"
    visit new_event_path
    fill_in 'Event name', with: 'Street Cleanup #5'
    fill_in 'Event location', with: 'Dominik Dr.'
    fill_in 'Event time', with: '08:00 PM'
    fill_in 'Event date', with: '2022-09-10'
    fill_in 'Event type', with: 'Service'
    fill_in 'Event points', with: '1'
    click_on 'Create Event'
    expect(page).to have_content('Street Cleanup #5')
    expect(page).to have_content('Dominik Dr.')
    expect(page).to have_content('Service')
    expect(page).to have_content('1')
    expect(page).to have_content('2022-09-10')
    expect(page).to have_content('20:00')
    click_on 'Edit'
    fill_in 'Event name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to have_content('Street Cleanup #100')
    visit events_path
    click_on 'Confirm Attendance'
    expect(page).to have_content('User:')
    expect(page).to have_content('Event:')
    visit attendances_path
    expect(page).to have_content("Jo")
    expect(page).to have_content("Street Cleanup #100")
    visit events_path
    click_on 'Show'
    expect(page).to have_content("Jo")
    expect(page).to have_content("Street Cleanup #100")
  end
end

feature 'testing event goes under user' do
  scenario 'should create a new event and then edit it' do
    login

    visit root_path
    click_link "Login"
    
    expect(page).to have_link("Sign in with GoogleOauth2")

    click_link "Sign in with GoogleOauth2"
    visit new_event_path
    fill_in 'Event name', with: 'Street Cleanup #5'
    fill_in 'Event location', with: 'Dominik Dr.'
    fill_in 'Event time', with: '08:00 PM'
    fill_in 'Event date', with: '2022-09-10'
    fill_in 'Event type', with: 'Service'
    fill_in 'Event points', with: '1'
    click_on 'Create Event'
    expect(page).to have_content('Street Cleanup #5')
    expect(page).to have_content('Dominik Dr.')
    expect(page).to have_content('Service')
    expect(page).to have_content('1')
    expect(page).to have_content('2022-09-10')
    expect(page).to have_content('20:00')
    click_on 'Edit'
    fill_in 'Event name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to have_content('Street Cleanup #100')
    visit events_path
    click_on 'Confirm Attendance'
    expect(page).to have_content('User:')
    expect(page).to have_content('Event:')
    visit attendances_path
    expect(page).to have_content("Jo")
    expect(page).to have_content("Street Cleanup #100")
    visit events_path
    click_on 'Home'
    click_on 'User Profile'
    expect(page).to have_content("Street Cleanup #100")
  end
end

feature 'testing event deletion deletes attendance' do
  scenario 'should create a new event and then edit it' do
    login

    visit root_path
    click_link "Login"
    
    expect(page).to have_link("Sign in with GoogleOauth2")

    click_link "Sign in with GoogleOauth2"
    visit new_event_path
    fill_in 'Event name', with: 'Street Cleanup #5'
    fill_in 'Event location', with: 'Dominik Dr.'
    fill_in 'Event time', with: '08:00 PM'
    fill_in 'Event date', with: '2022-09-10'
    fill_in 'Event type', with: 'Service'
    fill_in 'Event points', with: '1'
    click_on 'Create Event'
    expect(page).to have_content('Street Cleanup #5')
    expect(page).to have_content('Dominik Dr.')
    expect(page).to have_content('Service')
    expect(page).to have_content('1')
    expect(page).to have_content('2022-09-10')
    expect(page).to have_content('20:00')
    click_on 'Edit'
    fill_in 'Event name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to have_content('Street Cleanup #100')
    visit events_path
    click_on 'Confirm Attendance'
    expect(page).to have_content('User:')
    expect(page).to have_content('Event:')
    visit attendances_path
    expect(page).to have_content("Jo")
    expect(page).to have_content("Street Cleanup #100")
    visit events_path
  end
end

#   RSpec.describe 'Attending an Event', type: :feature do
#     scenario 'valid inputs' do
#       visit new_attendance_path
#       fill_in 'Member', with: 'Jo Smith'
#       fill_in 'Event', with: 'Street Cleanup #5'
#       click_on 'Create Attendance'
#       visit attendances_path
#       expect(page).to have_content('Jo Smith')
#       expect(page).to have_content('Street Cleanup #5')
#     end
#   end