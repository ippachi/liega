# frozen_string_literal: true

class CreateActiveProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :active_project_members do |t|
      t.references :project_member, foreign_key: true, null: false, index: { unique: true }
    end
  end
end
