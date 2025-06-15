# frozen_string_literal: true

module Components

  module Public

    module Forms

      class SplitLayout < Components::Base

        def initialize(left_half:, right_half:)
          @left_half = left_half
          @right_half = right_half
        end

        def view_template
          section class: "relative flex flex-wrap lg:h-screen lg:items-center" do
            render_left_half
            render_right_half
          end
        end

        private

        attr_reader :left_half, :right_half

        def render_left_half
          div class: "w-full px-4 py-12 sm:px-6 sm:py-16 lg:w-1/2 lg:px-8 lg:py-24" do
            left_half.call
          end
        end

        def render_right_half
          div class: "relative h-64 w-full sm:h-96 lg:h-full lg:w-1/2 items-end" do
            right_half.call
          end
        end

      end

    end

  end

end
