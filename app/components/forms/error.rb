# frozen_string_literal: true

module Components

  module Forms

    class Error < Base

      def initialize(form:, error:)
        @form = form
        @error = error
      end

      def view_template
        small(class: "text-rose-300 italic") { error.first }
      end

      private

      attr_reader :error, :form

    end

  end

end
