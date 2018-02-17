require 'rails_helper'


RSpec.describe '/user_token' do
  
  let(:user) { create(:user) }
  let(:valid_params) { { email: user.email, password: user.password } }
  let(:invalid_params) { { email: 'invalid@email.com', password: 'invalid_password' } }

  context 'valid params' do
    
    it 'returns a jwt' do
      post '/api/v1/user_token', params: { auth:  valid_params  }
      expect(response).to be_success
      expect(JSON.parse(response.body)).to include({'jwt' => be_an(String)})
    end
  end

  context 'invalid params' do
    
    it 'returns an error message' do
      post '/api/v1/user_token', params: { auth: invalid_params }
      expect(response).to_not be_success
    end
  end
end