# location: spec/feature/integration_spec.rb
require 'rails_helper'

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

RSpec.describe 'Creating an event', type: :feature do
    scenario 'valid inputs' do
      visit new_event_path
      fill_in 'Event name', with: 'Street Cleanup #5'
      fill_in 'Event location', with: 'Dominik Dr.'
      fill_in 'Event time', with: '08:00 PM'
      fill_in 'Event date', with: '2022-09-10'
      fill_in 'Event type', with: 'Service'
      fill_in 'Event points', with: '1'
      click_on 'Create Event'
      visit events_path
      expect(page).to have_content('Street Cleanup #5')
      expect(page).to have_content('Dominik Dr.')
      expect(page).to have_content('Service')
      expect(page).to have_content('1')
      expect(page).to have_content('2022-09-10')
      expect(page).to have_content('20:00')
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