# frozen_string_literal: true

class CreateProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_members do |t|
      t.references :user, foreign_key: true, null: false, index: true
      t.references :project, foreign_key: true, null: false, index: true
      t.string :role, null: false

      t.index %i[user_id project_id], unique: true
    end
  end
end
