require 'faker'
FactoryBot.define do
  factory :user, aliases: [:poster, :requester] do
    name Faker::Name.name
    email Faker::Internet.email
    password 'password'
    password_confirmation 'password'
    balance 100
  end
end
