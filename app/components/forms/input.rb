# frozen_string_literal: true

module Components

  module Forms

    class Input < Base

      def initialize(
        form:,
        attribute:,
        as: :text,
        icon: nil,
        required: false
      )
        super(form:)
        @attribute = attribute
        @type = as
        @icon = icon
        @required = required
      end

      def view_template
        div do
          render Label.new(form: form, attribute: attribute)

          div class: "group w-full relative inline-block focus:ring-3 focus:outline-hidden" do
            render_backdrop
            render_field
            render_icon
          end

          render_error
        end
      end

      private

      attr_reader :attribute, :type, :icon, :required

      delegate :text_field,
               :email_field,
               :password_field,
               to: :form

      def resource
        form.object
      end

      def errors
        resource.errors
      end

      def error
        @error ||= errors[attribute].presence&.first if resource.present? && errors.present?
      end

      def render_backdrop
        color_class = error ? "bg-rose-100" : "bg-hippie-pink-100"

        span class: "absolute inset-0 translate-x-1 translate-y-1 transition-transform " \
                    "group-hover:translate-x-0 group-hover:translate-y-0 #{color_class}"
      end

      def render_field
        form.public_send(
          :"#{type}_field",
          attribute,
          value: resource&.public_send(attribute),
          class: field_class,
          placeholder: t(".").is_a?(Hash) ? t(".#{attribute}") : t("."),
          required: required
        )
      end

      def field_class
        base = "w-full relative inline-block border-1 border-black p-4 pe-12 text-sm shadow-sm"
        shadow = error ? "shadow-rose-300" : "shadow-hippie-pink-300"
        "#{base} #{shadow}"
      end

      def render_icon
        render Icon.new(form:, type:, error:) if icon
      end

      def render_error
        render Error.new(form:, error:) if error.present?
      end

    end

  end

end
