# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Registrations" do
  describe "POST #create" do
    context "when user is valid" do
      it "logs in and redirects to dashboard path" do
        post "/registration", params: { user: attributes_for(:user) }

        expect(response).to redirect_to(dashboard_path)
      end
    end

    context "when user is invalid" do
      it "returns unprocessable entity" do
        post "/registration", params: { user: attributes_for(:user).except(:password) }

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
