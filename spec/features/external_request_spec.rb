# spec/features/external_request_spec.rb
require 'spec_helper'
require 'httparty'
RSpec.describe 'External request' do
  it 'queries no. of products on the klocgold' do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')
    response = Net::HTTP.get(uri)
    expect(response.class).to be(String)
  end
end