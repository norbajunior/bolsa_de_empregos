class OffersController < ApplicationController
  load_and_authorize_resource

  def index
    @offers = Search.by(Offer.active.includes(:entity), filter_params).page(params[:page])
    @current_candidate_applications = current_candidate.try(:applications)
  end

  def show
    @offer = Offer.find(params[:id])
    @similar_offers = Offer.similar_offers(@offer)
  end

  def new
    @offer = current_user.offers.new
  end

  def edit ; end

  def create
    @offer = current_user.offers.new(offer_params)

    flash[:notice] = 'Oferta criada com sucesso' if @offer.save

    respond_with @offer
  end

  def update
    flash[:notice] = 'Oferta atualizada com sucesso' if @offer.update(offer_params)

    respond_with @offer
  end

  def destroy
    @offer.destroy

    respond_with @offer
  end

  private

  def filter_params
    if params[:filter]
      params.require(:filter).permit(:query, :professional_activity, :place)
    end
  end

  def offer_params
    params.require(:offer).permit(:title, :start_at, :end_at, :description,
                                  :photo, :professional_activity, :contract, :active, :salary)
  end
end
