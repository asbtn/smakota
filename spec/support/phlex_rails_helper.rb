# frozen_string_literal: true

module PhlexRailsHelper

  def render(component)
    component.call
  end

  def render_fragment(component)
    html = render(component)
    Nokogiri::HTML5.fragment(html)
  end

  private

  def view_context
    controller.view_context
  end

  def controller
    @controller ||= ActionView::TestCase::TestController.new
  end

end

RSpec.configure do |config|
  config.include PhlexRailsHelper, type: :view
end
