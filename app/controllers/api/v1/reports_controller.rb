module Api
  module V1
    class ReportsController < ApplicationController
      

      def full_report
        @users = User.all
        @transactions = Transaction.all
        @marketplace = MarketplaceClient.first_or_create! #may not have been created yet
        render json: {users: @users, transactions: @transactions, marketplace: @marketplace }.to_json, status: 200
      end
    end
  end
end