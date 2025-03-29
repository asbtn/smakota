class LandingsController < ApplicationController
  skip_before_action :require_authentication

  before_action :redirect_to_dashboard, if: :authenticated?

  def show
    render Views::Landings::Show.new
  end

  private

  def redirect_to_dashboard
    redirect_to dashboard_path
  end
end
