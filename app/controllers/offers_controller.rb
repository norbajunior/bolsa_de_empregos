class OffersController < ApplicationController
  before_action :authenticate_entity!, only: [:new, :create, :edit, :udate, :destroy]
  before_action :authenticate_offers_entity!, only: [:edit, :update, :destroy]

  def index
    @offers = Search.by(Offer.all, filter_params)
  end

  def show
  end

  def new
    @offer = Offer.new
  end

  def edit ; end

  def create
    @offer = current_user.offers.new(offer_params)

    @offer.save

    respond_with @offer, notice: I18n.t('flash.notice', model: I18n.t('activemodel.models.offer'))
  end

  def update
    @offer.update(offer_params)

    respond_with @offer, notice: I18n.t('flash.update_notice', model: I18n.t('activemodel.models.offer'))
  end

  def destroy
    @offer.destroy

    respond_with @offer
  end

  private

  def filter_params
    if params[:filter]
      params.require(:filter).permit(:title, :professional_activity, :place)
    end
  end

  def offer_params
    params.require(:offer).permit(:title, :start_at, :end_at, :description,
                                  :photo, :professional_activity, :contract, :active, :salary)
  end

  def authenticate_offers_entity!
    @offer = Offer.find(params[:id])

    not_found if current_entity.id != @offer.entity_id
  end
end
