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
        div class: "group relative inline-block focus:ring-3 focus:outline-hidden" do
          button_to name, path,
                    method:,
                    class: "cursor-pointer relative inline-block border-1 border-current px-5 py-2 " \
                           "text-sm font-bold tracking-widest text-gray uppercase",
                    form: { class: "inline" }
        end
      end

      private

      attr_reader :name, :path, :method

    end

  end

end
