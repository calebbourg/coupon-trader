class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def create
    @user = User.new(user_params)
    if @user.save
    	render json: @user, status: 200
     else
     	render json: @user.errors.full_messages, status: 422
     end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end