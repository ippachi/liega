# frozen_string_literal: true

class CreateStarredProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :starred_projects do |t|
      t.string :code, null: false, index: { unique: true }
      t.references :project_member, foreign_key: true, null: false
    end
  end
end
