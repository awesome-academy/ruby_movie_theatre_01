class Ticket < ApplicationRecord
  TICKET_PARAMS = %i(user_id schedule_id).freeze

  belongs_to :schedule
  belongs_to :user
  belongs_to :seat
end
