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

  private

  def coupon_params
    params.require(:coupon).permit(:value, :brand_id)
  end
end