# frozen_string_literal: true

module Components
  module Form
    class Label < Components::Form::Base
      def initialize(**options)
        super
        @attribute = options[:attribute]
      end

      def view_template
        form.label attribute, class: "sr-only"
      end

      private

      attr_reader :attribute
    end
  end
end
