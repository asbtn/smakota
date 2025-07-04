# frozen_string_literal: true

class PasswordsController < ApplicationController

  allow_unauthenticated_access
  rate_limit to: 10, within: 3.minutes, only: :create, with: lambda {
    redirect_to new_password_path, alert: t("shared.try_again_later")
  }
  before_action :set_user_by_token, only: %i[edit update]
  redirect_if_authenticated

  def new
    render Views::Passwords::New.new
  end

  def edit
    render Views::Passwords::Edit.new(params[:token])
  end

  def create
    if (user = User.find_by(email_address: params[:email_address]))
      PasswordsMailer.reset(user).deliver_later
    end

    redirect_to new_session_path, notice: t(".notice")
  end

  def update
    if @user.update params.permit(:password, :password_confirmation)
      redirect_to new_session_path, notice: t(".notice")
    else
      redirect_to edit_password_path(params[:token]), alert: t(".alert")
    end
  end

  private

  def set_user_by_token
    @user = User.find_by_password_reset_token! params[:token]
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to new_password_path, alert: t(".alert")
  end

end
