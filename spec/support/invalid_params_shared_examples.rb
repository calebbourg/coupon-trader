require 'rails_helper'

RSpec.shared_examples 'invalid params' do 
  context 'with invalid params' do
  	let(:user) { create(:user, email: 'new@email.com') }
	it 'responds with 422 and error message' do
	  send(verb, route, headers: authenticated_header(user), params: params)
	  expect(JSON.parse(response.body)).to be_an(Array)
	  expect(JSON.parse(response.body)).to include(be_an(String))
	end
  end
end