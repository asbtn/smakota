class Components::Form::Base < Components::Base
  def initialize(**options)
    @form = options[:form]
  end

  private

  attr_reader :form
end
