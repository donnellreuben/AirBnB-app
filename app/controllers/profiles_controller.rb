# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    authorize @profile
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

private

  def profile_params
    params.require(:profile).permit(
      :first_name, :last_name, :address_1, :address_2, :city,
      :zip_code, :country_code, :picture
    )
  end
end
