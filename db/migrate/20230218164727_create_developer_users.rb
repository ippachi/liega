class CreateDeveloperUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :developer_users, id: :string do |t|
      t.references :user, foreign_key: true, type: :string, null: false, index: { unique: true }
    end
  end
end
