FactoryBot.define do
  factory :starred_project do
    code { ULID.generate }
    project_member
  end
end
