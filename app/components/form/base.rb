# frozen_string_literal: true

module Components
  module Form
    class Base < Components::Base
      def initialize(**options)
        @form = options[:form]
      end

      private

      attr_reader :form
    end
  end
end
