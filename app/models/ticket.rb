class Ticket < ApplicationRecord
  TICKET_PARAMS = %i(user_id schedule_id).freeze

  belongs_to :schedule
  belongs_to :user
  belongs_to :seat
  validates_uniqueness_of :seat_id, scope: [:schedule_id]
end
