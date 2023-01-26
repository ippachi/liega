# frozen_string_literal: true

Sequel.migration do
  up do
    create_table(:projects) do
      String :id, primary_key: true
      String :name, null: false
      foreign_key :leader_id, :users, type: String, null: false
    end
  end

  down do
    drop_table(:projects)
  end
end
