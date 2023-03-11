# frozen_string_literal: true

module Liega
  module Persistence
    class StarredProjectRepository < Repository
      self.active_record = StarredProject

      def find(code)
        starred_project = StarredProject.find_by!(code:)
        user_code = starred_project.project_member.user.code
        project_code = starred_project.project_member.project.code
        create_instance(starred_project, user_code, project_code)
      end

      def find_by_user_and_project(user_code, project_code)
        user = User.find_by!(code: user_code)
        project = Project.find_by!(code: project_code)
        project_member = ProjectMember.find_by!(user:, project:)
        starred_project = StarredProject.find_by!(project_member:)
        create_instance(starred_project, user_code, project_code)
      end

      def find_by_user_and_project_or_nil(...)
        find_by_user_and_project(...)
      rescue ActiveRecord::RecordNotFound
        nil
      end

      def save(starred_project, lock_version = nil)
        if starred_project.destroyed?
          StarredProject.find_by!(code: starred_project.code).destroy!
        else
          user = User.find_by!(code: starred_project.user_code)
          project = Project.find_by!(code: starred_project.project_code)
          project_member = ProjectMember.find_by!(user:, project:)
          save_relation(starred_project, { code: starred_project.code, project_member: }, lock_version)
        end
        starred_project
      end

      private

      def create_instance(starred_project, user_code, project_code)
        attributes = aggregate_root_attributes(starred_project).except(:project_member_id)
        Domain::Model::StarredProject.new(**attributes, user_code:, project_code:)
      end
    end
  end
end
