class User < ApplicationRecord
  has_many :schedules, through: :tickets
  has_many :tickets
end
