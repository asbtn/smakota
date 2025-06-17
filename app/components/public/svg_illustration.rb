# frozen_string_literal: true

module Components

  module Public

    class SvgIllustration < Components::Base

      register_output_helper :inline_svg_tag

      def initialize(image_path:)
        @image_path = image_path
      end

      def view_template
        div class: "relative h-64 w-full sm:h-96 lg:h-full lg:w-1/2 items-end" do
          inline_svg_tag image_path, class: "absolute inset-0 h-full w-full object-cover"
          render Components::StorysetAttribution.new
        end
      end

      private

      attr_reader :image_path

    end

  end

end
