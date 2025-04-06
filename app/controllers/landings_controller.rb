# frozen_string_literal: true

class LandingsController < ApplicationController
  allow_unauthenticated_access
  rate_limit to: 100, within: 3.minutes, with: -> { redirect_to landing_path, alert: t("shared.try_again_later") }
  redirect_if_authenticated

  def show
    render Views::Landings::Show.new
  end
end
