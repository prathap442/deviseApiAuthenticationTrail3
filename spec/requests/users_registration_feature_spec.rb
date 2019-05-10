require 'rails_helper.rb'

RSpec.describe 'Request specs' do
  context 'when the user request goes with correct url and params', type: :request do
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
    it 'when the params are correct' do
      expect(response.content_type).to eq("application/json")
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['notice']).to eq('Succesfully Registered User')
    end
  end
  context 'when the user request goes with incorrect uri',type: :request do 
    before(:example) { get '/omniauth' }
    it 'when the uri is invalid' do
      expect(response.status).to eq(404)
    end
  end
end

# RED
# when executed the above spec threw an error
# ActionController::RoutingError: No route matches [POST] "/users"
# so i need to generated the users controller
