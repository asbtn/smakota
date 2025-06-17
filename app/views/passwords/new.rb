# frozen_string_literal: true

module Views

  module Passwords

    class New < Views::Base

      include Phlex::Rails::Helpers::FormWith
      include Phlex::Rails::Helpers::Flash

      def view_template
        render Components::Public::TwoColumnsLayout.new(right_column:, left_column:)
      end

      private

      def left_column
        lambda {
          render Components::Public::SvgIllustration.new(image_path: "storyset/Forgot password-bro.svg")
        }
      end

      def right_column
        lambda {
          render(Components::Public::FormWrapper.new(title: t(".title")) { render_form })
        }
      end

      def render_form
        form_with url: passwords_path, class: "mb-0 max-w-md space-y-4 justify-center" do |form|
          render_form_inputs(form)
          render_form_footer(form)
        end
      end

      def render_form_inputs(form)
        render Components::Forms::Inputs::Email.new(form:)
      end

      def render_form_footer(form)
        render Components::Forms::Footer.new(form:, action: :send) do
          a(href: new_session_path, class: "underline") { t ".log_in" }
        end
      end

    end

  end

end
