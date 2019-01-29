class Seat < ApplicationRecord
  belongs_to :room
  belongs_to :ticket
end
