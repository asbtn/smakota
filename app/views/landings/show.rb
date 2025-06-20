# frozen_string_literal: true

module Views

  module Landings

    class Show < Views::Base

      register_output_helper :inline_svg_tag

      def view_template
        div class: "flex grow justify-center" do
          render_left_column
          render_right_column
        end
      end

      private

      def render_left_column
        div class: "flex flex-col w-1/2 justify-center items-end" do
          inline_svg_tag "storyset/eating a variety of foods-bro-animated.svg"
          render Components::StorysetAttribution.new
        end
      end

      def render_right_column
        div class: "flex flex-col justify-center ml-10" do
          render Components::Typography::Title.new t(".title").html_safe

          render_features
          render_github_link

          render Views::Sessions::Form.new
        end
      end

      def render_features
        ul class: "font-light leading-relaxed mx-auto lg:text-lg text-base max-w-3xl list-disc list-inside" do
          li { t ".features.ingredients" }
          li { t ".features.groceries" }
          li { t ".features.recipes" }
          li { t ".features.meal_planning" }
        end
      end

      def render_github_link
        small class: "my-3 self-center text-gray-500" do
          plain t ".source_code"
          a(href: "https://github.com/asbtn/smakota", class: "underline") { "Github" }
        end
      end

    end

  end

end
