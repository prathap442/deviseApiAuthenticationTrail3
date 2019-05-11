require 'rails_helper'
# frozen_string_literal: true

RSpec.describe User, type: :model do
  context 'validations' do
    it 'validates email presence' do 
      is_expected.to validate_presence_of(:email)
    end
    it 'validates email Uniqueness' do 
      u1 = User.create(email: 'p1@gmail.com', password: '1234567', password_confirmation: '1234567')
      u2 = User.create(email: 'p1@gmail.com', password: '1234567', password_confirmation: '1234567')
      expect(u2.errors.full_messages).to include('Email has already been taken')
    end
    it 'validates password length' do 
      u1 = User.create( email: 'p1@gmail.com', password: '12', password_confirmation: '1234567')
      expect(u1.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  end
end
