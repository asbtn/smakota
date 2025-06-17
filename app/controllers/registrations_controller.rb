# frozen_string_literal: true

class RegistrationsController < ApplicationController

  allow_unauthenticated_access
  rate_limit to: 100, within: 3.minutes, only: :create, with: lambda {
    redirect_to new_registration_path, alert: t("shared.try_again_later")
  }
  redirect_if_authenticated

  def new
    @user = User.new

    render Views::Registrations::New.new(user: @user)
  end

  def create
    @user = User.new user_params

    respond_to do |format|
      if @user.save
        start_new_session_for(@user)

        format.html { redirect_to dashboard_path }
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
