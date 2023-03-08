# frozen_string_literal: true

class CreateDeveloperUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :developer_users do |t|
      t.string :code, null: false, index: { unique: true }
      t.references :user, foreign_key: true, type: :string, index: { unique: true }
    end
  end
end
