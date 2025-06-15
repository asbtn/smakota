# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email_address   :string           not null
#  name            :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#
class User < ApplicationRecord

  # == Extensions ===========================================================
  has_secure_password

  # == Constants ============================================================
  PASSWORD_REGEX = /\A(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}\z/

  # == Attributes ===========================================================

  # == Relationships ========================================================
  has_many :sessions, dependent: :destroy

  # == Validations ==========================================================
  validates :email_address, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, length: { minimum: 3 },
                            uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: { minimum: 3, maximum: 256 }
  validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX }

  # == Scopes ===============================================================

  # == Callbacks ============================================================

  # == Class Methods ========================================================

  # == Instance Methods =====================================================
  normalizes :email_address, with: ->(e) { e.strip.downcase }

end
