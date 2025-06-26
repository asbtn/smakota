# frozen_string_literal: true

module Components

  module Headers

    class Logo < Components::Base

      register_output_helper :inline_svg_tag
      include Phlex::Rails::Helpers::LinkTo

      def view_template
        div class: "flex-1 md:flex md:items-center md:gap-12" do
          link_to root_path, class: "block text-hippie-pink-600" do
            inline_svg_tag "logo.svg",
                           class: "h-8",
                           aria_hidden: true,
                           role: "img"
          end
        end
      end

    end

  end

end
