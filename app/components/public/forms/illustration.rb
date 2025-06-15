# frozen_string_literal: true

module Components

  module Public

    module Forms

      class Illustration < Components::Base

        include Phlex::Rails::Helpers::ImageTag

        def initialize(image_path:)
          @image_path = image_path
        end

        def view_template
          image_tag image_path, class: "absolute inset-0 h-full w-full object-cover"
          render Components::StorysetAttribution.new
        end

        private

        attr_reader :image_path

      end

    end

  end

end
