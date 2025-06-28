# frozen_string_literal: true

module Components

  module Headers

    class Button < Components::Base

      include Phlex::Rails::Helpers::LinkTo
      include Phlex::Rails::Helpers::ButtonTo

      def initialize(name:, path: "", method: :get)
        @name   = name
        @path   = path
        @method = method.to_sym
      end

      def view_template
        button_to name, path,
                  method:,
                  class: "rounded-md bg-gray-100 px-5 py-2.5 text-sm font-medium text-hippie-pink-600 hover:bg-gray-200",
                  form: { class: "inline" }
      end

      private

      attr_reader :name, :path, :method

    end

  end

end
