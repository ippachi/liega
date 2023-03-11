FactoryBot.define do
  factory :project do
    code { ULID.generate }
    sequence(:name) { |i| "project #{i}" }
  end
end
