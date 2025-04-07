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
require "rails_helper"

RSpec.describe User do
  subject { build(:user) }

  describe "associations" do
    it { is_expected.to have_many(:sessions).dependent(:destroy) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:email_address) }
    it { is_expected.to allow_value("test@example.com").for(:email_address) }
    it { is_expected.not_to allow_value("invalid-email").for(:email_address) }
    it { is_expected.to validate_length_of(:email_address).is_at_least(3) }

    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(3).is_at_most(256) }

    it { is_expected.to validate_length_of(:password).is_at_least(6) }
    it { is_expected.to allow_value("Password1").for(:password) }
    it { is_expected.not_to allow_value("short").for(:password) }
    it { is_expected.not_to allow_value("nocapital1").for(:password) }
    it { is_expected.not_to allow_value("NOLOWERCASE1").for(:password) }
    it { is_expected.not_to allow_value("NoNumber").for(:password) }
  end

  describe "normalizations" do
    it "normalizes email address before saving" do
      user = build(:user, email_address: " TEST@EXAMPLE.COM ")
      user.valid?

      expect(user.email_address).to eq("test@example.com")
    end
  end

  describe "secure password" do
    it { is_expected.to have_secure_password }
  end
end
