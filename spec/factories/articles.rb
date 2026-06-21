# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    user    { create(:user) }
    title   { Faker::Lorem.sentence(word_count: 4) }
    body    { Faker::Lorem.paragraphs(number: 3).join("\n\n") }
    active  { Faker::Boolean.boolean }
  end
end
