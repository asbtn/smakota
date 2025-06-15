# frozen_string_literal: true

module Views

  module Sessions

    class Form < Components::Base

      include Phlex::Rails::Helpers::FormWith
      include Phlex::Rails::Helpers::Routes

      register_output_helper :inline_svg_tag

      def view_template
        form_with url: session_path, class: "mb-0 max-w-md space-y-4" do |form|
          render_form_inputs(form)
          render_form_footer(form)
        end
      end

      private

      def render_form_inputs(form)
        render Components::Forms::Inputs::Email.new(form:)
        render Components::Forms::Inputs::Password.new(form:)
      end

      def render_form_footer(form)
        render Components::Forms::Footer.new(form:, action: :log_in) do
          t(".forgot_password_or_sign_up",
            forgot_password_link: new_password_path,
            sign_up_link: new_registration_path).html_safe
        end
      end

    end

  end

end
