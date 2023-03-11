FactoryBot.define do
  factory :developer_user do
    code { ULID.generate }
  end
end
