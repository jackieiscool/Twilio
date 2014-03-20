class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    safe_params = params.require(:user).permit(:name, :phone)
    @user = User.new(safe_params)

    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end
end
