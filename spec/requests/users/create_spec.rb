require 'rails_helper'


RSpec.describe 'User create', type: :request do
  let(:valid_params) { attributes_for(:user) }
  let(:invalid_params) { attributes_for(:user, password_confirmation: 'wrong_password') }

  context 'valid params' do  
    it 'persists a new user' do
      expect do 
        post '/users', params: { user: valid_params }
      end.to change { User.count }.by(1)
    end
  end

  context 'invalid params' do
    it 'responds with 422 and error message' do
      post '/users', params: { user: invalid_params }
      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body)).to be_an(Array)
      expect(JSON.parse(response.body)).to include(be_an(String))

    end
  end

end