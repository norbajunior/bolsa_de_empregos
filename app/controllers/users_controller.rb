class UsersController < ApplicationController
  def new
    authorize! :new, User
  end
end
