class EntitiesController < ApplicationController
  load_and_authorize_resource
  
  before_action :set_entity, only: [:dashboard, :edit, :show, :update]

  def index
    @entities = Search.by(Entity.all, filter_params)
  end

  def dashboard
    @active_offers = @entity.offers.active
    @inactive_offers = @entity.offers.inactive
  end

  def new
    @entity = Entity.new
  end

  def edit ; end

  def show
    @active_offers = @entity.offers.active
  end

  def create
    @entity = Entity.new(entity_params)

    log_in @entity if @entity.save

    respond_with @entity
  end

  def update
    @entity.update_attributes(entity_params.except!(:password, :password_confirmation))

    respond_with @entity
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(
      :email, :password, :password_confirmation, :name, :address, :zipcode,
      :place, :site, :nif, :professional_activity, :presentation, :contact,
      :other_contact, :photo)
  end

  def filter_params
    if params[:filter]
      params.require(:filter).permit(:by_name, :professional_activity, :place)
    end
  end
end
