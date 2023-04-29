# frozen_string_literal: true

class PasswordsController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    authorize @user, policy_class: PasswordPolicy
  end

  def update
    @user = User.find(params[:id])
    authorize @user, policy_class: PasswordPolicy
    @user.update(password_params)
    bypass_sign_in(@user)
    redirect_to password_path(@user)
  end

private

  def password_params
    params.require(:password).permit(:password)
  end
end
