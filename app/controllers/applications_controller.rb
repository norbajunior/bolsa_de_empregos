class ApplicationsController < ApplicationController
  load_and_authorize_resource

  def create
    offer = Offer.find(application_params[:offer_id])

    application = Application.new(candidate: current_user, offer: offer)

    if application.save
      render json: application, status: :created
    else
      render json: application.errors, status: 422
    end
  end

  def destroy
    application = Application.find(params[:id])

    if application.destroy
      render json: application.offer_id, status: 202
    else
      render json: application.errors
    end
  end

  private

  def application_params
    params.require(:application).permit(:offer_id)
  end
end
