# spec/features/external_request_spec.rb
require 'spec_helper'
require 'vcr'
require 'httparty'
RSpec.describe 'External request' do
  before(:example) { HTTParty.get('https://klocgold.myshopify.com/products').stub }
  it 'queries no. of products on the klocgold' do
    VCR.use_cassette('klocgold_products') do
      expect(response_obtained.body.class).to be(String)
    end
  end
end