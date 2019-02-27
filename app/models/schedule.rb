class Schedule < ApplicationRecord
  SCHEDULE_PARAMS = %i(showtime room_id).freeze

  belongs_to :film
  belongs_to :room
  has_many :tickets

  has_many :seats, through: :room

  enum type_schedules: {"P1": 1, "P2": 2, "P3": 3, "P4": 4, "P5": 5}
end
