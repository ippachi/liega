# frozen_string_literal: true

class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects, id: :string do |t|
      t.string :name, null: false
      t.integer :lock_version, null: false, default: 0
    end
  end
end
