class Member < ApplicationRecord
    has_many :events, through: :attendances
    has_many :attendances
end
