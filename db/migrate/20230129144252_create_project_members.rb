class CreateProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :project_members do |t|
      t.references :user, id: :string, null: false, index: true
      t.references :project, id: :string, null: false, index: true
      t.string :role, null: false

      t.index %i[user_id project_id], unique: true
    end
  end
end
