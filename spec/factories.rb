FactoryBot.define do
  factory :user,class: 'User' do
    email { Faker::Internet.email }
    password {'4309293804'}
    password_confirmation {'4309293804'}
  end
end
