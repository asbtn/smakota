# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Dashboards" do
  include AuthHelper

  describe "GET #show" do
    context "when user is logged in" do
      let(:user) { create(:user) }

      before do
        login_as(user)
      end

      it "opens page" do
        get "/dashboard"

        expect(response).to be_successful
      end
    end
  end
end
