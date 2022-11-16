class Event < ApplicationRecord
    has_many :members, through: :attendances
    has_many :attendances

    validates :event_name, :presence => true
    validates :event_points, :presence => true
end
