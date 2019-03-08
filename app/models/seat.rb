class Seat < ApplicationRecord
  belongs_to :room
  has_many :ticket
end
