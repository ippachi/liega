# frozen_string_literal: true

module Liega
  module Persistence
    class StarredProjectRepository < Repository
      self.active_record = StarredProject

      def find(code)
        starred_project = StarredProject.find_by!(code:)
        user_code = starred_project.user.code
        project_code = starred_project.project.code
        attributes = aggregate_root_attributes(starred_project).except(:user_id, :project_id)
        Domain::Model::StarredProject.new(**attributes, user_code:, project_code:)
      end

      def save(starred_project, lock_version = nil)
        user_id = User.find_by!(code: starred_project.user_code).id
        project_id = Project.find_by!(code: starred_project.project_code).id
        save_relation(starred_project, { code: starred_project.code, user_id:, project_id: }, lock_version)
      end
    end
  end
end
