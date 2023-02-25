# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :string do |t|
      t.integer :lock_version, null: false, default: 0
    end
  end
end
