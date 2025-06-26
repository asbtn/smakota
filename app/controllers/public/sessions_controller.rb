# frozen_string_literal: true

module Public

  class SessionsController < ApplicationController

    def new
      render Views::Sessions::New.new
    end

    def create
      if (user = User.authenticate_by(params.permit(:email_address, :password)))
        start_new_session_for user
        redirect_to after_authentication_url
      else
        redirect_to new_session_path, alert: t(".invalid_credentials")
      end
    end

    def destroy
      terminate_session
      redirect_to new_session_path
    end

  end

end
