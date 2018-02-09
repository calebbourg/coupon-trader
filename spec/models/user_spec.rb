require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user, balance: 15.00) }
  describe '#update_balance' do
    it 'adds to balance' do
      user.update_balance(4.00)
      expect(user.balance).to eq(19.00)
    end

    it 'subtracts balance' do
      user.update_balance(-8.00)
      expect(user.balance).to eq(7.00)
    end

    it 'cannot create have balance less than 0' do
      user.update_balance(-20)
      expect(user.errors.full_messages).to include("Balance Cannot be negative")
    end
  end
end
