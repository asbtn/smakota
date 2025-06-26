# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Passwords" do
  describe "GET #new" do
    it "renders the new template" do
      get "/passwords/new"

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    let(:user) { create(:user) }

    context "when the email exists" do
      it "sends a password reset email" do
        expect { post "/passwords", params: { email_address: user.email_address } }
          .to have_enqueued_mail(PasswordsMailer, :reset).with(user)
      end

      it "redirects to the new session path" do
        post "/passwords", params: { email_address: user.email_address }

        expect(response).to redirect_to(new_session_path)
      end
    end

    context "when the email does not exist" do
      it "does not send a password reset email" do
        expect { post "/passwords", params: { email_address: Faker::Internet.email } }
          .not_to have_enqueued_mail(PasswordsMailer, :reset)
      end

      it "redirects to the new session path with a notice" do
        post "/passwords", params: { email_address: Faker::Internet.email }

        expect(response).to redirect_to(new_session_path)
      end
    end
  end

  describe "GET #edit" do
    let(:user) { create(:user) }

    context "when the token is valid" do
      it "renders the edit template" do
        get "/passwords/#{user.password_reset_token}/edit"

        expect(response).to be_successful
      end
    end

    context "when the token is invalid" do
      it "redirects to the new password path" do
        get "/passwords/invalid_token/edit"

        expect(response).to redirect_to(new_password_path)
      end
    end
  end

  describe "PATCH #update" do
    let(:password) { Faker::Internet.password }
    let(:user) { create(:user) }

    context "when the password is valid" do
      it "redirects to the new session path" do
        patch "/passwords/#{user.password_reset_token}", params: { password: password, password_confirmation: password }

        expect(response).to redirect_to(new_session_path)
      end

      it "updates user password" do
        patch "/passwords/#{user.password_reset_token}", params: { password: password, password_confirmation: password }

        expect(user.reload.authenticate(password)).to be_truthy
      end
    end

    context "when the password is invalid" do
      it "does not update the user password and redirects to the edit password path with an alert" do
        patch "/passwords/valid_token", params: { password: "password1!", password_confirmation: "password" }

        expect(response).to redirect_to(new_password_path)
      end
    end
  end
end
