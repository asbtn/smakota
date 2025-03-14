class Components::Form::Base < Components::Base
  def initialize(form:)
    @form = form
  end

  private

  attr_reader :form
end
