# frozen_string_literal: true

module Components

  module Headers

    class Link < Components::Base

      include Phlex::Rails::Helpers::LinkTo

      def initialize(name:, path: "")
        @name = name
        @path = path
      end

      def view_template
        li do
          link_to name, path, class: "text-hippie-pink-50 transition hover:text-hippie-pink-50/75"
        end
      end

      private

      attr_reader :name, :path

    end

  end

end
