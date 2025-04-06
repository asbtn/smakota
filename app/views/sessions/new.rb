# frozen_string_literal: true

module Views
  module Sessions
    class New < Views::Base
      include Phlex::Rails::Helpers::Flash
      include Phlex::Rails::Helpers::ImageTag

      def view_template
        section class: "relative flex flex-wrap lg:h-screen lg:items-center" do
          render_right_half
          render_left_half
        end
      end

      private

      def render_right_half
        div class: "relative h-64 w-full sm:h-96 lg:h-full lg:w-1/2 items-end" do
          image_tag "storyset/Mobile login-bro.svg", class: "absolute inset-0 h-full w-full object-cover"
          render Components::StorysetAttribution.new
        end
      end

      def render_left_half
        div class: "w-full px-4 py-12 sm:px-6 sm:py-16 lg:w-1/2 lg:px-8 lg:py-24" do
          div class: "mx-auto md:w-2/3 w-full" do
            render Components::Flash.new flash
            render Components::Typography::Title.new t(".title")
            render Views::Sessions::Form.new
          end
        end
      end
    end
  end
end
