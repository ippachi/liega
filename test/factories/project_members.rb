FactoryBot.define do
  factory :project_member do
    project
    user
    role { "normal" }

    active_project_member { association :active_project_member, project_member: instance }
  end
end
