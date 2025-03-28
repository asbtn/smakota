class Components::Form::Input < Components::Form::Base
  register_output_helper :inline_svg_tag

  def initialize(**options)
    super
    @attribute = options[:attribute]
    @field = options[:field] || attribute
    @icon = options[:icon]
    @required = options.fetch :required, false
  end

  def view_template
    div do
      render Components::Form::Label.new(form: form, attribute: attribute)

      div class: "group w-full relative inline-block focus:ring-3 focus:outline-hidden" do
        span class: "absolute inset-0 translate-x-1 translate-y-1 transition-transform group-hover:translate-x-0 group-hover:translate-y-0 #{ error ? 'bg-rose-100' : 'bg-mindaro-100' }"

        raw safe(
          form.public_send(:"#{field}_field",
            attribute,
            value: object&.public_send(attribute),
            class: "w-full relative inline-block border-1 border-black p-4 pe-12 text-sm shadow-sm #{ error ? 'shadow-rose-300' : 'shadow-mindaro-300' }",
            placeholder: t(".#{attribute}"),
            required: required
          )
        )

        span class: "absolute inset-y-0 end-0 grid place-content-center px-4" do
          inline_svg_tag "icons/#{field}.svg", class: error ? "text-rose-700" : "text-mindaro-700" if icon
        end
      end

      small(class: "text-rose-300 italic") { error.first } if error.present?
    end
  end

  private

  attr_reader :attribute, :field, :icon, :required

  delegate :object, to: :form
  delegate :errors, to: :object

  def error
    @error ||= begin
      return if object.blank? || errors.blank?

      errors[attribute].presence
    end
  end
end
