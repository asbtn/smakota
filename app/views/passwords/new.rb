# frozen_string_literal: true

module Views

  module Passwords

    class New < Views::Base

      include Phlex::Rails::Helpers::FormWith
      include Phlex::Rails::Helpers::Flash

      def view_template
        render Components::Public::Forms::Layout.new(right_half:, left_half:)
      end

    private

    def left_half
      lambda {
        render Components::Public::Forms::Illustration.new(image_path: "storyset/Forgot password-bro.svg")
      }
    end

    def right_half
      lambda {
        render Components::Public::Forms::FormWrapper.new do
          render_form
        end
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
      div class: "flex items-center justify-between" do
        render Components::Forms::Footer.new do
          a(href: new_session_path, class: "underline") { t ".login" }
        end

        render Components::Forms::Submit.new(form:, action: :send)
      end
    end

  end

end
