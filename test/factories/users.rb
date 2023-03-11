FactoryBot.define do
  factory :user do
    code { ULID.generate }
    developer_user
  end
end
