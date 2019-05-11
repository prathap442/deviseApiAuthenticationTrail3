require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do
  include Devise::Test::ControllerHelpers
  # Controller specs features
  # It allows you to simulate a single http request in each example, and then
  # specify expected outcomes such as:
  # rendered templates
  # redirects
  # instance variables assigned in the controller to be shared with the view
  # cookies sent back with the response
  # To specify outcomes, you can use:
  
  # standard rspec matchers (expect(response.status).to eq(200))
  # standard test/unit assertions (assert_equal 200, response.status)
  # rails assertions (assert_response 200)
  # rails-specific matchers:
  before :each do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  let(:correct_params) do
    {
      user: {
        email: 'p1@gmail.com',
        password: '1234567',
        password_confirmation: '1234567'
      }
    }
  end
  let(:incorrect_params) do
    {
      user: {
        email: 'p1',
        password: '1234567',
        confirm_password: '1234567'
      }
    }
  end
  context 'when the params are correct' do
    before(:example) {
      post :create, params: correct_params
    }
    it 'successfully creates a correct user' do
      expect(response.status).to eq(201)
    end
    it 'render the json type whose response is of application/json format' do 
      expect(response.content_type).to eq('application/json')
    end
  end
  context 'when the params are incorrect' do
    before(:example) do
      post :create, params: incorrect_params 
    end
    it 'renders the json with errors in it' do
      expect(response.status).to eq(200)
      response_body = JSON.parse(response.body)
      errors = JSON.parse(response_body["errors"])
      expect(errors).not_to be_empty
    end
    it 'render the json type whose response is of application/json format' do 
      expect(response.content_type).to eq('application/json')
    end
  end
end
