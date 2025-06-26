# frozen_string_literal: true

module Public

  class LandingsController < ApplicationController

    def show
      render Views::Landings::Show.new
    end

  end

end
