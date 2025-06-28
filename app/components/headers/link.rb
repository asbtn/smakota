# frozen_string_literal: true

module Components

  module Headers

    class Link < Components::Base

      include Phlex::Rails::Helpers::LinkTo

      def initialize(name:, path: "", disabled: false)
        @name = name
        @path = path
        @disabled = disabled
      end

      def view_template
        li do
          link_to name, path, class: link_classes
        end
      end

      private

      attr_reader :name, :path, :disabled

      def link_classes
        if disabled
          "opacity-25 text-gray-50 pointer-events-none"
        else
          "text-hippie-pink-50 transition hover:text-hippie-pink-50/75"
        end
      end

    end

  end

end
