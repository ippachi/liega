class CreateActiveProjectMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :active_project_members do |t|
      t.references :project_member, null: false, index: true
    end
  end
end
