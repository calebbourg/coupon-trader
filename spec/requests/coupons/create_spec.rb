require 'rails_helper'

RSpec.describe 'Coupons create' do
  let(:user) { create(:user) }
  let(:valid_params) { attributes_for(:coupon, user_id: user.id) }
  let(:invalid_params) { attributes_for(:coupon, user_id: user.id,  value: nil) }
  
    it_behaves_like 'secured route', '/coupons', :post, FactoryBot.attributes_for(:coupon)
    it_behaves_like 'invalid params' do
      let(:route) { '/coupons' }
      let(:verb) { :post }
      let(:params) { { coupon: FactoryBot.attributes_for(:coupon, value: nil) } }
    end

  	context 'with valid params' do
      it 'creates a new coupon' do
        expect do
          post '/coupons', headers: authenticated_header(user), params: { coupon: valid_params }
        end.to change { Coupon.count }.by(1)
      end
    end
end