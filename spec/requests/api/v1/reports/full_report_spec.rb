require 'rails_helper'


RSpec.describe 'Reports full_report' do


  
  context 'with valid params' do
    it 'generates report information' do
      @user1 = create(:user, email: 'user1@email.com')
	  @user2 = create(:user, email: 'user2@email.com')
	  @transaction1 = create(:transaction, poster_id: @user1.id, requester_id: @user2.id)
	  @marketplace = create(:marketplace_client)
      get '/api/v1/reports/full_report', headers: authenticated_header(@user1)
      expect(JSON.parse(response.body).keys).to eq(["users", "transactions", "marketplace"])
    end
  end

  it_behaves_like 'secured route', '/api/v1/reports/full_report', :get
end