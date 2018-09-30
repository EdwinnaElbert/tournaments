# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    phone { Faker::Alphanumeric.alphanumeric(10) }
    email { Faker::Internet.email }
    first_name { Faker::Alphanumeric.alphanumeric(10) }
    last_name { Faker::Alphanumeric.alphanumeric(10) }
    confirmed_at { Faker::Date.between(2.days.ago, Date.today) }
    password { Faker::Internet.password }
  end
end
