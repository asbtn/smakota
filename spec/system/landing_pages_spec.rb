# frozen_string_literal: true

require "rails_helper"

RSpec.describe "LandingPages" do
  before do
    driven_by(:rack_test)
  end

  context "when user exists" do
    let(:password) { Faker::Internet.password }
    let(:user) { create(:user, password:) }

    it "log in user" do
      visit landing_path

      fill_in "email_address", with: user.email_address
      fill_in "password",	with: password

      click_button "commit"

      expect(page).to have_current_path root_path
    end
  end

  context "when user does not exists" do
    it "redirect to sign in path" do
      visit landing_path

      fill_in "email_address", with: Faker::Internet.email
      fill_in "password",	with: Faker::Internet.password

      click_button "commit"

      expect(page).to have_current_path new_session_path
      expect(page).to have_content I18n.t("sessions.create.invalid_credentials")
    end
  end
end
