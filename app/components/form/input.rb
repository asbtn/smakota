class Components::Form::Input < Components::Form::Base
  register_output_helper :inline_svg_tag

  def initialize(form:, attribute:, field: attribute, icon: false)
    super(form:)
    @attribute = attribute
    @field = field
    @icon = icon
  end

  def view_template
    div do
      render Components::Form::Label.new(form:, attribute:)

      div class: "group w-full relative inline-block focus:ring-3 focus:outline-hidden" do
        span class: "absolute inset-0 translate-x-1 translate-y-1 bg-mindaro-100 transition-transform group-hover:translate-x-0 group-hover:translate-y-0"
        raw safe(
          form.public_send(:"#{field}_field",
            attribute,
            class: "w-full relative inline-block border-1 border-black p-4 pe-12 text-sm shadow-sm shadow-mindaro-300",
            placeholder: t(".#{attribute}")
          )
        )
        span class: "absolute inset-y-0 end-0 grid place-content-center px-4" do
          inline_svg_tag "icons/#{field}.svg", class: "text-mindaro-700" if icon
        end
      end
    end
  end

  private

  attr_reader :field, :attribute, :icon
end
