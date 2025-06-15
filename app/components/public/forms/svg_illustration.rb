# frozen_string_literal: true

module Components

  module Public

    module Forms

      class SvgIllustration < Components::Base

      register_output_helper :inline_svg_tag

        def initialize(image_path:)
          @image_path = image_path
        end

        def view_template
          inline_svg_tag image_path, class: "absolute inset-0 h-full w-full object-cover"
          render Components::StorysetAttribution.new
        end

        private

        attr_reader :image_path

      end

    end

  end

end
