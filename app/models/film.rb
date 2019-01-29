class Film < ApplicationRecord
  has_many :schedules, dependent: :destroy
  has_many :rooms, through: :schedules
  has_many :showtimes, through: :schedules
  has_many :tickets, through: :schedules
end
