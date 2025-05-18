# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Sessions" do
  include AuthHelper

  describe "GET #new" do
    context "when user is not authenticated" do
      it "renders the new template" do
        get "/session/new"

        expect(response).to be_successful
      end
    end

    context "when user is authenticated" do
      let(:user) { create(:user) }

      before do
        login_as(user)
      end

      it "redirects to dashboard" do
        get "/session/new"

        expect(response).to redirect_to(dashboard_path)
      end
    end
  end

  describe "POST #create" do
    let(:user) { create(:user, password: "Password123") }

    context "with valid credentials" do
      let(:params) { { email_address: user.email_address, password: "Password123" } }

      it "redirects to root path" do
        post "/session", params: params

        expect(response).to redirect_to(root_path)
      end
    end

    context "with invalid credentials" do
      let(:params) { { email_address: user.email_address, password: "wrongpassword" } }

      it "redirects to new session path" do
        post "/session", params: params

        expect(response).to redirect_to("/session/new")
      end

      it "sets alert flash" do
        post "/session", params: params

        expect(flash[:alert]).to be_present
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { create(:user) }

    before do
      login_as(user)
    end

    it "redirects to new session path" do
      delete "/session"

      expect(response).to redirect_to("/session/new")
    end
  end
end
