# frozen_string_literal: true

Bullet.add_safelist type: :unused_eager_loading, class_name: "Project", association: :starred_projects
Bullet.add_safelist type: :unused_eager_loading, class_name: "StarredProject", association: :project_member
Bullet.add_safelist type: :unused_eager_loading, class_name: "ProjectMember", association: :starred_project
