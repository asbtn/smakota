# frozen_string_literal: true

class Components::Item < Components::Base

  def initialize(item:)
    @item = item
  end

  def view_template
    details(
      class:
        "mb-2 rounded-lg cursor-pointer group shadow bg-hippie-pink-50 p-4 [&_summary::-webkit-details-marker]:hidden",
      open: false
    ) do
      summary(class: "flex items-center justify-between gap-1.5 text-gray-900 justify-between") do
        span(class: "mr-2") { item.category.icon `` }

        p(class: "text-md font-medium leading-relaxed mr-auto") do
          plain item.name
        end
        span(class: "text-gray-900 italic") { "#{Faker::Number.digit} #{t(".#{item.unit}")}" }
      end
      p(class: "pt-4 text-hippie-pink-900") do
        div(class: "flow-root") do
          dl(class: "-my-3 divide-y divide-hippie-pink-200 text-sm *:even:bg-hippie-pink-50") do
            item.nutrition.each do |(key, value)|
              div(class: "grid grid-cols-1 gap-1 p-3 sm:grid-cols-3 sm:gap-4") do
                dt(class: "font-medium text-gray-900") { t(".nutrition.#{key}") }
                dd(class: "text-hippie-pink-700 sm:col-span-2") { value }
              end
            end
          end
        end
      end
    end
  end

  private

  attr_reader :item

end
