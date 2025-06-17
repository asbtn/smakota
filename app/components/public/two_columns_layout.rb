# frozen_string_literal: true

module Components

  module Public

    class TwoColumnsLayout < Components::Base

      def initialize(left_column:, right_column:)
        @left_column = left_column
        @right_column = right_column
      end

      def view_template
        section class: "relative flex flex-wrap lg:h-screen lg:items-center" do
          left_column.call
          right_column.call
        end
      end

      private

      attr_reader :left_column, :right_column

    end

  end

end
