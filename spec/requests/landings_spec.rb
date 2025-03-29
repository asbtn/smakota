require "rails_helper"

RSpec.describe "Landings" do
  include AuthHelper

  describe "GET #show" do
    context "when user is not authenticated" do
      it "is successful" do
        get landing_path

        expect(response).to be_successful
      end
    end

    context "when user is authenticated" do
      let(:user) { create(:user) }

      before do
        login_as(user)
      end

      it "redirects to the dashboard" do
        get landing_path

        expect(response).to redirect_to(dashboard_path)
      end
    end
  end
end
