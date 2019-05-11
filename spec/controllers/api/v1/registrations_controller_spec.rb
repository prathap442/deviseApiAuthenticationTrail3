require 'rails_helper'

RSpec.describe Api::V1::RegistrationsController, type: :controller do
    require 'rails_helper'

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
    context 'when the params are correct' do
        let(:correct_params) {
          {
            user: {
              email: 'p1@gmail.com',
              password: '1234567',
              password_confirmation: '1234567'
            }
          }
        }
        before(:example) {
          post :create, params: correct_params
        }
        it 'assings the things to the correct user' do
        end
    end
end
