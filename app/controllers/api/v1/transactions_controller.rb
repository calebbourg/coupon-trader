module Api
  module V1
    class TransactionsController < ApplicationController


      def create
        @requester = current_user
        @coupon = Coupon.find(params[:coupon_id])
        @poster = @coupon.user
        @transaction = Transaction.new(coupon_id: @coupon.id, poster_id: @poster.id, requester_id: @requester.id)
        if @transaction.save
        	render json: @transaction, status: 201
        else
        	render json: @transaction.errors.full_messages, status: 422
        end
      end
    end
  end
end