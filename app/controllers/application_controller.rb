# frozen_string_literal: true

class ApplicationController < ActionController::Base

  layout -> { Components::Layouts::Application }

  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

end
