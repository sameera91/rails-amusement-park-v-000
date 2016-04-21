class SessionsController < ApplicationController
  def new
    @users = User.all
  end

  def create
    @user = User.find_by(id: params[:user][:id])
    if params[:user][:id].nil? || params[:user][:id].empty?
      redirect_to signin_path
    elsif params[:user][:id]
      session[:user_id] = params[:user][:id]
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.clear
    redirect_to '/'
  end

end