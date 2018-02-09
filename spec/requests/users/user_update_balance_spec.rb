require 'rails_helper'


RSpec.describe 'User update balance' do
  let(:user) { create(:user) }
  context 'User is authenticated' do
    it 'allows user to add to balance' do
      expect(user.balance).to eq(0.0)
      put "/users/#{user.id}", headers: authenticated_header(user), params: { balance_change: 20 }
      expect(response).to be_success
      expect(user.reload.balance).to eq(20.0)
    end

    it 'allows user to subtract from balance' do
      user.update(balance: 20.0)
      put "/users/#{user.id}", headers: authenticated_header(user), params: { balance_change: -15 }
      expect(response).to be_success
      expect(user.reload.balance).to eq(5.00)
    end
  end

  context 'User is not authenticated' do
    it 'does not allow user to update balance' do
      put "/users/#{user.id}", params: { balance_change: 20 }
      expect(response).to_not be_success
    end
  end
end