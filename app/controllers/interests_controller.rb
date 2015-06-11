class InterestsController < ApplicationController
  load_and_authorize_resource
  
  def create
    user = User.find(interest_params[:user_id])

    interest = Interest.new(interested: current_user, user: user)

    if interest.save
      render json: interest, status: :created
    else
      render json: interest.errors, status: 422
    end
  end

  def destroy
    interest = Interest.find(params[:id])

    if interest.destroy
      head :no_content, status: 204
    else
      render json: interest.errors
    end
  end

  private

  def interest_params
    params.require(:interest).permit(:user_id)
  end
end
