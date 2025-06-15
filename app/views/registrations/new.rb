# frozen_string_literal: true

module Views

  module Registrations

    class New < Views::Base

      include Phlex::Rails::Helpers::FormFor
      include Phlex::Rails::Helpers::Flash

      def initialize(user:)
        @user = user
      end

      def view_template
        render Components::Public::Forms::SplitLayout.new(left_half:, right_half:)
      end

      private

      attr_reader :user

      def left_half
        lambda {
          render Components::Public::Forms::FormWrapper.new(title: t(".title"), flash:) do
            p(class: "font-light leading-relaxed mx-auto lg:text-lg text-base max-w-3xl mb-5") { t ".description" }

            render_form
          end
        }
      end

      def right_half
        lambda {
          render Components::Public::Forms::Illustration.new(image_path: "storyset/Deconstructed food-bro.svg")
        }
      end

      def render_form
        div class: "mx-auto max-w-md text-center" do
          form_for user, url: registration_path, html: { class: "grid grid-cols-6 gap-6" } do |form|
            render_form_inputs(form)
            render_form_footer(form)
          end
        end
      end

      def render_form_inputs(form)
        div class: "col-span-6" do
          render Components::Forms::Input.new(form:, attribute: :name, required: true)
        end
        div class: "col-span-6" do
          render Components::Forms::Inputs::Email.new(form:)
        end
        div class: "col-span-6 sm:col-span-3" do
          render Components::Forms::Inputs::Password.new(form:)
        end
        div class: "col-span-6 sm:col-span-3" do
          render Components::Forms::Inputs::PasswordConfirmation.new(form:)
        end
      end

      def render_form_footer(form)
        render Components::Forms::Footer.new(form:, action: :sign_up) do
          p class: "text-sm text-gray-500" do
            plain t(".has_account")
            whitespace
            a(href: new_session_path, class: "underline") { t ".log_in" }
          end
        end
      end

    end

  end

end
