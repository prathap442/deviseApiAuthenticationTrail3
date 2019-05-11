require 'rails_helper'
# frozen_string_literal: true

RSpec.describe 'routing for Users', type: :routing do
  it 'when the signup is going on' do
    expect(post('/api/v1/users')).to route_to('api/v1/registrations#create')
  end
end
