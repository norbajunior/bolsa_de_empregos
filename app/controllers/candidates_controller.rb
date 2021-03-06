class CandidatesController < ApplicationController
  load_and_authorize_resource

  before_action :set_candidate, only: [:dashboard, :edit, :show, :update]

  respond_to :html, :js, only: [:index]

  def index
    @collection = Candidate.by(filter_params).page(params[:page])
  end

  def dashboard
  end

  def new
    @candidate = Candidate.new
  end

  def edit ; end

  def show ; end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      log_in @candidate ; flash[:notice] = 'Candidato registado com sucesso'
    end

    respond_with @candidate, location: dashboard_candidate_path(@candidate)
  end

  def update
    if @candidate.update_attributes(candidate_params.except(:password, :password_confirmation))
      flash[:notice] = 'Candidato atualizado com sucesso'
    end

    respond_with @candidate, location: dashboard_candidate_path(@candidate)
  end

  private

  def set_candidate
    @candidate = Candidate.find(params[:id])
  end

  def candidate_params
    params.require(:candidate).permit(:email, :password, :password_confirmation, :name,
      :address, :zipcode, :place, :site, :date_of_birth, :identity_number, :cv,
      :professional_area, :contact, :other_contact, :scholarity, :education, :presentation,
      :employment_status, :experience, :photo, :photo_cache, :cv_cache)
  end

  def filter_params
    if params[:filter].present?
      params.require(:filter).permit(:query, :place, :professional_area, :employment_status)
    end
  end
end
