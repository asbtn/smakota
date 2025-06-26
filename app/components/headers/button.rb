# frozen_string_literal: true

module Components

  module Headers

    class Button < Components::Base

      include Phlex::Rails::Helpers::LinkTo

      def initialize(name:, path: "")
        @name = name
        @path = path
      end

      def view_template
        link_to name, path, class: "rounded-md bg-gray-100 px-5 py-2.5 text-sm font-medium text-hippie-pink-600"
      end

      private

      attr_reader :name, :path

    end

  end

end
