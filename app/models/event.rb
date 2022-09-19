class Event < ApplicationRecord
    has_many :members, through: :attendances
    has_many :attendances
end
