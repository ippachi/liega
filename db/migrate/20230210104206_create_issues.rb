# frozen_string_literal: true

class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues, id: :string do |t|
      t.references :backlog, type: :string, foreign_key: true, null: false, index: true
      t.string :summary, null: false
    end
  end
end
