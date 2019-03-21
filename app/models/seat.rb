class Seat < ApplicationRecord
  belongs_to :room
  has_many :tickets
end
