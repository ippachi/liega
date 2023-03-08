# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :code, null: false, index: { unique: true }
      t.integer :lock_version, null: false, default: 0
    end
  end
end
