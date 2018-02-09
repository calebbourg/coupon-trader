require 'rails_helper'

RSpec.shared_examples 'secured route' do |route, verb, params|
  
  context 'User is not authenticated' do
  	let(:user) { create(:user) }
    it 'does not allow  access to route' do
      send(verb, route, params: params)
      expect(response).to_not be_success
    end
  end
end 