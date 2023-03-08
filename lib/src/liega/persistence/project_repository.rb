# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectRepository < Repository
      self.active_record = Project

      def find(code)
        relation = Project.find_by!(code:)
        attributes = aggregate_root_attributes(relation)
        project_members = relation.project_members.map { _1.slice(:user_id, :role).symbolize_keys }
        Domain::Model::Project.new(**attributes.except(:id), members: project_members)
      end

      def save(project, lock_version = nil)
        save_relation(project, project.to_h.except(:members), lock_version) do |relation|
          update_members(project, relation)
        end
      end

      private

      def update_members(project, relation)
        relation.project_members.each { _1.active_project_member.destroy! }

        project.to_h[:members].each do |member|
          project_member = relation.project_members_with_inactive.find_or_initialize_by(user_id: member[:user_id],
                                                                                        project: relation)
          project_member.assign_attributes(role: member[:role])
          project_member.save!

          project_member.create_active_project_member
        end
      end
    end
  end
end
