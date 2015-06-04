class EntitiesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]

  before_action :set_entity, only: [:edit, :show, :update]

  def index
    @entities = Entity.all
  end

  def new
    @entity = Entity.new
  end

  def edit ; end

  def show ; end

  def create
    @entity = Entity.create(entity_params)

    respond_with @entity
  end

  def update
    @entity.update_attributes(entity_params)

    respond_with @entity
  end

  private

  def entity_params
    params.require(:entity).permit(
      :email, :password, :password_confirmation, :name, :address, :zipcode,
      :place, :site, :nif, :professional_activity, :presentation, :contact,
      :other_contact)
  end

  def set_entity
    @entity = Entity.find(params[:id])
  end
end
