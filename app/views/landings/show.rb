class Views::Landings::Show < Views::Base
  include Phlex::Rails::Helpers::SimpleFormat

  register_output_helper :inline_svg_tag

  def view_template
    div(class: "flex grow justify-center") do
      div(class: "flex flex-col w-1/2 justify-center items-end") do
        inline_svg_tag "storyset/eating a variety of foods-bro-animated.svg"
        render Components::StorysetAttribution.new
      end

      div(class: "flex flex-col justify-center ml-10") do
        h1(class: "text-mindaro-500 font-bold leading-none tracking-tight mx-auto w-full text-2xl lg:max-w-3xl lg:text-5xl italic") do
          simple_format t(".title").html_safe
        end

        ul(class: "font-light leading-relaxed mx-auto lg:text-lg text-base max-w-3xl mt-5 list-disc list-inside") do
          li { t ".features.ingredients" }
          li { t ".features.groceries" }
          li { t ".features.recipes" }
          li { t ".features.meal_planning" }
        end

        small(class: "my-3 self-center text-gray-500") do
          plain t ".source_code"
          a(href: "https://github.com/asbtn/smakota", class: "underline") { "Github" }
        end

        render Components::Sessions::Form.new
      end
    end
  end
end
