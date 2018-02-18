module Api
  module V1
    class CouponsController < ApplicationController
      
      def create
        @user = current_user
        @coupon = @user.coupons.build(coupon_params)
        if @coupon.save
        	render json: @coupon, status: 201
        else
        	render json: @coupon.errors.full_messages, status: 422
        end
      end

      def index 
        @user_own_coupons = current_user.coupons
        @requestable_coupons = Coupon.where.not(user_id: current_user.id)
        data = { userOwnCoupons: @user_own_coupons, requestableCoupons: @requestable_coupons, userBalance: current_user.balance }.to_json
        render json: data, status: 200
      end

      private

      def coupon_params
        params.require(:coupon).permit( :name, :value, :brand)
      end
    end
  end
end