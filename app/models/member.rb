# frozen_string_literal: true

class Member < ApplicationRecord
  has_many :events, through: :attendances
  has_many :attendances

  validates :name, presence: true
end
