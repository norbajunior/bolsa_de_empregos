class Candidates::RegistrationsController < ApplicationController
  before_action :set_candidate, only: [:edit, :show, :update]

  def new
    @candidate = Candidate.new
  end

  def edit ; end

  def show ; end

  def create
    @candidate = Candidate.create(candidate_params)

    respond_with @candidate, location: candidates_registration_path(@candidate)
  end

  def update
    @candidate.update_attributes(candidate_params)

    respond_with @candidate, location: candidates_registration_path(@candidate)
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:email, :password, :password_confirmation, :name,
      :address, :zipcode, :place, :site, :date_of_birth, :identity_number, :cv,
      :professional_area, :scholarity, :education, :employment_status, :experience)
  end
end
