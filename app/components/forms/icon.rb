# frozen_string_literal: true

module Components

  module Forms

    class Icon < Base

      register_output_helper :inline_svg_tag

      def initialize(form:, type:, error:)
        super(form:)
        @type = type
        @error = error
      end

      def view_template
        span class: "absolute inset-y-0 end-0 grid place-content-center px-4" do
          inline_svg_tag "icons/#{type}.svg",
                         class: error ? "text-rose-700" : "text-hippie-pink-700"
        end
      end

      private

      attr_reader :type, :error

    end

  end

end
