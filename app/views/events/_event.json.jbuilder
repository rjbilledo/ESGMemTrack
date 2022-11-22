# frozen_string_literal: true

json.extract!(event, :id, :event_name, :event_location, :event_time, :event_date, :event_type, :event_points, :active, :created_at, :updated_at)
json.url(event_url(event, format: :json))
