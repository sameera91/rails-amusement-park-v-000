class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    #binding.pry
    #@user.tickets = @user.tickets - @attraction.tickets
  end

  private

    def user_params
      params.require(:user).permit(:name, :happiness, :nausea, :height, :tickets, :admin)
    end
end