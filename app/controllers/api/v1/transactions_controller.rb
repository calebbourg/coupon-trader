module Api
  module V1
    class TransactionsController < ApplicationController


      def create
        @requester = current_user
        @coupon = Coupon.find(params[:coupon_id])
        @poster = @coupon.user
        if @requester.balance >= @coupon.value
          @result = ::TransactionsService.call(@coupon, @requester, @poster)
          if @result.status == 'success'
          	render json: @result.transaction, status: 201
          else
          	render json: @result.transaction.errors.full_messages, status: 422
          end
        else
          render json: @coupon, status: 422
        end
      end
    end
  end
end