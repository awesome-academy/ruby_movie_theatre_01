class Schedule < ApplicationRecord
  belongs_to :film
  belongs_to :room
  belongs_to :showtime
  has_many :tickets
end
