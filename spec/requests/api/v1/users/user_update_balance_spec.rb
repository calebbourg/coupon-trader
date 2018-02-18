require 'rails_helper'

RSpec.describe 'User update balance' do
  let(:user) { create(:user) }

    it_behaves_like 'secured route', "/api/v1/users/update_balance", :put, { balance_change: 20 } 

    it 'allows user to add to balance' do
      expect(user.balance).to eq(0.0)
      put "/api/v1/users/update_balance", headers: authenticated_header(user), params: { balance_change: 20 }
      expect(response).to be_success
      expect(user.reload.balance).to eq(20.0)
    end

    it 'allows user to subtract from balance' do
      user.update(balance: 20.0)
      put "/api/v1/users/update_balance", headers: authenticated_header(user), params: { balance_change: -15 }
      expect(response).to be_success
      expect(user.reload.balance).to eq(5.00)
    end
end