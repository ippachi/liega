# frozen_string_literal: true

module Liega
  module Persistence
    class ProjectRepository
      def find(id)
        attributes = Project.find(id).attributes.symbolize_keys
        project_members = ProjectMember.active.where(project_id: id).map { _1.slice(:user_id, :role).symbolize_keys }
        Domain::Model::Project.new(**attributes, members: project_members)
      end

      def save(project)
        attributes = project.to_h
        Project.upsert(attributes.slice(:id, :name))
        project_member_ids = update_project_members(attributes[:id], attributes[:members])
        update_active_project_members(attributes[:id], project_member_ids)
        project
      end

      private

      def update_project_members(project_id, members)
        member_attributes = members.map { { **_1, project_id: } }
        ProjectMember.upsert_all(member_attributes, unique_by: %i[user_id project_id]).to_a.pluck("id")
      end

      def update_active_project_members(project_id, project_member_ids)
        ActiveProjectMember.joins(:project_member).where(project_member: { project_id: }).destroy_all
        ActiveProjectMember.insert_all(project_member_ids.map { { project_member_id: _1 } })
      end
    end
  end
end
