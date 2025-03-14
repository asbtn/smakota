class Components::Form::Label < Components::Form::Base
  def initialize(form:, field:)
    super(form:)
    @field = field
  end

  def view_template
    form.label field, class: "sr-only"
  end

  private

  attr_reader :field
end
