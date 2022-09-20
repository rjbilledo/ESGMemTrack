# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Member, type: :model do
  subject do
    described_class.new(name: 'Jo Smith', grade: 'Freshman', uin: '222222222', email: 'e@w')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Event, type: :model do
    subject do
      described_class.new(event_name: 'Street Cleanup', event_location: 'Freshman', event_type: 'Social', event_points: '1', event_time: '09:00 PM', event_date: '2022-09-00')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end