# frozen_string_literal: true

FactoryBot.define do
  factory :log do
    user { nil }
    habit { 'Coding' }
    time { 100 }
  end
end
