require 'rails_helper'
RSpec.describe '/users' do
  context 'when the user request goes with correct url and params' do 
    let(:params) do
      {
        user: {
          email: 'p1@gmail.com',
          password: '1234567',
          confirm_password: '1234567'
        }
      }
    end
    before(:example) { post '/users', params: params }
    it 'when the params are  correct' do

    end
  end
end

# RED
# when executed the above spec threw an error
# ActionController::RoutingError: No route matches [POST] "/users"
# so i need to generated the users controller

