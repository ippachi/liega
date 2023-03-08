# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :code, null: false, index: { unique: true }
      t.references :backlog, foreign_key: true, null: false, index: true
      t.string :summary, null: false
      t.integer :lock_version, null: false, default: 0
    end
  end
end
