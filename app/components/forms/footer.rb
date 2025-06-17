# frozen_string_literal: true

module Components

  module Forms

    class Footer < Components::Forms::Base

      def initialize(form:, action:)
        super(form:)
        @action = action
      end

      def view_template(&)
        div class: "flex flex-row col-span-6 items-center justify-between" do
          p(class: "text-sm text-gray-500", &)

          render Components::Forms::Submit.new(form:, action:)
        end
      end

      private

      attr_reader :action

    end

  end

end
