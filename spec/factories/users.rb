# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email_address { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
