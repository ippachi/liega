# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:project_members) do
      primary_key :id
      foreign_key :user_id, :users, type: String, null: false
      foreign_key :project_id, :projects, type: String, null: false
      String :role, null: false

      unique %i[user_id project_id]
    end

    create_table(:active_project_members) do
      foreign_key :project_member_id, :project_members, null: false, primary_key: true
    end
  end

  down do
    drop_table(:active_project_members)
    drop_table(:project_members)
  end
end
