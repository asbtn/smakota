# frozen_string_literal: true

module Views
  module Registrations
    class New < Views::Base
      include Phlex::Rails::Helpers::ImageTag
      include Phlex::Rails::Helpers::FormFor
      include Phlex::Rails::Helpers::SimpleFormat

      def initialize(user:)
        @user = user
      end

      def view_template
        section class: "relative flex flex-wrap lg:h-screen lg:items-center" do
          render_left_half
          render_right_half
        end
      end

      private

      attr_reader :user

      def render_left_half
        div class: "w-full px-4 py-12 sm:px-6 sm:py-16 lg:w-1/2 lg:px-8 lg:py-24" do
          div class: "mx-auto max-w-lg text-center mb-5" do
            render Components::Typography::Title.new t(".title")

            p(class: "font-light leading-relaxed mx-auto lg:text-lg text-base max-w-3xl mb-5") { t ".description" }

            render_form
          end
        end
      end

      def render_right_half
        div class: "relative h-64 w-full sm:h-96 lg:h-full lg:w-1/2 items-end" do
          image_tag "storyset/Deconstructed food-bro.svg", class: "absolute inset-0 h-full w-full object-cover"
          render Components::StorysetAttribution.new
        end
      end

      def render_form
        div class: "mx-auto max-w-md text-center" do
          form_for user, url: registrations_path, html: { class: "grid grid-cols-6 gap-6" } do |form|
            render_form_inputs(form)
            render_form_footer(form)
          end
        end
      end

      def render_form_inputs(form)
        div class: "col-span-6" do
          render Components::Form::Input.new(form:, attribute: :name, field: :text, required: true)
        end
        div class: "col-span-6" do
          render Components::Form::Input.new(form:, attribute: :email_address, field: :email, required: true,
                                             icon: true)
        end
        div class: "col-span-6 sm:col-span-3" do
          render Components::Form::Input.new(form:, attribute: :password, required: true, icon: true)
        end
        div class: "col-span-6 sm:col-span-3" do
          render Components::Form::Input.new(form:, attribute: :password_confirmation, field: :password, required: true,
                                             icon: true)
        end
      end

      def render_form_footer(form)
        div class: "col-span-6 flex justify-between items-center" do
          p class: "text-sm text-gray-500" do
            plain t(".has_account")
            whitespace
            a(href: new_session_path, class: "underline") { t ".log_in" }
          end

          render Components::Form::Submit.new(form:, action: :sign_up)
        end
      end
    end
  end
end
