# frozen_string_literal: true

module Views

  module Passwords

    class Edit < Views::Base

      include Phlex::Rails::Helpers::FormWith
      include Phlex::Rails::Helpers::Flash

      def initialize(token)
        @token = token
      end

      def view_template
        render Components::Public::TwoColumnsLayout.new(left_column:, right_column:)
      end

      private

      attr_reader :token

      def left_column
        lambda {
          render Components::Public::FormWrapper.new(title: t(".title"), flash:) do
            render_form
          end
        }
      end

      def right_column
        lambda {
          render Components::Public::SvgIllustration.new(image_path: "storyset/My password-bro.svg")
        }
      end

      def render_form
        form_with url: password_path(token), method: :put, class: "mb-0 max-w-md space-y-4 justify-center" do |form|
          render_form_inputs(form)
          render_form_footer(form)
        end
      end

      def render_form_inputs(form)
        render Components::Forms::Inputs::Password.new(form:)
        render Components::Forms::Inputs::PasswordConfirmation.new(form:)
      end

      def render_form_footer(form)
        render Components::Forms::Footer.new(form:, action: :send) do
          a(href: new_session_path, class: "underline") { t ".log_in" }
        end
      end

    end

  end

end
