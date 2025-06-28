# frozen_string_literal: true

class Components::Search < Components::Base

  def view_template
    div(class: "relative my-6") do
      input(
        id: "id-s01",
        type: "search",
        name: "id-s01",
        placeholder: "Search here",
        aria_label: "Search content",
        class:
          "relative w-full h-10 px-4 pr-12 text-sm transition-all border-b outline-none focus-visible:outline-none peer border-gray-200 text-gray-500 autofill:bg-white invalid:border-pink-500 invalid:text-pink-500 focus:border-hippie-pink-500 focus:outline-none invalid:focus:border-pink-500 disabled:cursor-not-allowed disabled:bg-gray-50 disabled:text-gray-400"
      )
      svg(
        xmlns: "http://www.w3.org/2000/svg",
        class:
          "absolute top-2.5 right-4 h-5 w-5 cursor-pointer stroke-gray-400 peer-disabled:cursor-not-allowed",
        fill: "none",
        viewbox: "0 0 24 24",
        stroke: "currentColor",
        strokewidth: "1.5",
        aria_hidden: "true",
        aria_label: "Search icon",
        role: "graphics-symbol"
      ) do |s|
        s.path(
          stroke_linecap: "round",
          stroke_linejoin: "round",
          d:
            "M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z"
        )
      end
    end
  end

end
