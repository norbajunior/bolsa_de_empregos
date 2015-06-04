class CandidatesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]

  before_action :set_candidate, only: [:edit, :show, :update]

  def index
    @candidates = Candidate.all
  end

  def new
    @candidate = Candidate.new
  end

  def edit ; end

  def show ; end

  def create
    @candidate = Candidate.new(candidate_params)

    log_in @candidate if @candidate.save

    respond_with @candidate
  end

  def update
    @candidate.update_attributes(candidate_params)

    respond_with @candidate
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:email, :password, :password_confirmation, :name,
      :address, :zipcode, :place, :site, :date_of_birth, :identity_number, :cv,
      :professional_area, :contact, :other_contact, :scholarity, :education, :presentation,
      :employment_status, :experience)
  end
end
