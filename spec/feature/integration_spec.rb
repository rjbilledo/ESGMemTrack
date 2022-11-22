# frozen_string_literal: true

# location: spec/feature/integration_spec.rb
require 'rails_helper'
require 'spec_helper'
def login
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
    provider: 'google_oauth2',
    uid: '12345678910',
    info: {
      email: 'test@gmail.com',
      first_name: 'Jo',
      classification_id: 4,
      id: 1
    },
    credentials: {
      token: 'abcdefg12345',
      refresh_token: 'abcdefg12345',
      expires_at: DateTime.now
    },
    classification_id: 4
  }
                                                                    )
end

feature 'testing user login' do
  scenario 'creates a new user' do
    login
    visit root_path
    click_link 'Login'
    expect(page).to(have_link('Sign in with TAMU Google'))
    click_link 'Sign in with TAMU Google'
    expect(page).to(have_content('Jo'))
  end
end

feature 'testing event creation' do
  scenario 'creates a new event' do
    login
    visit root_path
    click_link 'Login'

    expect(page).to(have_link('Sign in with TAMU Google'))

    click_link 'Sign in with TAMU Google'
    visit new_event_path
    fill_in 'event_event_name', with: 'Street Cleanup #5'
    fill_in 'event_event_location', with: 'Dominik Dr.'
    fill_in 'event_event_time', with: '08:00 PM'
    fill_in 'event_event_date', with: '2022-09-10'
    fill_in 'event_event_points', with: '1'
    click_on 'Create Event'
    expect(page).to(have_content('Street Cleanup #5'))
    expect(page).to(have_content('Dominik Dr.'))
    expect(page).to(have_content('1'))
    expect(page).to(have_content('2022-09-10'))
    expect(page).to(have_content('20:00'))
  end
end

feature 'testing updating an event' do
  scenario 'creates a new event and then edit it' do
    login

    visit root_path
    click_link 'Login'

    expect(page).to(have_link('Sign in with TAMU Google'))

    click_link 'Sign in with TAMU Google'
    # click_link "Edit Profile"
    # fill_in 'Classification:', with: 'President'
    visit new_event_path

    fill_in 'event_event_name', with: 'Street Cleanup #5'
    fill_in 'event_event_location', with: 'Dominik Dr.'
    fill_in 'event_event_time', with: '08:00 PM'
    fill_in 'event_event_date', with: '2022-09-10'
    fill_in 'event_event_points', with: '1'
    click_on 'Create Event'
    expect(page).to(have_content('Street Cleanup #5'))
    expect(page).to(have_content('Dominik Dr.'))
    expect(page).to(have_content('1'))
    expect(page).to(have_content('2022-09-10'))
    expect(page).to(have_content('20:00'))
    click_on 'Edit'
    fill_in 'event_event_name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
  end
end

feature 'testing attendance creation' do
  scenario 'creates a new event and then edit it' do
    login

    visit root_path
    click_link 'Login'

    expect(page).to(have_link('Sign in with TAMU Google'))

    click_link 'Sign in with TAMU Google'
    visit new_event_path
    fill_in 'event_event_name', with: 'Street Cleanup #5'
    fill_in 'event_event_location', with: 'Dominik Dr.'
    fill_in 'event_event_time', with: '08:00 PM'
    fill_in 'event_event_date', with: '2022-09-10'
    fill_in 'event_event_points', with: '1'
    click_on 'Create Event'
    expect(page).to(have_content('Street Cleanup #5'))
    expect(page).to(have_content('Dominik Dr.'))
    expect(page).to(have_content('1'))
    expect(page).to(have_content('2022-09-10'))
    expect(page).to(have_content('20:00'))
    click_on 'Edit'
    fill_in 'event_event_name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Confirm Attendance'
    visit attendances_path
    expect(page).to(have_content('Jo'))
    expect(page).to(have_content('Street Cleanup #100'))
  end
end

feature 'testing name goes under event' do
  scenario 'creates a new event and then edit it' do
    login

    visit root_path
    click_link 'Login'

    expect(page).to(have_link('Sign in with TAMU Google'))

    click_link 'Sign in with TAMU Google'
    visit new_event_path
    fill_in 'event_event_name', with: 'Street Cleanup #5'
    fill_in 'event_event_location', with: 'Dominik Dr.'
    fill_in 'event_event_time', with: '08:00 PM'
    fill_in 'event_event_date', with: '2022-09-10'
    fill_in 'event_event_points', with: '1'
    click_on 'Create Event'
    expect(page).to(have_content('Street Cleanup #5'))
    expect(page).to(have_content('Dominik Dr.'))
    expect(page).to(have_content('1'))
    expect(page).to(have_content('2022-09-10'))
    expect(page).to(have_content('20:00'))
    click_on 'Edit'
    fill_in 'event_event_name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Confirm Attendance'
    visit attendances_path
    expect(page).to(have_content('Jo'))
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Show Details'
    expect(page).to(have_content('Jo'))
    expect(page).to(have_content('Street Cleanup #100'))
  end
end

feature 'testing event goes under user' do
  scenario 'creates a new event and then edit it' do
    login

    visit root_path
    click_link 'Login'

    expect(page).to(have_link('Sign in with TAMU Google'))

    click_link 'Sign in with TAMU Google'
    visit new_event_path
    fill_in 'event_event_name', with: 'Street Cleanup #5'
    fill_in 'event_event_location', with: 'Dominik Dr.'
    fill_in 'event_event_time', with: '08:00 PM'
    fill_in 'event_event_date', with: '2022-09-10'
    fill_in 'event_event_points', with: '1'
    click_on 'Create Event'
    expect(page).to(have_content('Street Cleanup #5'))
    expect(page).to(have_content('Dominik Dr.'))
    expect(page).to(have_content('1'))
    expect(page).to(have_content('2022-09-10'))
    expect(page).to(have_content('20:00'))
    click_on 'Edit'
    fill_in 'event_event_name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Confirm Attendance'
    visit attendances_path
    expect(page).to(have_content('Jo'))
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Home'
    click_on 'Edit Profile'
    expect(page).to(have_content('Street Cleanup #100'))
  end
end

feature 'testing event deletion deletes attendance' do
  scenario 'creates a new event and then edit it' do
    login

    visit root_path
    click_link 'Login'

    expect(page).to(have_link('Sign in with TAMU Google'))

    click_link 'Sign in with TAMU Google'
    visit new_event_path
    fill_in 'event_event_name', with: 'Street Cleanup #5'
    fill_in 'event_event_location', with: 'Dominik Dr.'
    fill_in 'event_event_time', with: '08:00 PM'
    fill_in 'event_event_date', with: '2022-09-10'
    fill_in 'event_event_points', with: '1'
    click_on 'Create Event'
    expect(page).to(have_content('Street Cleanup #5'))
    expect(page).to(have_content('Dominik Dr.'))
    expect(page).to(have_content('1'))
    expect(page).to(have_content('2022-09-10'))
    expect(page).to(have_content('20:00'))
    click_on 'Edit'
    fill_in 'event_event_name', with: 'Street Cleanup #100'
    click_on 'Update Event'
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Confirm Attendance'
    visit attendances_path
    expect(page).to(have_content('Jo'))
    expect(page).to(have_content('Street Cleanup #100'))
    visit events_path
    click_on 'Delete'
    # click_on 'Event Attendance'
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
