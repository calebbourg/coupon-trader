module Api
  module V1
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

      def update_balance
        @user = current_user
        if params[:balance_change]
          @result = BalanceService.call(@user, params)
          if @result.success?
          	render json: @user, status: 204
          else
          	render json: @result.error_messages, status: 422
          end
        else
          render json: @user, status: 200
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end