require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    check "Active" if @event.active
    fill_in "Event date", with: @event.event_date
    fill_in "Event location", with: @event.event_location
    fill_in "Event name", with: @event.event_name
    fill_in "Event points", with: @event.event_points
    fill_in "Event time", with: @event.event_time
    fill_in "Event type", with: @event.event_type
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    check "Active" if @event.active
    fill_in "Event date", with: @event.event_date
    fill_in "Event location", with: @event.event_location
    fill_in "Event name", with: @event.event_name
    fill_in "Event points", with: @event.event_points
    fill_in "Event time", with: @event.event_time
    fill_in "Event type", with: @event.event_type
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
