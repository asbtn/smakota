# frozen_string_literal: true

module Components

  module Forms

    class Icon < Base

      register_output_helper :inline_svg_tag

      def initialize(form:, attribute:, error:)
        super(form:)
        @attribute = attribute
        @error = error
      end

      def view_template
        span class: "absolute inset-y-0 end-0 grid place-content-center px-4" do
          inline_svg_tag "icons/#{attribute}.svg",
                         class: error ? "text-rose-700" : "text-mindaro-700"
        end
      end

      private

      attr_reader :attribute, :error

    end

  end

end
