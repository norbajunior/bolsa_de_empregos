class EntitiesController < ApplicationController
  load_and_authorize_resource

  before_action :set_entity, only: [:dashboard, :edit, :show, :update]

  def index
    @entities = Search.by(Entity.all, filter_params).page(params[:page])
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

    if @entity.save
      log_in @entity ; flash[:notice] = 'Entidade criado com sucesso'
    end

    respond_with @entity, location: [:dashboard, @entity]
  end

  def update
    if @entity.update_attributes(entity_params.except!(:password, :password_confirmation))
      flash[:notice] = 'Entidade atualizada com sucesso'
    end

    respond_with @entity, location: [:dashboard, @entity]
  end

  private

  def set_entity
    @entity = Entity.find(params[:id])
  end

  def entity_params
    params.require(:entity).permit(
      :email, :password, :password_confirmation, :name, :address, :zipcode,
      :place, :site, :nif, :professional_activity, :presentation, :contact,
      :other_contact, :photo, :photo_cache)
  end

  def filter_params
    if params[:filter]
      params.require(:filter).permit(:query, :professional_activity, :place)
    end
  end
end
