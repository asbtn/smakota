class User < ApplicationRecord
  PASSWORD_REGEX = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/

  has_secure_password
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true,
                            format: { with: URI::MailTo::EMAIL_REGEXP },
                            length: { minimum: 3 }

  validates :name, presence: true,
                   length: { minimum: 3, maximum: 256 }

  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }
end
