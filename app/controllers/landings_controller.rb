class LandingsController < ApplicationController
  skip_before_action :require_authentication

  def show
    render Views::Landings::Show.new
  end
end
