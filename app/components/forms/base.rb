# frozen_string_literal: true

module Components

  module Forms

    class Base < Components::Base

      def initialize(form:)
        @form = form
      end

      private

      attr_reader :form

    end

  end

end
