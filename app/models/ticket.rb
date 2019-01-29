class Ticket < ApplicationRecord
  belongs_to :schedule
  belongs_to :user
  has_one :seat
end
