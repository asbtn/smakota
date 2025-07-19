# frozen_string_literal: true

module Components

  module Pantries

    class Item < Components::Base

      def initialize(item:)
        @item = item
      end

      def view_template
        details(
          class:
            "mb-2 group shadow-backdrop border-1 border-current bg-hippie-pink-50 p-4 [&_summary::-webkit-details-marker]:hidden",
          open: false
        ) do
          summary(class: "flex items-center justify-between gap-1.5 text-gray-900 justify-between") do
            span(class: "mr-2") { item.category.name }

            p(class: "text-md font-medium leading-relaxed mr-auto") do
              plain item.name
            end
            span(class: "text-gray-900 italic") { "#{Faker::Number.digit} #{t(".#{item.unit}")}" }
          end
        end
      end

      private

      attr_reader :item

    end

  end

end
