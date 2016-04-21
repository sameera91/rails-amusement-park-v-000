class RidesController < ApplicationController

  def create
    @user = User.find(session[:user_id])
    @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id])
    message = @ride.message
    flash[:notice] = message
    @user = @ride.take_ride
    if @user.is_a?(String)
      flash[:notice] = @user
      redirect_to user_path(@ride.user_id)
    else
      redirect_to user_path(@user.id)
    end
  end
end