# frozen_string_literal: true

# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe(User, type: :model) do
  subject(:create) do
    described_class.new(full_name: 'Jo Smith', grade: 'Freshman', uin: '222222222', email: 'e@w', password: '123asdfa')
  end

  it 'is valid with valid attributes' do
    expect(create).to(be_valid)
  end

  it 'is not valid without a password' do
    create.password = nil
    expect(create).not_to(be_valid)
  end
end

RSpec.describe(Event, type: :model) do
  subject(:createevent) do
    described_class.new(event_name: 'Street Cleanup', event_location: 'Freshman', event_type: 'Social', event_points: '1', event_time: '09:00 PM', event_date: '2022-09-00')
  end

  it 'is valid with valid attributes' do
    expect(createevent).to(be_valid)
  end
end
