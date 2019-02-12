class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  SIGNUP_PARAMS = %i(name email password password_confirmation).freeze
  has_many :schedules, through: :tickets
  has_many :tickets

  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  validates :email, presence: true,
    length: {maximum: Settings.max_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    allow_nil: true,
    length: {minimum: Settings.min_length_password}
  has_secure_password
  before_save :downcase_email

  private

  def downcase_email
    email.downcase!
  end
end
