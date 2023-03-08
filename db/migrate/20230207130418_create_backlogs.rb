# frozen_string_literal: true

class CreateBacklogs < ActiveRecord::Migration[7.0]
  def change
    create_table :backlogs do |t|
      t.string :code, null: false, index: { unique: true }
      t.references :project, foreign_key: true, type: :string, null: false, index: { unique: true }
      t.integer :lock_version, null: false, default: 0
    end
  end
end
