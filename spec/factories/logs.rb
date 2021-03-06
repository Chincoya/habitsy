# frozen_string_literal: true

FactoryBot.define do
  factory :log do
    user { User.last }
    habit { 'Coding' }
    activity { nil }
    time { 100 }
  end
end
