# frozen_string_literal: true

module Public

  class ApplicationController < ActionController::Base

    layout -> { Components::Layouts::Public }

    include Authentication

    rate_limit to: 100, within: 3.minutes, with: lambda {
      redirect_to landing_path, alert: t("shared.try_again_later")
    }
    redirect_if_authenticated
    allow_unauthenticated_access

    # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
    allow_browser versions: :modern

  end

end
