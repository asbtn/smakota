# frozen_string_literal: true

class PantriesController < ApplicationController

  def show
    pantry_items = Current.user.pantry_items.includes(item: :category)

    render Views::Pantries::Show.new(pantry_items:)
  end

end
