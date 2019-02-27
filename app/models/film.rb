class Film < ApplicationRecord
  FILM_PARAMS = %i(name type_films description
                    present status image trailer).freeze

  has_many :schedules, dependent: :destroy
  has_many :rooms, through: :schedules
  has_many :showtimes, through: :schedules
  has_many :tickets, through: :schedules
  mount_uploader :image, PictureUploader

  enum type_films: {"2D": 0, "3D": 1}
  enum status: {new: 0, hot: 1, showing: 2, stop_present: 3}, _suffix: true

  validates :name, presence: true,
    length: {maximum: Settings.max_length_name}
  validates :description, presence: true,
    length: {maximum: Settings.max_length_decription}
  validates :trailer, presence: true
  validates :image, presence: true
end
