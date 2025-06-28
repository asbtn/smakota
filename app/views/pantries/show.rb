# frozen_string_literal: true

module Views

  module Pantries

    class Show < Views::Base

      def initialize(pantry_items:)
        @pantry_items = pantry_items
      end

      def view_template
        div class: "m-3" do
          render Components::Search.new
          pantry_items.find_each do |item|
            render Components::Item.new(item: item)
          end
        end
      end

      private

      attr_reader :pantry_items

    end

  end

end
