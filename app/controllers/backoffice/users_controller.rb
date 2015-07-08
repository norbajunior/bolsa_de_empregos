class Backoffice::UsersController < Backoffice::BaseController
  before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.by(filter_params).page(params[:page])
  end

  def new
    @user = Backoffice.new
  end

  def show ; end

  def edit ; end

  def edit_password ; end

  def create
    @user = Backoffice.new(user_params)

    flash[:notice] = 'Utilizador criado com sucesso' if @user.save

    respond_with @user, location: backoffice_user_path(@user)
  end

  def update
    flash[:notice] = 'Utilizador atualizado com sucesso' if @user.update(user_params)

    respond_with @user, location: backoffice_user_path(@user)
  end

  def update_password
    if @user.update(password_params)
      flash[:notice] = 'Password alterada com sucesso'

      redirect_to backoffice_user_path(@user)
    else
      render 'edit_password'
    end
  end

  def destroy
    if current_user.id == params[:id].to_i
      @user.errors.add(:base, :cant_destroy_current_user)
    else
      begin
        @user.destroy
      rescue ActiveRecord::DeleteRestrictionError
        @user.errors.add(:base, :"#{@user.type.underscore}_is_associated_with_applications")
      end
    end

    respond_with @user, location: backoffice_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :active)
  end

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

  def filter_params
    params.require(:filter).permit(:by_name, :type) if params[:filter]
  end

  def set_user
    @user = User.find(params[:id])
  end
end
