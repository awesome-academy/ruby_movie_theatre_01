class Room < ApplicationRecord
  has_many :schedules
  has_many :films, through: :schedules
  has_many :seats
  has_many :showtimes, through: :schedules
  has_many :tickets, through: :schedules
end
