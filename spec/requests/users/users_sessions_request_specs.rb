require 'rails_helper'
# frozen_string_literal: true

RSpec.describe 'users session creation and destroy', type: :request do
  def send_permitted_params(user)
    user_attributes = user.attributes
    h1 = Hash.new
    h1['email'] = user.email
    h1['password'] = user.password
    h1['password_confirmation'] = user.password
    h1.symbolize_keys
  end
  context 'when the sessions are being created' do
    let(:user_params) { FactoryBot.build(:user_session_params) }
    context 'when the password and email is correct' do
      it 'we expect that we are returned with jwt and confirmation' do
        user = FactoryBot.create(:user)
        user_attributes = send_permitted_params(user)
        post '/api/v1/users/sign_in.json', params: { user: user_attributes }
        expect(response.token).not_to be_empty
      end
    end
    context 'when the password and email are incorrect' do
    end
  end
  context 'when the sessions are being destroyed' do

  end
end
