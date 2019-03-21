class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  PHONENUMBER_REGEX = /[0-9]{3}-[0-9]{3}-[0-9]{4}/
  SIGNUP_PARAMS = %i(name email phone password password_confirmation).freeze
  attr_accessor :remember_token
  has_many :tickets

  validates :name, presence: true, length: {maximum: Settings.max_length_name}
  validates :email, presence: true,
    length: {maximum: Settings.max_length_email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    allow_nil: true,
    length: {minimum: Settings.min_length_password}
  validates :phone, format: {with: PHONENUMBER_REGEX},
    length: {maximum: Settings.max_length_phonenumber}
  has_secure_password
  before_save :downcase_email

  class << self
    def digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    @remember_token = User.new_token
    update remember_digest: User.digest(@remember_token)
  end

  def forget
    update remember_digest: nil
  end

  def current_user? current_user
    self == current_user
  end

  def authenticated? attribute, token
    digest = send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password? token
  end

  private

  def downcase_email
    email.downcase!
  end
end
