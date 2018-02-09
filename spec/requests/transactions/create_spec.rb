require 'rails_helper'

RSpec.describe 'Transaction Create' do 
  let(:poster) { create(:user) }
  let(:requester) { create(:user) }
  let(:coupon) { create(:coupon) }
  context 'with valid params' do
    it 'creates a new transaction' do
      expect do
        post "/coupons/#{coupon_id}/transactions", headers: authenticated_header(user), params: { transaction: valid_params }
      end 
    end
  end
  it_behaves_like 'secured route', '/coupons/1/transactions', :post, FactoryBot.attributes_for(:transaction)
end