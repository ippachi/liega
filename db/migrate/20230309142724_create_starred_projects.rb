class CreateStarredProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :starred_projects do |t|
      t.string :code, null: false, index: { unique: true }
      t.references :user, foreign_key: true, null: false
      t.references :project, foreign_key: true, null: false
      t.index %i[user_id project_id], unique: true
    end
  end
end
