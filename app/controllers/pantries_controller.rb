# frozen_string_literal: true

class PantriesController < ApplicationController

  def show
    render Views::Pantries::Show
  end

end
