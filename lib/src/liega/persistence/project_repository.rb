# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectRepository < Repository
      self.active_record = Project

      def find(code)
        relation = Project.find_by!(code:)
        members = relation.project_members.map do |project_member|
          { user_code: project_member.user.code, role: project_member.role }
        end
        Domain::Model::Project.create(**aggregate_root_attributes(relation), members:)
      end

      def save(project, lock_version = nil)
        save_relation(project, project.serialize.except(:members), lock_version) do |relation|
          update_members(project, relation)
        end
      end

      private

      def update_members(project, relation)
        relation.project_members.each { _1.active_project_member.destroy! }

        project.serialize[:members].each do |member|
          user_id = User.find_by!(code: member[:user_code]).id
          project_member = relation.project_members_with_inactive.find_or_initialize_by(user_id:, project: relation)
          project_member.assign_attributes(role: member[:role])
          project_member.save!

          project_member.create_active_project_member!
        end
      end
    end
  end
end
