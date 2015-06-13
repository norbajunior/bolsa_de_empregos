class Backoffice::UsersController < Backoffice::BaseController
  before_action :set_user, except: [:index, :new, :create]
  before_action :set_params, only: [:update]

  def index
    @users = Search.by(User.all, filter_params).page(params[:page])
  end

  def new
    @user = Backoffice.new
  end

  def show ; end

  def edit ; end

  def edit_password ; end

  def create
    @user = Backoffice.new(user_params)

    if @user.save(context: :backoffice_create)
      flash[:notice] = 'Utilizador criado com sucesso'
    end

    respond_with @user, location: backoffice_user_path(@user)
  end

  def update
    if @user.save(context: :backoffice_update)
      flash[:notice] = 'Utilizador atualizado com sucesso'

      redirect_to backoffice_user_path(@user)
    else
      render 'edit'
    end
  end

  def update_password
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]

    if @user.save(context: :backoffice_update)
      flash[:notice] = 'Password alterada com sucesso'
    end

    respond_with @user, location: backoffice_user_path(@user)
  end

  def destroy
    @user.destroy

    respond_with @user, location: backoffice_users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :active)
  end

  def filter_params
    params.require(:filter).permit(:by_name, :type) if params[:filter]
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_params
    @user.name   = user_params[:name]
    @user.email  = user_params[:email]
    @user.active = user_params[:active]
  end
end
