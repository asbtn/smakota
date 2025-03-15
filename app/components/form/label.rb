class Components::Form::Label < Components::Form::Base
  def initialize(form:, attribute:)
    super(form:)
    @attribute = attribute
  end

  def view_template
    form.label attribute, class: "sr-only"
  end

  private

  attr_reader :attribute
end
