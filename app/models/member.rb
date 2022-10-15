class Member < ApplicationRecord
    has_many :events, through: :attendances
    has_many :attendancesasdas

    validates :name, presence: true
end
