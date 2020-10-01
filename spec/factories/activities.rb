# frozen_string_literal: true

FactoryBot.define do
  factory :activity do
    habit { Faker::String.random(length: 6) }
    user { User.last }
  end
end
