require 'rails_helper'

RSpec.describe 'Transaction Create' do 
  let(:poster) { create(:user, email: 'email2@email.com') }
  let(:requester) { create(:user, email: 'email1@email.com', balance: 100.00) }
  let(:coupon) { create(:coupon, value: 50.00, user_id: poster.id) }
  let(:marketplace) { create(:marketplace_client) }
  context 'with valid params' do
    it 'creates a new transaction' do
      expect do
        post "/api/v1/coupons/#{coupon.id}/transactions", headers: authenticated_header(requester)
      end.to change { Transaction.count }.by(1) 
    end

    it 'allocates 5 percent to the marketplace' do
      expect(requester.balance).to eq(100)
      expect(poster.balance).to eq(100)
      expect do
        post "/api/v1/coupons/#{coupon.id}/transactions", headers: authenticated_header(requester)
      end.to change { marketplace.reload.revenue }.by(coupon.value * 0.05)
      expect(requester.reload.balance).to eq(50)
      expect(poster.reload.balance).to eq(147.5)
    end
  end

  context 'requester does not have enough balance' do
    it 'does not allow transaction to take place' do
      requester.update(balance: 35.00)
      post "/api/v1/coupons/#{coupon.id}/transactions", headers: authenticated_header(requester)
      expect(response).to_not be_success
    end
  end
  it_behaves_like 'secured route', '/api/v1/coupons/1/transactions', :post, FactoryBot.attributes_for(:transaction)
end