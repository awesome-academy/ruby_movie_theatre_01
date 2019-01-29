class Showtime < ApplicationRecord
  has_many :schedules
  has_many :films, through: :schedules
  has_many :rooms, through: :schedules
  has_many :tickets, through: :schedules
end
