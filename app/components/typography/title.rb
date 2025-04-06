# frozen_string_literal: true

module Components
  module Typography
    class Title < Components::Base
      include Phlex::Rails::Helpers::SimpleFormat

      def initialize(content)
        @content = content
      end

      def view_template
        h1 class: "text-mindaro-500 font-bold leading-none tracking-tight mx-auto w-full" \
                  "text-2xl lg:max-w-3xl lg:text-5xl italic mb-5" do
          simple_format content
        end
      end

      private

      attr_reader :content
    end
  end
end
