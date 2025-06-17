# frozen_string_literal: true

module Views

  module Sessions

    class New < Views::Base

      include Phlex::Rails::Helpers::Flash

      def view_template
        render Components::Public::TwoColumnsLayout.new(left_column:, right_column:)
      end

      private

      def right_column
        lambda {
          render Components::Public::SvgIllustration.new(image_path: "storyset/Mobile login-bro.svg")
        }
      end

      def left_column
        lambda {
          render Components::Public::FormWrapper.new(title: t(".title"), flash:) do
            render Views::Sessions::Form.new
          end
        }
      end

    end

  end

end
