require 'rails_helper'

RSpec.describe 'Coupons create' do
  let(:user) { create(:user) }
  let(:coupon) { create(:coupon, user_id: user.id) }
  let(:valid_params) { attributes_for(:coupon, user_id: user.id) }
  let(:invalid_params) { attributes_for(:coupon, user_id: user.id,  value: nil) }
  context 'user is authenticated' do
  	context 'with valid params' do
      it 'creates a new coupon' do
        expect do
          post '/coupons', headers: authenticated_header(user), params: { coupon: valid_params }
        end.to change { Coupon.count }.by(1)
      end
    end

    context 'with invalid params' do
      it 'responds with 422 and error message' do
        post '/coupons', headers: authenticated_header(user), params: { coupon: invalid_params }
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)).to be_an(Array)
        expect(JSON.parse(response.body)).to include(be_an(String))
      end
    end
  end
  
  context 'User is not authenticated' do
    it 'does not allow user to update balance' do
      post '/coupons', params: { coupon: valid_params }
      expect(response).to_not be_success
    end
  end
end