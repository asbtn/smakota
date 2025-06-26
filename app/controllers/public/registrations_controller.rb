# frozen_string_literal: true

module Public

  class RegistrationsController < ApplicationController

    def new
      @user = User.new

      render Views::Registrations::New.new(user: @user)
    end

    def create
      @user = User.new user_params

      respond_to do |format|
        if @user.save
          start_new_session_for(@user)

          format.html { redirect_to pantry_path }
        else
          format.html { render Views::Registrations::New.new(user: @user), status: :unprocessable_entity }
        end
      end
    end

    private

    def user_params
      params.expect(user: %i[name email_address password password_confirmation])
    end

  end

end
